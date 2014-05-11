_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	_unit = [_logic] call ccl_fnc_GetUnitUnderCursor;
	if(isNull _unit) exitWith{};

	//Save the unit for the UI
	uinamespace setVariable ["curatorPresets_ModuleUnit", _unit];

	//Load up the dialog
	createDialog "RscDisplayAttributesModuleUnitAction";
	waitUntil { dialog };

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_action = uinamespace getVariable "curatorPresets_UnitActionValue";
	_appliesTo = uinamespace getVariable "curatorPresets_AppliesToValue";

	//If values were not defined assume the dialog was canceled and exit
	if(isnil "_action" || isnil "_appliesTo") exitWith {
		deletevehicle _logic;
	};

	//Run the action
	[[_unit, _action, _appliesTo], "cpm_fnc_LoadUnitAction", false] spawn ccl_fnc_GlobalExec;

	[objnull, format["%1 - Action %3 activated at %2", name _unit, mapGridPosition _unit, _action]] call bis_fnc_showCuratorFeedbackMessage;
	
	deletevehicle _logic;
};