_control = _this select 0;

_isDebugging = missionnamespace getVariable ["cws_injury_Config_Debugging", false];

_params = [
	43012,
	"cws_injury_Config_DebuggingValue",
	[["No", 0],["Yes", 1]],
	(if(_isDebugging) then {1} else {0})
];

[_control, _params] call ccl_fnc_InitListBox;