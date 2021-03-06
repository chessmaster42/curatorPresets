private ["_unit","_building","_positionArray","_pos"];
_unit = _this select 0;
_building = _this select 1;
_positionArray = [];

//If the unit is invalid, exit immediately
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};

//If the unit is dead, exit immediately
if(!alive _unit) exitWith {};

if(count _this > 2) then {
	_positionArray = _this select 2;
} else {
	_buildingPosCount = 0;
	while { format ["%1", _building buildingPos _buildingPosCount] != "[0,0,0]" } do {_buildingPosCount = _buildingPosCount + 1};
	for [{_i=0},{_i<_buildingPosCount},{_i=_i+1}] do {
		_pos = _building buildingPos _i;
		_positionArray set [_i, [_i, _pos]];
	};
};

if(count _positionArray < 1) exitWith {};

{
	_posIndex = _x select 0;
	_buildingPos = _x select 1;
	
	_unit doMove _buildingPos;
	[format["Moving %1 to position #%2", _unit, _posIndex], 2] call ccl_fnc_ShowMessage;
	
	_distanceLeft = 999;
	_distanceMoved = 999;
	
	while {_distanceLeft > 1} do {
		_oldUnitPos = getPosASL _unit;
		sleep 2;
		
		_distanceLeft = [getPosASL _unit, _buildingPos] call ccl_fnc_Distance;
		_distanceMoved = [_oldUnitPos, getPosASL _unit] call ccl_fnc_Distance;
		
		if(_distanceMoved < 0.1) exitWith {};
	};
} forEach _positionArray;

[format["%1 finished moving through %2 positions in building %3", _unit, count _positionArray, _building], 2] call ccl_fnc_ShowMessage;