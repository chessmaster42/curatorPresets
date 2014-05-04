_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	_unit = [_logic] call ccl_fnc_GetUnitUnderCursor;
	if(isNull _unit) exitWith{};

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
	createDialog "RscDisplayAttributesModuleVehicleDisembark";
	waitUntil { dialog };

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_unitsToDisembark = uinamespace getVariable "curatorPresets_VehicleUnitsValue";

	//If values were not defined assume the dialog was canceled and exit
	if(isnil "_unitsToDisembark") exitWith {
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
	
	[format["%1 - %3 disembarked at %2", name _unit, mapGridPosition _unit, _unitsToDisembark], 5] call ccl_fnc_ShowMessage;
	
	deletevehicle _logic;
};