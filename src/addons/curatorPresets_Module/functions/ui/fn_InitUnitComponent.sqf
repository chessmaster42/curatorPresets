_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

_display = ctrlParent _control;

//Get unit info
_unit = uinamespace getVariable "curatorPresets_ModuleUnit";
_unitClass = typeOf _unit;

//Configure the list box in the dialog
_ctrlComponent = _display displayctrl 41052;
{
	_name = configName _x;
	_lbComponent = _ctrlComponent lbAdd _name;
} foreach ((configFile >> "cfgVehicles" >> _unitClass >> "HitPoints") call BIS_fnc_returnChildren);
_ctrlComponent lbSetCurSel 0;
_ctrlComponent ctrlCommit 1;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl 1;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrlComponent = _display displayCtrl 41052;
	uinamespace setVariable ["curatorPresets_UnitComponentValue", _ctrlComponent lbText lbCurSel _ctrlComponent];
}];