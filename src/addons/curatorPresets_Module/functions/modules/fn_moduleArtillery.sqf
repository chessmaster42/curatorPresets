disableSerialization;

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	_unit = [_logic] call cpm_fnc_GetUnitUnderCursor;

	//Save the unit for the UI
	uinamespace setVariable ["curatorPresets_ModuleUnit", _unit];

	//Load up the dialog
	_ok = createDialog "RscDisplayAttributesModuleArtillery";
	waitUntil { dialog };
	sleep 0.1;

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_coordinate = uinamespace getVariable "curatorPresets_CoordinateValue";
	_ammoType = uinamespace getVariable "curatorPresets_AmmoTypeValue";
	_roundCount = uinamespace getVariable "curatorPresets_RoundsValue";
	if(isnil "_coordinate") exitWith {
		[objnull, "Error - 'Coordinates' was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};
	if(isnil "_ammoType") exitWith {
		[objnull, "Error - Ammo Type was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};
	if(isnil "_roundCount") exitWith {
		[objnull, "Error - Round Count was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};

	if(_coordinate inRangeOfArtillery [[_unit], _ammoType]) then {
		//Run the artillery
		_unit commandArtilleryFire [_coordinate, _ammoType, parseNumber _roundCount];
	
		//Alert Zeus
		[objnull, format["%1 - Fired %3 %4 times at %5 from %2", name _unit, mapGridPosition _unit, _ammoType, _roundCount, _coordinate]] call bis_fnc_showCuratorFeedbackMessage;
	} else {
		//Alert Zeus
		[objnull, format["%1 - Out of range, cannot fire at %3 from %2", name _unit, mapGridPosition _unit, _coordinate]] call bis_fnc_showCuratorFeedbackMessage;
	};
	
	//Clean up
	uinamespace setVariable ["curatorPresets_ModuleUnit", nil];
	
	deletevehicle _logic;
};