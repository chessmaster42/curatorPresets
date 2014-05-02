disableSerialization;

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	_unit = [_logic] call ccl_fnc_GetUnitUnderCursor;
	if(isNull _unit) exitWith{};

	//Save the unit for the UI
	uinamespace setVariable ["curatorPresets_ModuleUnit", _unit];

	//Load up the dialog
	_ok = createDialog "RscDisplayAttributesModuleUnitSkills";
	waitUntil { dialog };
	sleep 0.1;

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_skillsArray = uinamespace getVariable "curatorPresets_UnitSkillsArray";
	_appliesTo = uinamespace getVariable "curatorPresets_AppliesToValue";
	if(isnil "_skillsArray") exitWith {
		[objnull, "Error - 'Skills Array' was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};
	if(isnil "_appliesTo") exitWith {
		[objnull, "Error - 'Applies To' was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};

	//Set unit skills
	{
		_skillType = _x select 0;
		_skillValue = _x select 1;

		[[_unit, [_skillType, _skillValue], _appliesTo], "cpm_fnc_LoadUnitSkills"] spawn ccl_fnc_GlobalExec;
	} forEach _skillsArray;

	
	[objnull, format["%1 - Set skills at %2", name _unit, mapGridPosition _unit]] call bis_fnc_showCuratorFeedbackMessage;
	
	//Clean up
	uinamespace setVariable ["curatorPresets_ModuleUnit", nil];
	
	deletevehicle _logic;
};