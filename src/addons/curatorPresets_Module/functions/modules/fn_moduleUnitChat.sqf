_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	_unit = [_logic] call ccl_fnc_GetUnitUnderCursor;
	if(isNull _unit) exitWith{};

	//Save the unit for the UI
	uinamespace setVariable ["curatorPresets_ModuleUnit", _unit];

	//Load up the dialog
	createDialog "RscDisplayAttributesModuleUnitChat";
	waitUntil { dialog };

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_channel = uinamespace getVariable "curatorPresets_UnitChatChannel";
	_message = uinamespace getVariable "curatorPresets_UnitChatMessage";

	//If values were not defined assume the dialog was canceled and exit
	if(isnil "_channel" || isnil "_message") exitWith {
		deletevehicle _logic;
	};

	//Run the action on the unit
	[[_unit, _channel, _message], "ccl_fnc_SendUnitChat", false] spawn ccl_fnc_GlobalExec;

	//Alert Zeus
	[objnull, format["%1 - Chat sent to channel %2", name _unit, _channel]] call bis_fnc_showCuratorFeedbackMessage;
	
	deletevehicle _logic;
};