_unit = _this select 0;
_progress = _this select 1;

if(!local _unit) exitWith {};

_unit setVariable ["cws_ais_healing_progress", _progress, true];