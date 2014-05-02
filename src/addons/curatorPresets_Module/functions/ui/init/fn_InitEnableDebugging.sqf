#include "\curatorPresets_Module\functions\ui\defineResinclDesign.inc"

_control = _this select 0;
_params = [
	IDC_CPM_RscDisplayAttributeModuleCPMEnableDebugging_Value,
	"curatorPresets_Debugging",
	[["No", 0],["Yes", 1]],
	if(missionnamespace getVariable ["curatorPresets_Debugging", false]) then {1} else {0}
];

[_control, _params] call ccl_fnc_InitListBox;