#include "\cws_injury\functions\ui\defineResinclDesign.inc"

_control = _this select 0;
_params = [
	IDC_CWS_RscDisplayAttributeModuleCWSEnableDebugging_Value,
	"cws_injury_Config_Debugging",
	[["No", 0],["Yes", 1]],
	if(cws_ais_debugging) then {1} else {0}
];

[_control, _params] call ccl_fnc_InitListBox;