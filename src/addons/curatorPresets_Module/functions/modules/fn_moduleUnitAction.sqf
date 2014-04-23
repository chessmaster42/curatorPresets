_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	_unit = [_logic] call cpm_fnc_GetUnitUnderCursor;

	//Save the unit for the UI
	uinamespace setVariable ["curatorPresets_ModuleUnit", _unit];

	//Load up the dialog
	_ok = createDialog "RscDisplayAttributesModuleUnitAction";
	waitUntil { dialog };
	sleep 0.5;

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_action = uinamespace getVariable "curatorPresets_UnitActionValue";
	if(isnil "_action") exitWith {
		[objnull, "Error - Action was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};

	//Run the action on the unit
	[[_unit, _action], "cpm_fnc_LoadUnitAction"] spawn cpm_fnc_GlobalExec;

	[objnull, format["%1 - Action %3 activated at %2", name _unit, mapGridPosition _unit, _action]] call bis_fnc_showCuratorFeedbackMessage;
	
	//Clean up
	uinamespace setVariable ["curatorPresets_ModuleUnit", nil];
	uinamespace setVariable ["curatorPresets_UnitActionValue", nil];

	deletevehicle _logic;
};