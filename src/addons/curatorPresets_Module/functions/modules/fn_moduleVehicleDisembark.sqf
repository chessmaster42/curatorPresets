disableSerialization;

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	_unit = [_logic] call cpm_fnc_GetUnitUnderCursor;

	//Save the unit for the UI
	uinamespace setVariable ["curatorPresets_ModuleUnit", _unit];

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

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_unitsToDisembark = uinamespace getVariable "curatorPresets_VehicleUnitsValue";
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
	uinamespace setVariable ["curatorPresets_ModuleUnit", nil];
	
	deletevehicle _logic;
};