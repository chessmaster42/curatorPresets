// Authored by chessmaster42
// Based on 'A3 Wounding System' by Psychobastard

#define __includedMates (units group _unit - [_unit])
private ["_unit","_need_help","_help_him"];
_unit = _this select 0;
_need_help = false;
_help_him = objNull;

{
	if (_x getVariable "cws_ais_agony") then {_need_help = true};
	if (_need_help) exitWith {_help_him = _x}
} forEach __includedMates;

if(cws_ais_debugging) then {
	diag_log format["%1 is going to help %2", _unit, _help_him];
};

if (_need_help) then {
	if (!isNull _help_him) then {
		[_help_him, _unit] spawn cws_fnc_sendAIHealer;
	};
};