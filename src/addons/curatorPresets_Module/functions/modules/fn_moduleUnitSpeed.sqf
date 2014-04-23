disableSerialization;

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	_unit = [_logic] call cpm_fnc_GetUnitUnderCursor;

	//Save the unit for the UI
	uinamespace setVariable ["curatorPresets_ModuleUnit", _unit];

	//Load up the dialog
	_ok = createDialog "RscDisplayAttributesModuleUnitSpeed";
	waitUntil { dialog };
	sleep 0.1;

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_speed = uinamespace getVariable "curatorPresets_UnitSpeedValue";
	if(isnil "_speed") exitWith {
		[objnull, "Error - Speed was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};

	//Set unit speed
	_unit setSpeedMode _speed;
	
	[objnull, format["%1 - %3 movement speed at %2", name _unit, mapGridPosition _unit, _speed]] call bis_fnc_showCuratorFeedbackMessage;
	
	//Clean up
	uinamespace setVariable ["curatorPresets_ModuleUnit", nil];
	uinamespace setVariable ["curatorPresets_UnitSpeedValue", nil];
	
	deletevehicle _logic;
};