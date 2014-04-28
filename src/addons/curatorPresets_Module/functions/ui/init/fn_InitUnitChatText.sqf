#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

_display = ctrlParent _control;
_ctrl = _display displayCtrl 41122;
_ctrl ctrlSetText "Hello World!";

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl IDC_OK;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrl = _display displayCtrl 41122;
	uinamespace setVariable ["curatorPresets_UnitChatMessage", ctrlText _ctrl];
}];

//Setup handler when Cancel is clicked
_ctrlButtonCancel = _display displayCtrl IDC_CANCEL;
_ctrlButtonCancel ctrlAddEventHandler ["buttonclick", {
	//Blank out any existing value
	uinamespace setVariable ["curatorPresets_UnitChatMessage", nil];
}];