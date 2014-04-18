_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	//--- Get unit under cursor
	_unit = objnull;
	_mouseOver = missionnamespace getvariable ["bis_fnc_curatorObjectPlaced_mouseOver",[""]];
	if ((_mouseOver select 0) == typename objnull) then {_unit = _mouseOver select 1;};
	if(isnull _unit) exitWith {
		[objnull, "Error - Module was not placed on any unit"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};
	
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
	_unit flyInHeight (parseNumber _zCoordinate);
	
	[objnull, format["%1 - Altitude set to %3 at %2", name _unit, mapGridPosition _unit, _zCoordinate]] call bis_fnc_showCuratorFeedbackMessage;
	
	//Clean up
	uinamespace setVariable ["curatorPresets_ModuleUnit", nil];
	uinamespace setVariable ["curatorPresets_ZValue", nil];

	deletevehicle _logic;
};