_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	//Save the unit for the UI
	uinamespace setVariable ["curatorPresets_ModuleUnit", _logic];

	//Load up the dialog
	_ok = createDialog "RscDisplayAttributesModuleSpawnGarrison";
	waitUntil { dialog };
	sleep 0.1;

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_xCoordinate = uinamespace getVariable "curatorPresets_XValue";
	_yCoordinate = uinamespace getVariable "curatorPresets_YValue";
	_radius = uinamespace getVariable "curatorPresets_RadiusValue";
	_density = uinamespace getVariable "curatorPresets_DensityValue";
	_side = uinamespace getVariable "curatorPresets_SideValue";
	if(isnil "_xCoordinate") exitWith {
		[objnull, "Error - X Coordinate was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};
	if(isnil "_yCoordinate") exitWith {
		[objnull, "Error - Y Coordinate was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};
	if(isnil "_radius") exitWith {
		[objnull, "Error - Radius was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};
	if(isnil "_density") exitWith {
		[objnull, "Error - Density was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};
	if(isnil "_side") exitWith {
		[objnull, "Error - Side was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};

	//Convert the side to the BIS values
	_faction = "";
	_classType = "";
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
	_unitsArray = [];
	for [{_i=1},{_i<(count _CfgVehicles - 1)},{_i=_i+1}] do 
	{
		_CfgVehicle = _CfgVehicles select _i;

		//Only use public entries
		if (getNumber(_CfgVehicle >> "scope") == 2) then 
		{
			_vehicleDisplayName 	= getText(_CfgVehicle >> "displayname");
			_vehicleDisplayName		= [_vehicleDisplayName, gettext(_CfgVehicle >> "picture")];
			_cfgclass 				= configName _CfgVehicle;  
			_cfgFaction 			= getText(_CfgVehicle >> "faction");
			_simulation 			= getText(_CfgVehicle >> "simulation");
			_vehicleClass			= getText(_CfgVehicle >> "vehicleClass");
			  
			if (toLower(_cfgFaction) == _faction) then 
			{
				if (toLower(_simulation)== "soldier") then 
				{
					if ((toLower(_vehicleClass) == _classType) || (_classType == "")) then 
					{
						_unitsArray set[_index, [_cfgclass, _vehicleDisplayName]];									
						_index = _index + 1;
					};
				};
			};
		};
	};

	//Get all of the nearby buildings
	_center = [parseNumber _xCoordinate, parseNumber _yCoordinate, 0];
	_buildingsArray	= nearestObjects [_center, ["House","Ruins","Church","FuelStation","Strategic"], _radius];
	_buildingscount	= count _buildingsArray;

	//Exit if there were no buildings found
	if (_buildingscount < 1) exitwith {
		[objnull, "Error - No buildings within area"] call bis_fnc_showCuratorFeedbackMessage;
	};

	//Iterate through each building
	_unitCount = 0;
	_groupCount = 0;
	{
		_building = _x;

		//Get a count of the interior positions in the building
		_buildingPosCount = 0;
		while { format ["%1", _building buildingPos _buildingPosCount] != "[0,0,0]" } do {_buildingPosCount = _buildingPosCount + 1};

		//Only spawn units if the building has interior positions
		if (_buildingPosCount > 0) then
		{
			//Create a group for the units in this building
			//TODO - Find a way to reduce the number of groups created
			_group = creategroup _side;
			_groupCount = _groupCount + 1;

			//Iterate through each building position
			for [{_i=0},{_i<_buildingPosCount},{_i=_i+1}] do 
			{
				_spawnPos = _building buildingPos _i; 
				
				//Density check based on random value
				if (random 10 < _density) then	
				{	
					//Spawn as long as there are no other nearby units
					if (count (nearestObjects [_spawnPos, ["Man"], 1]) < 1) then
					{
						//Create the new unit
						_type = _unitsArray select round (random 4);
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
					_x addCuratorEditableObjects [units _group, true];
				} foreach allCurators;
			};
		};
	} foreach _buildingsArray;

	//Alert Zeus
	[objnull, format["Spawned garrison of %5 units in %6 groups at %1,%2 within distance of %3 for %4", _xCoordinate, _yCoordinate, _radius, _side, _unitCount, _groupCount]] call bis_fnc_showCuratorFeedbackMessage;
	
	//Clean up
	uinamespace setVariable ["curatorPresets_ModuleUnit", objnull];
	uinamespace setVariable ["curatorPresets_XValue", nil];
	uinamespace setVariable ["curatorPresets_YValue", nil];
	uinamespace setVariable ["curatorPresets_RadiusValue", nil];
	uinamespace setVariable ["curatorPresets_DensityValue", nil];
	uinamespace setVariable ["curatorPresets_SideValue", nil];
	
	deletevehicle _logic;
};