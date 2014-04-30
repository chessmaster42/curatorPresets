_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then
{
	//Load the dialog
	createDialog "RscDisplayAttributesModuleCWSConfig";

	//Wait until the dialog has been opened
	waitUntil { dialog };

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Update debugging setting
	_oldDebugging = missionnamespace getVariable ["cws_injury_Config_Debugging", false];
	_debugging = uinamespace getVariable ["cws_injury_Config_Debugging", _oldDebugging];
	missionnamespace setVariable ["cws_injury_Config_Debugging", _debugging];
	cws_ais_debugging = _debugging;

	//TODO - Finish config

	["CWS configured", 3] call cpm_fnc_ShowMessage;
};