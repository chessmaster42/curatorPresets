#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

//Get the display for the dialog
_display = ctrlParent _control;

_isDebugging = missionnamespace getVariable ["cws_injury_Config_Debugging", false];

//Configure the list box
_ctrl = _display displayCtrl 43012;
_index = 0;
{
	_lbComponent = _ctrl lbAdd _x;
	_ctrl lbSetValue [_lbComponent, _index];
	_index = _index + 1;
} foreach ["No","Yes"];
if(_isDebugging) then {
	_ctrl lbSetCurSel 1;
} else {
	_ctrl lbSetCurSel 0;
};
_ctrl ctrlCommit 1;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl IDC_OK;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrl = _display displayCtrl 43012;
	_newDebugging = if((_ctrl lbValue lbCurSel _ctrl) > 0) then {true} else {false};
	missionnamespace setVariable ["cws_injury_Config_Debugging", _newDebugging];
	cws_ais_debugging = _newDebugging;
}];