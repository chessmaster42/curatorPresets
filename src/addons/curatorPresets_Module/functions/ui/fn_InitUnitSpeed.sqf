_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

//Configure the list box
_display = ctrlParent _control;
_ctrlSpeed = _display displayCtrl 41032;
{
	_lbComponent = _ctrlSpeed lbAdd _x;
} foreach ["LIMITED","NORMAL","FULL"];
_ctrlSpeed lbSetCurSel 0;
_ctrlSpeed ctrlCommit 1;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl 1;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrlSpeed = _display displayCtrl 41032;
	uinamespace setVariable ["curatorPresets_UnitSpeedValue", _ctrlSpeed lbText lbCurSel _ctrlSpeed];
}];