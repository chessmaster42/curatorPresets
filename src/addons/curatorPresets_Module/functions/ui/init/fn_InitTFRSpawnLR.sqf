#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

//Configure the list box
_display = ctrlParent _control;
_ctrl = _display displayCtrl 41202;
_index = 0;
{
	_lbComponent = _ctrl lbAdd _x;
	_ctrl lbSetValue [_lbComponent, _index];
	_index = _index + 1;
} foreach ["No","Yes"];
if(isNil "tf_no_auto_long_range_radio") then {
	tf_no_auto_long_range_radio = false;
};
if(tf_no_auto_long_range_radio) then {
	_ctrl lbSetCurSel 0;
} else {
	_ctrl lbSetCurSel 1;
};
_ctrl ctrlCommit 1;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl IDC_OK;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrl = _display displayCtrl 41202;
	_enableLRSpawn = _ctrl lbValue lbCurSel _ctrl;
	if(_enableLRSpawn > 0) then {
		tf_no_auto_long_range_radio = false;
	} else {
		tf_no_auto_long_range_radio = true;
	};
}];