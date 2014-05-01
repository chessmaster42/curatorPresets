_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	_unit = [_logic] call ccl_fnc_GetUnitUnderCursor;

	//Save the unit for the UI
	uinamespace setVariable ["curatorPresets_ModuleUnit", _unit];

	//Load up the dialog
	_ok = createDialog "RscDisplayAttributesModuleAirFlight";
	waitUntil { dialog };
	sleep 0.1;

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_speed = uinamespace getVariable "curatorPresets_UnitSpeedValue";
	_altitude = uinamespace getVariable "curatorPresets_AltitudeValue";
	if(isnil "_speed") exitWith {
		[objnull, "Error - 'Speed' was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};
	if(isnil "_altitude") exitWith {
		[objnull, "Error - Altitude was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};

	//Set the unit's flight altitude
	_tempPos = getPosATL _unit;
	_wpPos = [_tempPos select 0, _tempPos select 1, _altitude];
	_unit move _wpPos;
	_unit flyInHeight _altitude;

	//Set the unit's movement speed
	switch (_speed) do {
		case 0: {
			_speed = "LIMITED";
		};
		case 1: {
			_speed = "NORMAL";
		};
		case 2: {
			_speed = "FULL";
		};
	};
	_unit setSpeedMode _speed;
	
	[objnull, format["%1 - Altitude set to %3 at %2", name _unit, mapGridPosition _unit, _altitude]] call bis_fnc_showCuratorFeedbackMessage;
	
	//Clean up
	uinamespace setVariable ["curatorPresets_ModuleUnit", nil];

	deletevehicle _logic;
};