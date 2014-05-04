// Authored by chessmaster42
// Based on 'A3 Wounding System' by Psychobastard

#define __includedMates (units group _unit - [_unit])
private ["_unit","_closestsquadmate","_min_distance","_distance"];
_unit = _this select 0;
_closestsquadmate = if (count _this > 1) then {_this select 1} else {objnull};

//If the unit needing aid is no longer alive or is no longer in agony, exit
if(!alive _unit || !(_unit getVariable "cws_ais_agony")) exitWith {};

sleep 5;

if(!isNull _closestsquadmate) then {
	[format ["%1 is calling for help from %2", _unit, _closestsquadmate], 2] call ccl_fnc_ShowMessage;
} else {
	[format ["%1 is calling for help!", _unit], 2] call ccl_fnc_ShowMessage;
};

//If we got a closest squadmate in the function call but they are dead or in agony, remove them from the check
if (!isNull _closestsquadmate) then {
	if (!alive _closestsquadmate || {_closestsquadmate getVariable "cws_ais_agony"}) then {
		_closestsquadmate = objnull;
	};
};

//If the unit is somehow trying to heal themselves, remove them from the check
if (!isNull _closestsquadmate) then {
	if(_unit == _closestsquadmate) then {
		_closestsquadmate = objnull;
	};
};

//First loop through group check conditions:
//1. Must be closer than last unit
//2. Must NOT be a player
//3. Must be a medic
//4. Must have medical supplies
//5. Must be alive
//6. Must NOT be in agony
if (isNull _closestsquadmate) then {
	_min_distance = 100000;
	{
		_isMedic = _x call cws_fnc_isMedic;
		_distance = _unit distance _x;
		_canHeal = [_x] call cws_fnc_canHeal;
		if (_distance < _min_distance && {!isPlayer _x} && _isMedic && _canHeal && _unit != _x) then {
			_min_distance = _distance;
			_closestsquadmate = _x;
		};
	} foreach __includedMates;
};

//Second loop through group check conditions:
//1. Must be closer than last unit
//2. Must NOT be a player
//3. Must have a first aid kit
//4. Must be alive
//5. Must NOT be in agony
if (isNull _closestsquadmate) then {
	_min_distance = 100000;
	{
		_distance = _unit distance _x;
		_canHeal = [_x] call cws_fnc_canHeal;
		if (_distance < _min_distance && {!isPlayer _x} && _canHeal && _unit != _x) then {
			_min_distance = _distance;
			_closestsquadmate = _x;
		};
	} foreach __includedMates;
};

//First loop through faction check conditions:
//1. Must be within 500 meters
//2. Must be on the same side as _unit
//3. Must be closer than last unit
//4. Must NOT be a player
//5. Must have medical supplies
//6. Must be alive
//7. Must NOT be in agony
if (isNull _closestsquadmate) then {
	_min_distance = 500;
	_playerFaction = side (group _unit);
	{
		//Ensure that the group we're checking is on the same side as the injured unit
		if((side _x) == _playerFaction) then {
			{
				_distance = _unit distance _x;
				_canHeal = [_x] call cws_fnc_canHeal;
				if (_distance < _min_distance && {!isPlayer _x} && _canHeal && _unit != _x) then {
					_min_distance = _distance;
					_closestsquadmate = _x;
				};
			} foreach units _x;
		};
	} forEach allGroups;
};

//If the unit is somehow trying to heal themselves, remove them from the check
if (!isNull _closestsquadmate) then {
	if(_unit == _closestsquadmate) then {
		_closestsquadmate = objnull;
	};
};

//If the closest squadmate is still nil
//Wait a bit, calculate a new closest squadmate, and exit
if (isNull _closestsquadmate) exitWith {
	sleep 10;
	[format ["%1 is calling for more help!", _unit], 2] call ccl_fnc_ShowMessage;
	[_unit] spawn cws_fnc_sendAIHealer;
};

//Otherwise start first aid with the closest squadmate as the healer
[_unit, _closestsquadmate] spawn cws_fnc_firstAid;