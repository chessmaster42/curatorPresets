_unit = _this select 0;
_appliesTo = _this select 1;

_unitList = [];
switch(_appliesTo) do {
	case 0: {
		_unitList = [_unit];
	};
	case 1: {
		_group = group _unit;
		_unitList = units _group;
	};
	default {
		_unitList = [_unit];
	};
};

if(count _unitList < 1) exitWith {};

{
	_x addAction [format ["Recruit %1", name _x], {[_this select 0] join (group (_this select 1))}, _x, 6, false, true];
} forEach _unitList;