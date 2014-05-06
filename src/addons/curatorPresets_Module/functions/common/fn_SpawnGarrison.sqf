_center = _this select 0;
_radius = _this select 1;
_density = _this select 2;
_side = _this select 3;

//Only run spawn garrison on the server
if(!isServer) exitWith {};

_unitCountMax = 150;
_groupCountMax = 25;

//Convert the side to the BIS values
_faction = "";
switch (toLower _side) do {
	case "west": {
		_side = west;
		_faction = "BLU_F";
	};
	case "east": {
		_side = east;
		_faction = "OPF_F";
	};
	case "independent": {
		_side = resistance;
		_faction = "IND_F";
	};
	case "civilian": {
		_side = civilian;
		_faction = "CIV_F";
	};
};

//Get a list of available unit types
_index = 0;
_CfgVehicles = configFile >> "CfgVehicles";
_classType = "men";
_displayNameFilterArray = ["Rifleman", "Grenadier", "Autorifleman", "Combat Life Saver", "Rifleman (AT)"];
_unitsArray = [];
for [{_i=1},{_i<(count _CfgVehicles - 1)},{_i=_i+1}] do 
{
	_CfgVehicle = _CfgVehicles select _i;

	if (getNumber(_CfgVehicle >> "scope") == 2) then 
	{
		_vehicleDisplayName 	= getText(_CfgVehicle >> "displayname");
		_cfgclass 				= configName _CfgVehicle;  
		_cfgFaction 			= getText(_CfgVehicle >> "faction");
		_simulation 			= getText(_CfgVehicle >> "simulation");
		_vehicleClass			= getText(_CfgVehicle >> "vehicleClass");
		_unitDataArray			= [_vehicleDisplayName, gettext(_CfgVehicle >> "picture")];
		  
		if (toLower(_cfgFaction) == _faction) then 
		{
			if (toLower(_simulation)== "soldier") then 
			{
				if ((toLower(_vehicleClass) == _classType) || (_classType == "")) then 
				{
					if(_vehicleDisplayName in _displayNameFilterArray) then
					{
						_unitsArray set[_index, [_cfgclass, _unitDataArray]];									
						_index = _index + 1;
					};
				};
			};
		};
	};
};

_buildingsArray	= nearestObjects [_center, ["House","Ruins","Church","FuelStation","Strategic"], _radius];
_buildingscount	= count _buildingsArray;

//Exit if there were no buildings found
if (_buildingscount < 1) exitwith {
	["Error - No buildings within area", 3] call ccl_fnc_ShowMessage;
};

_unitCount = 0;
_groupCount = 0;
_group = creategroup _side;
_groupArray = [];

//Iterate through each building
{
	_building = _x;

	//Get a count of the interior positions in the building
	_buildingPosCount = 0;
	while { format ["%1", _building buildingPos _buildingPosCount] != "[0,0,0]" } do {_buildingPosCount = _buildingPosCount + 1};

	//Only spawn units if the building has interior positions
	if (_buildingPosCount > 0) then
	{
		//Create a group for the units in this building
		if(_groupCount < _groupCountMax) then {
			_group = creategroup _side;
			_groupArray set [_groupCount, _group];
			_groupCount = _groupCount + 1;
		} else {
			//If we have reach the group limit, find the closest group to this building
			_buildingPos = _building buildingPos 0;
			_closestGroup = _group;
			{
				_groupLeader = leader _x;
				_distance = [getPosATL _groupLeader, _buildingPos] call ccl_fnc_Distance;
				_closestGroupLeader = leader _closestGroup;
				_closestDistance = [getPosATL _closestGroupLeader, _buildingPos] call ccl_fnc_Distance;

				if(_closestDistance > _distance) then {
					_closestGroup = _x;
				};
			} forEach _groupArray;
			_group = _closestGroup;
		};

		//Iterate through each building position
		for [{_i=0},{_i<_buildingPosCount},{_i=_i+1}] do 
		{
			_spawnPos = _building buildingPos _i; 
			
			//Density check based on random value
			if (random 10 < _density) then	
			{	
				//Spawn as long as there are no other nearby units and we're below the max
				if (count (nearestObjects [_spawnPos, ["Man"], 1]) < 1 && (_unitCount < _unitCountMax)) then
				{
					//Determine the unit type
					_type = 0;
					if (random 100 < 50) then
					{
						_type = _unitsArray select round (random 5);
					};

					//Create the new unit
					_unit = _group createUnit [_type select 0, _spawnPos, [], 0.5, "NONE"];
					waituntil {alive _unit}; 
					_unit setpos _spawnPos;

					_unitCount = _unitCount + 1;
				};
			}
		};

		//Clean up empty groups
		if(count (units _group) < 1) then {
			deleteGroup _group;
			_group = objnull;
			_groupCount = _groupCount - 1;
		} else {
			//Put them on safe
			_group setBehaviour "SAFE";
			_group setSpeedMode "LIMITED";
			
			//Get a random facing direction
			_dir = round(random 360); 
			
			//Make them stand
			{
				_x setUnitPos "UP";
				_x setdir _dir;
			} foreach units _group;
			
			//Look somewhere randomly
			_group setFormDir _dir;

			//Register the units with all curators
			{
				_units = units _group;
				_x addCuratorEditableObjects [_units, true];
			} foreach allCurators;
		};
	};
} foreach _buildingsArray;

//Alert Zeus
//TODO - Fix this so that it can run on the curator client. Right now it does nothing since it runs only on the server
[format["Spawned garrison of %5 units in %6 groups at %1,%2 within distance of %3 for %4", _center select 0, _center select 1, _radius, _side, _unitCount, _groupCount], 5] call ccl_fnc_ShowMessage;