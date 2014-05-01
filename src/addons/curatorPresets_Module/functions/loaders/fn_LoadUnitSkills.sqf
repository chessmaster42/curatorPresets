_unit = _this select 0;
_skillParams = _this select 1;
_appliesTo = _this select 2;

if(local _unit) then {
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

	{
		_x setSkill _skillParams;
	} forEach _unitList;
};