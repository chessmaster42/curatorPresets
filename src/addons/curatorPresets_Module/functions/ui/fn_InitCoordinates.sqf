_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

_display = ctrlParent _control;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl 1;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrlX = _display displayCtrl 41002;
	_ctrlY = _display displayCtrl 41004;
	uinamespace setVariable ["curatorPresets_XValue", ctrlText _ctrlX];
	uinamespace setVariable ["curatorPresets_YValue", ctrlText _ctrlY];
}];