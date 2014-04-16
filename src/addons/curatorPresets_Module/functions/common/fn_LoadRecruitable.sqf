_unit = _this select 0;

_unit addAction [format ["Recruit %1", name _unit], {[_this select 0] join (_this select 1)}, _unit, 6, false, true];