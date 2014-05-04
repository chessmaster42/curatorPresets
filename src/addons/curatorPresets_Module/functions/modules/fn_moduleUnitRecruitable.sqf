_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	_unit = [_logic] call ccl_fnc_GetUnitUnderCursor;
	if(isNull _unit) exitWith{};

	//Load up the dialog
	createDialog "RscDisplayAttributesModuleUnitRecruitable";
	waitUntil { dialog };

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_appliesTo = uinamespace getVariable "curatorPresets_AppliesToValue";

	//If values were not defined assume the dialog was canceled and exit
	if(isnil "_appliesTo") exitWith {
		deletevehicle _logic;
	};

	[[_unit, _appliesTo], "cpm_fnc_LoadRecruitable"] spawn ccl_fnc_GlobalExec;
	
	[objnull, format["%1 - Recruitable at %2", name _unit, mapGridPosition _unit]] call bis_fnc_showCuratorFeedbackMessage;
	
	deletevehicle _logic;
};