#include "\cws_injury\functions\ui\defineResinclDesign.inc"

private ["_control", "_params", "_idc", "_savedValue", "_data", "_selectedIndex", "_display", "_ctrl", "_ctrlButtonOK", "_ctrlButtonCancel"];

_control = _this select 0;
_params = if(count _this > 1) then {_this select 1} else {[]};

_control ctrlRemoveAllEventHandlers "setFocus";

if(count _params < 1) exitWith {};

_idc = _params select 0;
_savedValue = _params select 1;
_data = if(count _params > 2) then {_params select 2} else {[["No", 0],["Yes", 1]]};
_selectedIndex = if(count _params > 3) then {_params select 3} else {0};

if(isNil "_idc" || isNil "_savedValue") exitWith {};

//Configure the list box
_display = ctrlParent _control;
_ctrl = _display displayCtrl _idc;
{
	_text = _x select 0;
	_value = _x select 1;
	_lbComponent = _ctrl lbAdd _text;
	_ctrl lbSetValue [_lbComponent, _value];
} foreach _data;
_ctrl lbSetCurSel _selectedIndex;
_ctrl ctrlCommit 0;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl IDC_OK;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick",
	format [
		"_ctrl = (ctrlParent (_this select 0)) displayCtrl %1;
		uinamespace setVariable ['%2', _ctrl lbValue lbCurSel _ctrl];",
		_idc, _savedValue
	]
];

//Setup handler when Cancel is clicked
_ctrlButtonCancel = _display displayCtrl IDC_CANCEL;
_ctrlButtonCancel ctrlAddEventHandler ["buttonclick",
	format [
		"uinamespace setVariable ['%1', nil];",
		_idc
	]	
];