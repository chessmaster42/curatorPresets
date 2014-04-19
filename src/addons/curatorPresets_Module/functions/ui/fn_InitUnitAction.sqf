_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

_display = ctrlParent _control;

//Get unit info
_unit = uinamespace getVariable "curatorPresets_ModuleUnit";

//Configure the list box
_ctrl = _display displayctrl 41092;
{
	_name = configName _x;
	_lbComponent = _ctrl lbAdd _name;
} foreach ((configFile >> "cfgActions") call BIS_fnc_returnChildren);
_ctrl lbSetCurSel 0;
_ctrl ctrlCommit 1;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl 1;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrl = _display displayCtrl 41092;
	uinamespace setVariable ["curatorPresets_UnitActionValue", _ctrl lbText lbCurSel _ctrl];
}];