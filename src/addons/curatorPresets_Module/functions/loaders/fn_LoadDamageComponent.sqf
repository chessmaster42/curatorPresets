_unit = _this select 0;
_componentName = _this select 1;
_hit = _this select 2;

if(local _unit) then {
	_unit setHit [_componentName, _hit];
};