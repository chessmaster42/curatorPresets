#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

//Get unit info
_unit = uinamespace getVariable "curatorPresets_ModuleUnit";
_unitClass = typeOf _unit;

//Configure the list box
_display = ctrlParent _control;
_ctrl = _display displayCtrl 41052;
{
	_name = configName _x;
	_lbComponent = _ctrl lbAdd _name;
} foreach ((configFile >> "cfgVehicles" >> _unitClass >> "HitPoints") call BIS_fnc_returnChildren);
_ctrl lbSetCurSel 0;
_ctrl ctrlCommit 1;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl IDC_OK;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrl = _display displayCtrl 41052;
	uinamespace setVariable ["curatorPresets_UnitComponentValue", _ctrl lbText lbCurSel _ctrl];
}];

//Setup handler when Cancel is clicked
_ctrlButtonCancel = _display displayCtrl IDC_CANCEL;
_ctrlButtonCancel ctrlAddEventHandler ["buttonclick", {
	//Blank out any existing value
	uinamespace setVariable ["curatorPresets_UnitComponentValue", nil];
}];