_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	_unit = [_logic] call cpm_fnc_GetUnitUnderCursor;

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
		[objnull, "Error - Channel was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};
	if(isnil "_message") exitWith {
		[objnull, "Error - Message was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};

	//Run the action on the unit
	[[_unit, _channel, _message], "cpm_fnc_LoadUnitChat"] spawn cpm_fnc_GlobalExec;

	//Alert Zeus
	[objnull, format["%1 - Chat sent at %2", name _unit, mapGridPosition _unit]] call bis_fnc_showCuratorFeedbackMessage;
	
	//Clean up
	uinamespace setVariable ["curatorPresets_ModuleUnit", nil];
	uinamespace setVariable ["curatorPresets_UnitChatChannel", nil];
	uinamespace setVariable ["curatorPresets_UnitChatMessage", nil];

	deletevehicle _logic;
};