_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	_unit = [_logic] call ccl_fnc_GetUnitUnderCursor;
	if(isNull _unit) exitWith{};

	//Save the unit for the UI
	uinamespace setVariable ["curatorPresets_ModuleUnit", _unit];

	//Load up the dialog
	createDialog "RscDisplayAttributesModuleDamageComponent";
	waitUntil { dialog };

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_component = uinamespace getVariable "curatorPresets_UnitComponentValue";
	_hit = uinamespace getVariable "curatorPresets_DamageValue";

	//If values were not defined assume the dialog was canceled and exit
	if(isnil "_component" || isnil "_hit") exitWith {
		deletevehicle _logic;
	};

	//Get class of unit
	_unitClass = typeOf _unit;
	
	//Calculate the component name
	_componentName = getText(configFile >> "cfgVehicles" >> _unitClass >> "HitPoints" >> _component >> "name");

	//Damage the component
	[[_unit, _componentName, _hit], "cpm_fnc_LoadDamageComponent"] spawn ccl_fnc_GlobalExec;

	//Alert Zeus
	[objnull, format["%1 - Component %3 has %4 damage at %2", name _unit, mapGridPosition _unit, _componentName, _hit]] call bis_fnc_showCuratorFeedbackMessage;
	
	deletevehicle _logic;
};