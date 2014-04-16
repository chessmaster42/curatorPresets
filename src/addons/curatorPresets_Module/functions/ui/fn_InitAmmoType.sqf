_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

_display = ctrlParent _control;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl 1;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrlAmmoType = _display displayCtrl 41022;
	uinamespace setVariable ["curatorPresets_AmmoTypeValue", _ctrlAmmoType lbText lbCurSel _ctrlAmmoType];
}];