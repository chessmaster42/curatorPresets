#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

_display = ctrlParent _control;

//Configure the slider in the dialog
_ctrl = _display displayCtrl 41062;
_ctrl sliderSetRange [0, 1];
_ctrl sliderSetPosition 0;
_ctrl ctrlSetTooltip "0";
_ctrl ctrlCommit 1;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl IDC_OK;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrl = _display displayCtrl 41062;
	uinamespace setVariable ["curatorPresets_DamageValue", (sliderPosition _ctrl)];
}];

//Setup handler when Cancel is clicked
_ctrlButtonCancel = _display displayCtrl IDC_CANCEL;
_ctrlButtonCancel ctrlAddEventHandler ["buttonclick", {
	uinamespace setVariable ["curatorPresets_DamageValue", nil];
}];