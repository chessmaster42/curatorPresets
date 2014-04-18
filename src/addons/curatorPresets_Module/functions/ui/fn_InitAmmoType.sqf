_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

_display = ctrlParent _control;

//Get unit info
_unit = uinamespace getVariable "curatorPresets_ModuleUnit";

//Configure the list box for ammo type
_ctrlAmmoType = _display displayctrl 41022;
{
	_lbComponent = _ctrlAmmoType lbAdd _x;
} foreach getArtilleryAmmo [_unit];
_ctrlAmmoType lbSetCurSel 0;
_ctrlAmmoType ctrlCommit 1;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl 1;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrlAmmoType = _display displayCtrl 41022;
	uinamespace setVariable ["curatorPresets_AmmoTypeValue", _ctrlAmmoType lbText lbCurSel _ctrlAmmoType];
}];