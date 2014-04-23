_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

_display = ctrlParent _control;
_ctrl = _display displayCtrl 41122;
_ctrl ctrlSetText "Hello World!";

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl 1;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrl = _display displayCtrl 41122;
	uinamespace setVariable ["curatorPresets_UnitChatMessage", ctrlText _ctrl];
}];