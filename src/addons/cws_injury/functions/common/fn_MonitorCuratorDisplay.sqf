#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

disableSerialization;

while {[player] call cws_fnc_IsZeusCurator} do {
	//Wait for the curator screen to be displayed
	while {isNull (findDisplay IDD_RSCDISPLAYCURATOR)} do {
		sleep 1;
	};

	_display = findDisplay IDD_RSCDISPLAYCURATOR;
	_ctrl = _display displayCtrl IDC_RSCDISPLAYCURATOR_MODEMODULES;
	_ctrl ctrlAddEventHandler ["buttonclick", {
		["CWSInjury"] spawn cws_fnc_OnModuleTreeLoad;
	}];

	["CWSInjury"] call cws_fnc_OnModuleTreeLoad;

	//Wait for the curator screen to be removed
	while {!isNull (findDisplay IDD_RSCDISPLAYCURATOR)} do {
		sleep 1;
	};
};