_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	//TEMP
	if(true) exitWith {
		[objnull, "Error - Animation module not yet implemented"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};
	//ENDTEMP

	_unit = [_logic] call ccl_fnc_GetUnitUnderCursor;
	if(isNull _unit) exitWith{};

	//Save the unit for the UI
	uinamespace setVariable ["curatorPresets_ModuleUnit", _unit];

	//Load up the dialog
	_ok = createDialog "RscDisplayAttributesModuleUnitAnimation";
	waitUntil { dialog };
	sleep 0.5;

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_animation = uinamespace getVariable "curatorPresets_UnitAnimationValue";
	_appliesTo = uinamespace getVariable "curatorPresets_AppliesToValue";
	if(isnil "_appliesTo") exitWith {
		[objnull, "Error - 'Applies To' was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};
	if(isnil "_animation") exitWith {
		[objnull, "Error - 'Animation' was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};

	//TODO - Run the animation on the unit

	[objnull, format["%1 - Animation %3 activated at %2", name _unit, mapGridPosition _unit, _animation]] call bis_fnc_showCuratorFeedbackMessage;
	
	//Clean up
	uinamespace setVariable ["curatorPresets_ModuleUnit", nil];

	deletevehicle _logic;
};