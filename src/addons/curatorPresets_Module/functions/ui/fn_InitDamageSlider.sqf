_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

_display = ctrlParent _control;

//Configure the slider in the dialog
_ctrlDamage = _display displayCtrl 41062;
_ctrlDamage sliderSetRange [0, 10];
_ctrlDamage sliderSetPosition 0;
_ctrlDamage ctrlCommit 1;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl 1;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrlDamage = _display displayCtrl 41062;
	uinamespace setVariable ["curatorPresets_DamageValue", 1 - ((sliderPosition _ctrlDamage) * 0.1)];
}];