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

//Split up the building positions between every member of the group
_groupUnits = units _group;
_unitCount = count _groupUnits;
_positionsPerUnit = floor (_buildingPosCount / _unitCount);
_buildingPosIndex = 0;
{
	//Build the position array for this unit to search through
	_buildingPosArray = [];
	for [{_i=_buildingPosIndex},{_i<(_buildingPosIndex + _positionsPerUnit)},{_i=_i+1}] do {
		_buildingPosArray set [_i, [_i, _building buildingPos _i]];
	};

	//Send the unit off to search through the building positions
	[_x, _building, _buildingPosArray] spawn cpm_fnc_MoveUnitThroughBuilding;

	_buildingPosIndex = _buildingPosIndex + _positionsPerUnit;
	if(_buildingPosIndex >= _buildingPosCount) exitWith {};
} forEach _groupUnits;