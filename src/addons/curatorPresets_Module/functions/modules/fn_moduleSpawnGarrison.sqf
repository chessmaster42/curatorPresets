_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	//Save the unit for the UI
	uinamespace setVariable ["curatorPresets_ModuleUnit", _logic];

	//Load up the dialog
	createDialog "RscDisplayAttributesModuleSpawnGarrison";
	waitUntil { dialog };

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_coordinate = uinamespace getVariable "curatorPresets_CoordinateValue";
	_radius = uinamespace getVariable "curatorPresets_RadiusValue";
	_density = uinamespace getVariable "curatorPresets_DensityValue";
	_side = uinamespace getVariable "curatorPresets_SideValue";

	//If values were not defined assume the dialog was canceled and exit
	if(isnil "_coordinate" || isnil "_radius" || isnil "_density" || isnil "_side") exitWith {
		deletevehicle _logic;
	};

	[[_coordinate, _radius, _density, _side], "cpm_fnc_SpawnGarrison"] spawn ccl_fnc_GlobalExec;

	deletevehicle _logic;
};