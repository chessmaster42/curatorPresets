#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

//Get the display for the dialog
_display = ctrlParent _control;

//Configure the list box
_ctrl = _display displayCtrl 41162;
_index = 0;
{
	_lbComponent = _ctrl lbAdd _x;
	_ctrl lbSetValue [_lbComponent, _index];
	_index = _index + 1;
} foreach ["Unit","Group","Group (Except Leader)","Group (Only Leader)","Side/Faction","Playable Units"];
_ctrl lbSetCurSel 0;
_ctrl ctrlCommit 1;

//Blank out any existing value
uinamespace setVariable ["curatorPresets_AppliesToValue", nil];

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl IDC_OK;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrl = _display displayCtrl 41162;
	uinamespace setVariable ["curatorPresets_AppliesToValue", _ctrl lbValue lbCurSel _ctrl];
}];

//Setup handler when Cancel is clicked
_ctrlButtonCancel = _display displayCtrl IDC_CANCEL;
_ctrlButtonCancel ctrlAddEventHandler ["buttonclick", {
	//Blank out any existing value
	uinamespace setVariable ["curatorPresets_AppliesToValue", nil];
}];