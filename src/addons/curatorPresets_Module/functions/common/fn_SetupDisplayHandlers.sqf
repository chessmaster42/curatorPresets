#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

disableserialization;

while {[player] call ccl_fnc_IsZeusCurator} do {
	//Wait for the curator screen to be displayed
	while {isNull (findDisplay IDD_RSCDISPLAYCURATOR)} do {
		sleep 1;
	};

	//Setup the key and mouse handlers
	_display = findDisplay IDD_RSCDISPLAYCURATOR;
	_display displayAddEventHandler ["KeyDown", "_this call cpm_fnc_OnKeyDown"];
	_ctrl = _display displayctrl IDC_RSCDISPLAYCURATOR_MOUSEAREA;
	_ctrl ctrladdeventhandler ["MouseButtonClick","_this call cpm_fnc_OnMouseButtonClick"];

	//Wait for the curator screen to be removed
	while {!isNull (findDisplay IDD_RSCDISPLAYCURATOR)} do {
		sleep 1;
	};
};