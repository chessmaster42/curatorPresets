_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

//Get unit info
_unit = uinamespace getVariable "curatorPresets_ModuleUnit";

//Configure the list box
_display = ctrlParent _control;
_ctrlUnits = _display displayCtrl 41072;
{
	_lbComponent = _ctrlUnits lbAdd _x;
} foreach ["Passengers","Crew","All"];
_ctrlUnits lbSetCurSel 0;
_ctrlUnits ctrlCommit 1;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl 1;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_display = ctrlParent (_this select 0);
	_ctrlUnits = _display displayCtrl 41072;
	uinamespace setVariable ["curatorPresets_VehicleUnitsValue", _ctrlUnits lbText lbCurSel _ctrlUnits];
}];