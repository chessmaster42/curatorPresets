_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

_display = ctrlParent _control;

//Get unit info
_unit = uinamespace getVariable "curatorPresets_ModuleUnit";
_unitClass = typeOf _unit;

//Configure the list box
_ctrl = _display displayctrl 41102;
{
	_name = configName _x;
	_lbComponent = _ctrl lbAdd _name;
} foreach ((configFile >> "cfgVehicles" >> _unitClass >> "AnimationSources") call BIS_fnc_returnChildren);
_ctrl lbSetCurSel 0;
_ctrl ctrlCommit 1;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl 1;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrl = _display displayCtrl 41102;
	uinamespace setVariable ["curatorPresets_UnitAnimationValue", _ctrl lbText lbCurSel _ctrl];
}];