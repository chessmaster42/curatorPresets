_unit = _this select 0;
_healer = _this select 1;

//Make sure that _unit is local
if(!local _unit) exitWith {};

_unit setVariable ["healer", _healer, true];