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

	_center = [parseNumber _xCoordinate, parseNumber _yCoordinate, 0];
	[[_center, _radius, _density, _side], "cpm_fnc_SpawnGarrison"] spawn cpm_fnc_GlobalExec;

	//Clean up
	uinamespace setVariable ["curatorPresets_ModuleUnit", objnull];
	uinamespace setVariable ["curatorPresets_XValue", nil];
	uinamespace setVariable ["curatorPresets_YValue", nil];
	uinamespace setVariable ["curatorPresets_RadiusValue", nil];
	uinamespace setVariable ["curatorPresets_DensityValue", nil];
	uinamespace setVariable ["curatorPresets_SideValue", nil];
	
	deletevehicle _logic;
};