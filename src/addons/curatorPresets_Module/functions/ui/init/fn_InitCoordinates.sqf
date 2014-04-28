_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

_display = ctrlParent _control;
_ctrlX = _display displayCtrl 41002;
_ctrlY = _display displayCtrl 41004;

//Get unit info
_unit = uinamespace getVariable "curatorPresets_ModuleUnit";

//Configure the coordinates with the unit's current position
_pos = position _unit;
_ctrlX ctrlSetText str(_pos select 0);
_ctrlY ctrlSetText str(_pos select 1);

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl 1;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrlX = _display displayCtrl 41002;
	_ctrlY = _display displayCtrl 41004;
	_coord = [parseNumber ctrlText _ctrlX, parseNumber ctrlText _ctrlY, 0];
	uinamespace setVariable ["curatorPresets_CoordinateValue", _coord];
}];

//Setup handler when Cancel is clicked
_ctrlButtonCancel = _display displayCtrl 2;
_ctrlButtonCancel ctrlAddEventHandler ["buttonclick", {
	//Blank out any existing value
	uinamespace setVariable ["curatorPresets_CoordinateValue", nil];
}];