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
	_coordinate = uinamespace getVariable "curatorPresets_CoordinateValue";
	_radius = uinamespace getVariable "curatorPresets_RadiusValue";
	_density = uinamespace getVariable "curatorPresets_DensityValue";
	_side = uinamespace getVariable "curatorPresets_SideValue";
	if(isnil "_coordinate") exitWith {
		[objnull, "Error - 'Coordinates' was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};
	if(isnil "_radius") exitWith {
		[objnull, "Error - 'Radius' was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};
	if(isnil "_density") exitWith {
		[objnull, "Error - 'Density' was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};
	if(isnil "_side") exitWith {
		[objnull, "Error - 'Side' was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};

	[[_coordinate, _radius, _density, _side], "cpm_fnc_SpawnGarrison"] spawn cpm_fnc_GlobalExec;

	//Clean up
	uinamespace setVariable ["curatorPresets_ModuleUnit", objnull];
	
	deletevehicle _logic;
};