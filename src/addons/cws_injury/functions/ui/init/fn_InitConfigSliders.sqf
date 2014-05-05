#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

//Get the display for the dialog
_display = ctrlParent _control;

//Set the initial state of the sliders based on the current config
_ctrl = _display displayCtrl 43052;
_ctrl sliderSetRange [1, 5];
_ctrl sliderSetPosition cws_ais_rambofactor;
_ctrl ctrlCommit 1;

_ctrl = _display displayCtrl 43054;
_ctrl sliderSetRange [100, 500];
_ctrl sliderSetPosition cws_ais_random_lifetime_factor;
_ctrl ctrlCommit 1;

_ctrl = _display displayCtrl 43056;
_ctrl sliderSetRange [10, 500];
_ctrl sliderSetPosition cws_ais_3d_icon_range;
_ctrl ctrlCommit 1;

_ctrl = _display displayCtrl 43058;
_ctrl sliderSetRange [0, 300];
_ctrl sliderSetPosition cws_ais_delTime;
_ctrl ctrlCommit 1;

_ctrl = _display displayCtrl 43060;
_ctrl sliderSetRange [2, 5];
_ctrl sliderSetPosition cws_ais_firstaid_distance;
_ctrl ctrlCommit 1;

_ctrl = _display displayCtrl 43062;
_ctrl sliderSetRange [0.01, 0.99];
_ctrl sliderSetPosition cws_ais_damage_limit;
_ctrl ctrlCommit 1;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl IDC_OK;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);

	//Update the config with the new values
	_ctrl = _display displayCtrl 43052;
	cws_ais_rambofactor = sliderPosition _ctrl;
	_ctrl = _display displayCtrl 43054;
	cws_ais_random_lifetime_factor = sliderPosition _ctrl;
	_ctrl = _display displayCtrl 43056;
	cws_ais_3d_icon_range = sliderPosition _ctrl;
	_ctrl = _display displayCtrl 43058;
	cws_ais_delTime = sliderPosition _ctrl;
	_ctrl = _display displayCtrl 43060;
	cws_ais_firstaid_distance = sliderPosition _ctrl;
	_ctrl = _display displayCtrl 43062;
	cws_ais_damage_limit = sliderPosition _ctrl;
}];