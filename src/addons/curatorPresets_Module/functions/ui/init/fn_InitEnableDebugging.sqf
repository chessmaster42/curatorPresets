#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

//Get the display for the dialog
_display = ctrlParent _control;

_isDebugging = missionnamespace getVariable ["curatorPresets_Debugging", false];

//Configure the list box
_ctrl = _display displayCtrl 41232;
_index = 0;
{
	_lbComponent = _ctrl lbAdd _x;
	_ctrl lbSetValue [_lbComponent, _index];
	_index = _index + 1;
} foreach ["No","Yes"];
if(_isDebugging) then {
	_ctrl lbSetCurSel 1;
} else {
	_ctrl lbSetCurSel 0;
};
_ctrl ctrlCommit 1;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl IDC_OK;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrl = _display displayCtrl 41232;
	_newDebugging = if((_ctrl lbValue lbCurSel _ctrl) > 0) then {true} else {false};

	[["curatorPresets_Debugging", _newDebugging], "cpm_fnc_LoadConfigSetting"] spawn ccl_fnc_GlobalExec;
}];