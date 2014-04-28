_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	_unit = [_logic] call cpm_fnc_GetUnitUnderCursor;

	//Load up the dialog
	_ok = createDialog "RscDisplayAttributesModuleCWS";
	waitUntil { dialog };
	sleep 0.5;

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_appliesTo = uinamespace getVariable "curatorPresets_AppliesToValue";
	if(isnil "_appliesTo") exitWith {
		[objnull, "Error - 'Applies To' was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};

	[[_unit, _appliesTo], "cpm_fnc_LoadCWS"] spawn cpm_fnc_GlobalExec;
	
	[objnull, format["%1 is now using CWS at %2", name _unit, mapGridPosition _unit]] call bis_fnc_showCuratorFeedbackMessage;
	
	deletevehicle _logic;
};