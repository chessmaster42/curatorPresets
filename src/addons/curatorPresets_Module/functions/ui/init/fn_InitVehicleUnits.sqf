#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

//Get unit info
_unit = uinamespace getVariable "curatorPresets_ModuleUnit";

//Configure the list box
_display = ctrlParent _control;
_ctrl = _display displayCtrl 41072;
{
	_lbComponent = _ctrl lbAdd _x;
} foreach ["Passengers","Crew","All"];
_ctrl lbSetCurSel 0;
_ctrl ctrlCommit 1;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl IDC_OK;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrl = _display displayCtrl 41072;
	uinamespace setVariable ["curatorPresets_VehicleUnitsValue", _ctrl lbText lbCurSel _ctrl];
}];

//Setup handler when Cancel is clicked
_ctrlButtonCancel = _display displayCtrl IDC_CANCEL;
_ctrlButtonCancel ctrlAddEventHandler ["buttonclick", {
	//Blank out any existing value
	uinamespace setVariable ["curatorPresets_VehicleUnitsValue", nil];
}];