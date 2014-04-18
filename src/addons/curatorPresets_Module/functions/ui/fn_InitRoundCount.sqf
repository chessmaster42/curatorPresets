_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

//Configure the list box
_display = ctrlParent _control;
_ctrlRounds = _display displayctrl 41042;
_ctrlRounds lbAdd "1";
_ctrlRounds lbAdd "2";
_ctrlRounds lbAdd "3";
_ctrlRounds lbAdd "4";
_ctrlRounds lbAdd "5";
_ctrlRounds lbAdd "6";
_ctrlRounds lbAdd "7";
_ctrlRounds lbAdd "8";
_ctrlRounds lbSetCurSel 0;
_ctrlRounds ctrlCommit 1;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl 1;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrlRounds = _display displayCtrl 41042;
	uinamespace setVariable ["curatorPresets_RoundsValue", _ctrlRounds lbText lbCurSel _ctrlRounds];
}];
