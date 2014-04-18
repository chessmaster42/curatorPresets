_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

_display = ctrlParent _control;
_ctrlZ = _display displayCtrl 41082;

//Get unit info
_unit = uinamespace getVariable "curatorPresets_ModuleUnit";

//Configure the altitude with the unit's current position
_pos = position _unit;
_ctrlZ ctrlSetText str(_pos select 2);

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl 1;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrlZ = _display displayCtrl 41082;
	uinamespace setVariable ["curatorPresets_ZValue", ctrlText _ctrlZ];
}];