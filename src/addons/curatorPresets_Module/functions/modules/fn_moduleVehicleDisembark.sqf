disableSerialization;

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	//Get unit under cursor
	_unit = objnull;
	_mouseOver = missionnamespace getvariable ["bis_fnc_curatorObjectPlaced_mouseOver",[""]];
	if ((_mouseOver select 0) == typename objnull) then {_unit = _mouseOver select 1;};
	if(isnull _unit) exitWith {
		[objnull, "Error - Module was not placed on any unit"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};

	//Get the units in the vehicle
	_vehicleCrew = [
        (commander _unit),
        (gunner _unit),
        (driver _unit)
    ];
	_vehiclePassengers = crew _unit - _vehicleCrew;

	
	//Load up the dialog
	_ok = createDialog "RscDisplayAttributesModuleVehicleDisembark";
	waitUntil { dialog };
	sleep 0.1;

	//Get the dialog display
	_display = findDisplay 44000;

	//Configure the list box in the dialog
	_ctrlUnits = _display displayctrl 44012;
	_ctrlUnits lbAdd "Passengers";
	_ctrlUnits lbAdd "Crew";
	_ctrlUnits lbAdd "All";
	_ctrlUnits lbSetCurSel 0;
	_ctrlUnits ctrlCommit 1;

	//Setup handler when OK is clicked
	_ctrlButtonOK = _display displayCtrl 1;
	_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
		_display = ctrlParent (_this select 0);
		_ctrlUnits = _display displayCtrl 44012;
		uinamespace setVariable ["curatorPresets_UnitsValue", _ctrlUnits lbText lbCurSel _ctrlUnits];
	}];

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_unitsToDisembark = uinamespace getVariable "curatorPresets_UnitsValue";
	if(isnil "_unitsToDisembark") exitWith {
		[objnull, "Error - Unit type was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};

	//Disembark units
	if(_unitsToDisembark == "Crew" || _unitsToDisembark == "All") then {
		{
			if(!isnull _x) then {
				unAssignVehicle _x;
				_x action ["getOut", vehicle _x];
			};
		} forEach _vehicleCrew;
	};
	if(_unitsToDisembark == "Passengers" || _unitsToDisembark == "All") then {
		{
			if(!isnull _x) then {
				unAssignVehicle _x;
				_x action ["getOut", vehicle _x];
			};
		} forEach _vehiclePassengers;
	};
	
	[objnull, format["%1 - %3 disembarked at %2", name _unit, mapGridPosition _unit, _unitsToDisembark]] call bis_fnc_showCuratorFeedbackMessage;
	
	//Clean up
	uinamespace setVariable ["curatorPresets_UnitsValue", nil];
	
	deletevehicle _logic;
};