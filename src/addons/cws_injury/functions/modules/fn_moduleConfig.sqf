_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then
{
	_oldDebugging = missionnamespace getVariable ["cws_injury_Config_Debugging", false];

	//Load the dialog
	createDialog "RscDisplayAttributesModuleCWSConfig";

	//Wait until the dialog has been opened
	waitUntil { dialog };

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Update debugging setting
	_debugging = uinamespace getVariable ["cws_injury_Config_DebuggingValue", (if(_oldDebugging) then {1} else {0})];
	_newDebugging = if(_debugging == 1) then {true} else {false};
	missionnamespace setVariable ["cws_injury_Config_Debugging", _newDebugging];
	cws_ais_debugging = _newDebugging;

	//TODO - Finish config

	["CWS configured", 3, ["CWS"]] call ccl_fnc_ShowMessage;
};