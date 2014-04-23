_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

_display = ctrlParent _control;

//Configure the slider
_ctrl = _display displayCtrl 41152;
_ctrl sliderSetRange [10, 1000];
_ctrl sliderSetPosition 100;
_ctrl ctrlCommit 0.5;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl 1;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrl = _display displayCtrl 41152;
	uinamespace setVariable ["curatorPresets_RadiusValue", (sliderPosition _ctrl)];
}];