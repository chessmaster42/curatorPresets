_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

//Configure the list box
_display = ctrlParent _control;
_ctrl = _display displayCtrl 41112;
{
	_lbComponent = _ctrl lbAdd _x;
} foreach ["Group","Side","Global"];
_ctrl lbSetCurSel 0;
_ctrl ctrlCommit 1;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl 1;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrl = _display displayCtrl 41112;
	uinamespace setVariable ["curatorPresets_UnitChatChannel", _ctrl lbText lbCurSel _ctrl];
}];