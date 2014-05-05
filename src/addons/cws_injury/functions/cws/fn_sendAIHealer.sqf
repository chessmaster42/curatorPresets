// Authored by chessmaster42
// Based on 'A3 Wounding System' by Psychobastard

private ["_unit","_healer"];
_unit = _this select 0;
_healer = if (count _this > 1) then {_this select 1} else {nil};
_excludeUnit = if (count _this > 2) then {_this select 2} else {nil};

//If the unit is not defined, exit
if(isNull (_unit)) exitWith {};

//If the unit is no longer alive, exit
if(!alive _unit) exitWith {};

//If the unit is no longer in agony, exit
if(!(_unit getVariable "cws_ais_agony")) exitWith {};

//If the unit already has a healer, exit
if(!isNull (_unit getVariable "healer")) exitWith {};

//Wait a random amount of time to stagger AI behaviours
sleep (5 + random 2);

if(!isNil "_healer") then {
	if(cws_ais_debugging) then {
		[format ["%1 is calling for help from %2", _unit, _healer], 2] call ccl_fnc_ShowMessage;
	};
} else {
	if(cws_ais_debugging) then {
		[format ["%1 is calling for help!", _unit], 2] call ccl_fnc_ShowMessage;
	};
};

//If we got a closest squadmate in the function call but they are dead or in agony, remove them from the check
if (!isNil "_healer") then {
	_canHeal = [_healer] call cws_fnc_CanHeal;
	if (!_canHeal) then {
		_healer = nil;
	};
};

//If the unit is somehow trying to heal themselves, remove them from the check
if (!isNil "_healer") then {
	if(_unit == _healer) then {
		if(cws_ais_debugging) then {
			[format ["%1 somehow picked themselves for a healer ...", _unit], 2] call ccl_fnc_ShowMessage;
		};
		_healer = nil;
	};
};

_groupUnitsArray = units group _unit;
_squadMates = _groupUnitsArray - [_unit];

//If an excluded unit is defined, remove them from the included mates
if(!isNil "_excludeUnit") then {
	if(_excludeUnit in _squadMates) then {
		_squadMates = _squadMates - [_excludeUnit];
	};
};

//First loop through group check conditions:
//1. Must be closer than last unit
//2. Must NOT be a player
//3. Must be a medic
//4. Must have medical supplies
//5. Must be alive
//6. Must NOT be in agony
if (isNil "_healer") then {
	_min_distance = 100000;
	{
		_isMedic = _x call cws_fnc_isMedic;
		_distance = _unit distance _x;
		_canHeal = [_x] call cws_fnc_canHeal;
		if (_distance < _min_distance && {!isPlayer _x} && _isMedic && _canHeal) then {
			_min_distance = _distance;
			_healer = _x;
		};
	} foreach _squadMates;
};

//Second loop through group check conditions:
//1. Must be closer than last unit
//2. Must NOT be a player
//3. Must have a first aid kit
//4. Must be alive
//5. Must NOT be in agony
if (isNil "_healer") then {
	_min_distance = 100000;
	{
		_distance = _unit distance _x;
		_canHeal = [_x] call cws_fnc_canHeal;
		if (_distance < _min_distance && {!isPlayer _x} && _canHeal) then {
			_min_distance = _distance;
			_healer = _x;
		};
	} foreach _squadMates;
};

//First loop through faction check conditions:
//1. Must be within 500 meters
//2. Must be on the same side as _unit
//3. Must be closer than last unit
//4. Must NOT be a player
//5. Must have medical supplies
//6. Must be alive
//7. Must NOT be in agony
if (isNil "_healer") then {
	_min_distance = 500;
	_playerFaction = side (group _unit);
	{
		//Ensure that the group we're checking is on the same side as the injured unit
		if((side _x) == _playerFaction) then {
			{
				//If a unit exclusion is set, make sure we don't match against them
				if(!isNil "_excludeUnit") then {
					if(_x == _excludeUnit) then {_x = objnull};
				};
				if(isNull _x) exitWith {};

				_distance = _unit distance _x;
				_canHeal = [_x] call cws_fnc_canHeal;
				if (_distance < _min_distance && {!isPlayer _x} && _canHeal && (_unit != _x)) then {
					_min_distance = _distance;
					_healer = _x;
				};
			} foreach units _x;
		};
	} forEach allGroups;
};

//If the unit is somehow trying to heal themselves, remove them from the check
if (!isNil "_healer") then {
	if(_unit == _healer) then {
		if(cws_ais_debugging) then {
			[format ["%1 somehow picked themselves for a healer ...", _unit], 2] call ccl_fnc_ShowMessage;
		};
		_healer = nil;
	};
};

//If the closest squadmate is still nil
//Wait a bit, calculate a new closest squadmate, and exit
if (isNil "_healer") exitWith {
	sleep 15;
	if(cws_ais_debugging) then {
		[format ["%1 is calling for more help!", _unit], 2] call ccl_fnc_ShowMessage;
	};
	[_unit] spawn cws_fnc_sendAIHealer;
};

//Otherwise start first aid with the closest squadmate as the healer
[_unit, _healer] spawn cws_fnc_firstAid;