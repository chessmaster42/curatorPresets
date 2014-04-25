_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	_unit = [_logic] call cpm_fnc_GetUnitUnderCursor;

	//Save the unit for the UI
	uinamespace setVariable ["curatorPresets_ModuleUnit", _unit];

	//Load up the dialog
	_ok = createDialog "RscDisplayAttributesModuleAirFlight";
	waitUntil { dialog };
	sleep 0.1;

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_zCoordinate = uinamespace getVariable "curatorPresets_ZValue";
	if(isnil "_zCoordinate") exitWith {
		[objnull, "Error - Altitude was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};

	//Set the unit's flight altitude
	_unit move getPosATL _unit;
	_unit flyInHeight (parseNumber _zCoordinate);
	
	[objnull, format["%1 - Altitude set to %3 at %2", name _unit, mapGridPosition _unit, _zCoordinate]] call bis_fnc_showCuratorFeedbackMessage;
	
	//Clean up
	uinamespace setVariable ["curatorPresets_ModuleUnit", nil];
	uinamespace setVariable ["curatorPresets_ZValue", nil];

	deletevehicle _logic;
};