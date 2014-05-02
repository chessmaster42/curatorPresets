_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	_unit = [_logic] call ccl_fnc_GetUnitUnderCursor;
	if(isNull _unit) exitWith{};

	//Save the unit for the UI
	uinamespace setVariable ["curatorPresets_ModuleUnit", _unit];

	//Load up the dialog
	_ok = createDialog "RscDisplayAttributesModuleUnitChat";
	waitUntil { dialog };
	sleep 0.5;

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_channel = uinamespace getVariable "curatorPresets_UnitChatChannel";
	_message = uinamespace getVariable "curatorPresets_UnitChatMessage";
	if(isnil "_channel") exitWith {
		[objnull, "Error - 'Channel' was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};
	if(isnil "_message") exitWith {
		[objnull, "Error - 'Message' was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};

	//Run the action on the unit
	[[_unit, _channel, _message], "cpm_fnc_LoadUnitChat"] spawn ccl_fnc_GlobalExec;

	//Alert Zeus
	[objnull, format["%1 - Chat sent to channel %2", name _unit, _channel]] call bis_fnc_showCuratorFeedbackMessage;
	
	//Clean up
	uinamespace setVariable ["curatorPresets_ModuleUnit", nil];

	deletevehicle _logic;
};