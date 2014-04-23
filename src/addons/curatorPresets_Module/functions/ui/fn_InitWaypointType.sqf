_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

//Configure the list box for waypoint type
_display = ctrlParent _control;
_ctrl = _display displayCtrl 41012;
{
	_lbComponent = _ctrl lbAdd _x;
} foreach ["MOVE", "DESTROY", "GETIN", "SAD", "JOIN", "LEADER", "GETOUT", "CYCLE", "LOAD", "UNLOAD", "TR UNLOAD", "HOLD", "SENTRY","GUARD","SUPPORT","GETIN NEAREST","DISMISS","Land","Land - Get in"];
_ctrl lbSetCurSel 0;
_ctrl ctrlCommit 1;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl 1;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrl = _display displayCtrl 41012;
	uinamespace setVariable ["curatorPresets_WaypointTypeValue", _ctrl lbText lbCurSel _ctrl];
}];