_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	_unit = [_logic] call ccl_fnc_GetUnitUnderCursor;
	if(isNull _unit) exitWith{};

	//Load up the dialog
	createDialog "RscDisplayAttributesModuleCWS";
	waitUntil { dialog };

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_appliesTo = uinamespace getVariable "cws_injury_AppliesToValue";

	[[_unit, _appliesTo], "cws_fnc_LoadCWS"] spawn ccl_fnc_GlobalExec;
	
	[format["%1 is now using CWS at %2", name _unit, mapGridPosition _unit], 3, ["CWS"]] call ccl_fnc_ShowMessage;
	
	deletevehicle _logic;
};