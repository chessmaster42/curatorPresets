#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

//_wpTypeArray = ["MOVE", "DESTROY", "GETIN", "SAD", "JOIN", "LEADER", "GETOUT", "CYCLE", "LOAD", "UNLOAD", "TR UNLOAD", "HOLD", "SENTRY","GUARD","SUPPORT","GETIN NEAREST","DISMISS","Land","Land - Get in","Search Building"];
_wpTypeArray = ["SAD", "GETOUT", "TR UNLOAD", "HOLD", "SENTRY", "GUARD", "SUPPORT", "LOITER", "Land", "Land - Get in", "Search Building"];

//Configure the list box for waypoint type
_display = ctrlParent _control;
_ctrl = _display displayCtrl 41012;
{
	_lbComponent = _ctrl lbAdd _x;
} foreach _wpTypeArray;
_ctrl lbSetCurSel 0;
_ctrl ctrlCommit 1;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl IDC_OK;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrl = _display displayCtrl 41012;
	uinamespace setVariable ["curatorPresets_WaypointTypeValue", _ctrl lbText lbCurSel _ctrl];
}];

//Setup handler when Cancel is clicked
_ctrlButtonCancel = _display displayCtrl IDC_CANCEL;
_ctrlButtonCancel ctrlAddEventHandler ["buttonclick", {
	//Blank out any existing value
	uinamespace setVariable ["curatorPresets_WaypointTypeValue", nil];
}];