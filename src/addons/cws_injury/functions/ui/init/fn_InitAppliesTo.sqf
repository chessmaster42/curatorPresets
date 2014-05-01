#include "\cws_injury\functions\ui\defineResinclDesign.inc"

_control = _this select 0;
_params = [
	IDC_CWS_RscDisplayAttributeModuleCWSAppliesTo_Value,
	"cws_injury_AppliesToValue",
	[["Unit", 0],["Group", 1],["Group (Except Leader)", 2],["Group (Only Leader)", 3],["Side/Faction", 4],["Playable Units", 5]]
	0
];

[_control, _params] call ccl_fnc_InitListBox;