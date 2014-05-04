_group = _this select 0;

_leader = leader _group;
_center = position _leader;
_radius = 50;
_buildingsArray	= nearestObjects [_center, ["House","Ruins","Church","FuelStation","Strategic"], _radius];
_buildingscount	= count _buildingsArray;

//Check if no buildings were found
if (_buildingscount < 1) exitWith {
	["Error - No buildings within area", 2] call ccl_fnc_ShowMessage;
};

//Check for a building that is searcheable
_buildingPosCount = 0;
_building = objnull;
{
	_building = _x;

	_buildingPosCount = 0;
	while { format ["%1", _building buildingPos _buildingPosCount] != "[0,0,0]" } do {_buildingPosCount = _buildingPosCount + 1};
	if(_buildingPosCount > 0) exitWith {};
} forEach _buildingsArray;

if(_buildingPosCount < 1) exitWith {
	["Error - No searchable buildings found", 2] call ccl_fnc_ShowMessage;
};

[format["Moving %1 through building %2 with %3 positions", _group, _building, _buildingPosCount], 2] call ccl_fnc_ShowMessage;

_positionArray = [];
for [{_i=0},{_i<_buildingPosCount},{_i=_i+1}] do {
	_pos = _building buildingPos _i;
	_positionArray set [_i, [_i, _pos]];
};

//Sort the array based on distance from the group leader (nearest to farthest)
//TODO - Determine if this is even better than just going through the positions sequentially
_positionArray = [_positionArray, [_leader], {_input0 distance (_x select 1)}, "ASCEND"] call BIS_fnc_sortBy;

//Split up the building positions between every member of the group
_groupUnits = units _group;
_unitCount = count _groupUnits;
_positionsPerUnit = floor (_buildingPosCount / _unitCount);
_buildingPosIndex = 0;
{
	//Build the position array for this unit to search through
	_buildingPosArray = [];
	for [{_i=0},{_i<_positionsPerUnit},{_i=_i+1}] do {
		if(_buildingPosIndex >= _buildingPosCount) exitWith {};

		_buildingPosArray set [_i, _positionArray select _buildingPosIndex];
		_buildingPosIndex = _buildingPosIndex + 1;
	};

	//Send the unit off to search through the building positions
	[_x, _building, _buildingPosArray] spawn cpm_fnc_MoveUnitThroughBuilding;
} forEach _groupUnits;

[format["Finished moving %1 through building %2 with %3 positions", _group, _building, _buildingPosCount], 2] call ccl_fnc_ShowMessage;