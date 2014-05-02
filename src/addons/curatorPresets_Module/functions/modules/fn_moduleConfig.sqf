_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then
{
	//Load the dialog
	createDialog "RscDisplayAttributesModuleCPMConfig";

	//Wait until the dialog has been opened
	waitUntil { dialog };

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Update debugging setting
	_oldDebugging = missionnamespace getVariable ["curatorPresets_Debugging", false];
	_debugging = uinamespace getVariable "curatorPresets_Debugging";
	if(isNil "_debugging") then {
		_debugging = _oldDebugging;
	} else {
		_debugging = if(_debugging == 1) then {true} else {false};
	};
	missionnamespace setVariable ["curatorPresets_Debugging", _debugging];

	//TODO - Finish config

	["CPM configured", 3, ["CPM"]] call ccl_fnc_ShowMessage;
};