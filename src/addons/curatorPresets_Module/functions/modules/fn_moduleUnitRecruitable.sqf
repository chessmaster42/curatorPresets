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
	
	[[_unit], "cpm_fnc_LoadRecruitable"] spawn cpm_fnc_GlobalExec;
	
	[objnull, format["%1 - Recruitable at %2", name _unit, mapGridPosition _unit]] call bis_fnc_showCuratorFeedbackMessage;
	
	deletevehicle _logic;
};