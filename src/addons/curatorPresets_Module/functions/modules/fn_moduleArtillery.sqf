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
	_xCoordinate = uinamespace getVariable "curatorPresets_XValue";
	_yCoordinate = uinamespace getVariable "curatorPresets_YValue";
	_ammoType = uinamespace getVariable "curatorPresets_AmmoTypeValue";
	_roundCount = uinamespace getVariable "curatorPresets_RoundsValue";
	if(isnil "_xCoordinate") exitWith {
		[objnull, "Error - X Coordinate was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};
	if(isnil "_yCoordinate") exitWith {
		[objnull, "Error - Y Coordinate was not defined"] call bis_fnc_showCuratorFeedbackMessage;
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

	//Build the position from the coordinates
	_pos = [parseNumber _xCoordinate, parseNumber _yCoordinate];

	if(_pos inRangeOfArtillery [[_unit], _ammoType]) then {
		//Run the artillery
		_unit commandArtilleryFire [_pos, _ammoType, parseNumber _roundCount];
	
		//Alert Zeus
		[objnull, format["%1 - Fired %3 %4 times with target %5,%6 at %2", name _unit, mapGridPosition _unit, _ammoType, _roundCount, _xCoordinate, _yCoordinate]] call bis_fnc_showCuratorFeedbackMessage;
	} else {
		//Alert Zeus
		[objnull, format["%1 - Out of range, cannot fire with target %3,%4 at %2", name _unit, mapGridPosition _unit, _xCoordinate, _yCoordinate]] call bis_fnc_showCuratorFeedbackMessage;
	};
	
	//Clean up
	uinamespace setVariable ["curatorPresets_ModuleUnit", nil];
	uinamespace setVariable ["curatorPresets_XValue", nil];
	uinamespace setVariable ["curatorPresets_YValue", nil];
	uinamespace setVariable ["curatorPresets_AmmoTypeValue", nil];
	uinamespace setVariable ["curatorPresets_RoundsValue", nil];
	
	deletevehicle _logic;
};