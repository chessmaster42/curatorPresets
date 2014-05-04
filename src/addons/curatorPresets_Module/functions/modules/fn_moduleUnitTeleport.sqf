_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	_unit = [_logic] call ccl_fnc_GetUnitUnderCursor;
	if(isNull _unit) exitWith{};

	//Save the unit for the UI
	uinamespace setVariable ["curatorPresets_ModuleUnit", _unit];

	//Load up the dialog
	createDialog "RscDisplayAttributesModuleUnitTeleport";
	waitUntil { dialog };

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_coordinate = uinamespace getVariable "curatorPresets_CoordinateValue";

	//If values were not defined assume the dialog was canceled and exit
	if(isnil "_coordinate") exitWith {
		deletevehicle _logic;
	};

	_unitOldMapPos = mapGridPosition _unit;

	//Set the position of the unit
	_unit setPos _coordinate;

	//Alert Zeus
	[format["%1 - Teleported from %3 to %2", name _unit, mapGridPosition _unit, _unitOldMapPos], 5] call ccl_fnc_ShowMessage;
	
	deletevehicle _logic;
};