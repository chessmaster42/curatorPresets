#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

//Configure the list box
_display = ctrlParent _control;
_ctrl = _display displayCtrl 41212;
_index = 0;
{
	_lbComponent = _ctrl lbAdd _x;
	_ctrl lbSetValue [_lbComponent, _index];
	_index = _index + 1;
} foreach ["No","Yes"];
if(isNil "tf_same_lr_frequencies_for_side") then {
	tf_same_lr_frequencies_for_side = false;
};
if(tf_same_lr_frequencies_for_side) then {
	_ctrl lbSetCurSel 1;
} else {
	_ctrl lbSetCurSel 0;
};
_ctrl ctrlCommit 1;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl IDC_OK;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrl = _display displayCtrl 41212;
	_sameLR = _ctrl lbValue lbCurSel _ctrl;
	if(_sameLR > 0) then {
		tf_same_lr_frequencies_for_side = true;
		tf_freq_west_lr = 51;
		tf_freq_east_lr = 51;
		tf_freq_guer_lr = 51;
	} else {
		tf_same_lr_frequencies_for_side = false;
	};
}];