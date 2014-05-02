_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then
{
	_unit = [_logic] call ccl_fnc_GetUnitUnderCursor;
	if(isNull _unit) exitWith{};

	[[_unit], "cws_fnc_reviveUnit"] spawn ccl_fnc_GlobalExec;

	[format["%1 is now revived at %2", name _unit, mapGridPosition _unit], 3, ["CWS"]] call ccl_fnc_ShowMessage;
	
	deletevehicle _logic;
};