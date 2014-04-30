// Authored by chessmaster42
// Based on 'A3 Wounding System' by Psychobastard

private ["_unit","_closestsquadmate","_min_distance","_distance"];
_unit = _this select 0;
_closestsquadmate = if (count _this > 1) then {_this select 1} else {nil};

//If the unit needing aid is no longer alive or is no longer in agony, exit
if(!alive _unit || !(_unit getVariable "cws_ais_agony")) exitWith {};

sleep 5;

//If we got a closest squadmate in the function call but they are dead or in agony, remove them from the check
if (!isNil "_closestsquadmate") then {
	if (!alive _closestsquadmate || {_closestsquadmate getVariable "cws_ais_agony"}) then {
		_closestsquadmate = Nil;
	};
};

//First loop through group check conditions:
//1. Must be closer than last unit
//2. Must NOT be a player
//3. Must be a medic
//4. Must have medical supplies
//5. Must be alive
//6. Must not be in agony
if (isNil "_closestsquadmate") then {
	_min_distance = 100000;
	{
		_has_medikit = ((items _x) find "Medikit" > -1);
		_has_firstaidkit = ((items _x) find "FirstAidKit" >= 0);
		_isMedic = _x call cws_fnc_isMedic;
		_distance = _unit distance _x;
		if (_distance < _min_distance && {!isPlayer _x} && _isMedic && (_has_medikit || _has_firstaidkit) && alive _x && !(_x getVariable "cws_ais_agony")) then {
			_min_distance = _distance;
			_closestsquadmate = _x;
		};
	} foreach (units group _unit - [_unit]);
};

//Second loop through group check conditions:
//1. Must be closer than last unit
//2. Must NOT be a player
//3. Must have a first aid kit
//4. Must be alive
//5. Must not be in agony
if (isNil "_closestsquadmate") then {
	_min_distance = 100000;
	{
		_has_firstaidkit = ((items _x) find "FirstAidKit" >= 0);
		_distance = _unit distance _x;
		if (_distance < _min_distance && {!isPlayer _x} && _has_firstaidkit && alive _x && !(_x getVariable "cws_ais_agony")) then {
			_min_distance = _distance;
			_closestsquadmate = _x;
		};
	} foreach (units group _unit - [_unit]);
};

//First loop through faction check conditions:
//1. Must be within 500 meters
//2. Must be on the same side as _unit
//3. Must be closer than last unit
//4. Must NOT be a player
//5. Must have medical supplies
//6. Must be alive
//7. Must NOT be in agony
if (isNil "_closestsquadmate") then {
	_min_distance = 500;
	_playerFaction = side (group _unit);
	{
		//Ensure that the group we're checking is on the same side as the injured unit
		if((side _x) == _playerFaction) then {
			{
				_has_medikit = ((items _x) find "Medikit" > -1);
				_has_firstaidkit = ((items _x) find "FirstAidKit" >= 0);
				_isMedic = _x call cws_fnc_isMedic;
				_distance = _unit distance _x;
				if (_distance < _min_distance && {!isPlayer _x} && ((_isMedic && _has_medikit) || _has_firstaidkit) && alive _x && !(_x getVariable "cws_ais_agony")) then {
					_min_distance = _distance;
					_closestsquadmate = _x;
				};
			} foreach units _x;
		};
	} forEach allGroups;
};

//If the closest squadmate is still nil then wait a bit, calculate a new closest squadmate, and exit
if (isNil "_closestsquadmate") exitWith {
	sleep 15;
	[_unit] spawn cws_fnc_sendAIHealer;
};

//Main wait loop to get the closest squadmate to the unit
_closestsquadmate setBehaviour "AWARE";
_closestsquadmate doMove (position _unit);
WaitUntil {
	_closestsquadmate distance _unit <= cws_ais_firstaid_distance		 		||
	{!alive _unit}			 					||
	{!(_unit getVariable "cws_ais_agony")} 	||
	{!alive _closestsquadmate}				 					||
	{_closestsquadmate getVariable "cws_ais_agony"}
};

//If the closest squadmate goes down by the time they get to the injured unit then wait a bit, calculate a new closest squadmate, and exit
if (!alive _closestsquadmate || {_closestsquadmate getVariable "cws_ais_agony"}) exitWith {
	sleep 15;
	[_unit] spawn cws_fnc_sendAIHealer;
};

//If the injured unit is still viable start the first aid
if (alive _unit && {_unit getVariable "cws_ais_agony"}) then {
	[_unit, _closestsquadmate] spawn cws_fnc_firstAid;
};