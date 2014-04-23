_unit = _this select 0;
_action = _this select 1;

if(local _unit) then {
	_unit action [_action];
};