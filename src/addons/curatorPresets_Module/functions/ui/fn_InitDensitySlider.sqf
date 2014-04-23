_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

_display = ctrlParent _control;

//Configure the slider
_ctrl = _display displayCtrl 41132;
_ctrl sliderSetRange [0, 10];
_ctrl sliderSetPosition 5;
_ctrl ctrlCommit 0.5;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl 1;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrl = _display displayCtrl 41132;
	uinamespace setVariable ["curatorPresets_DensityValue", (sliderPosition _ctrl)];
}];