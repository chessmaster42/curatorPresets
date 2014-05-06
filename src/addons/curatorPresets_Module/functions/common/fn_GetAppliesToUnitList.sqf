_appliesTo = _this select 0;
_unit = _this select 1;

_unitList = [];
switch(_appliesTo) do {
	case 0: {
		_unitList = [_unit];
	};
	case 1: {
		_group = group _unit;
		_unitList = units _group;
	};
	case 2: {
		_group = group _unit;
		_leader = leader _group;
		_unitList = units _group - [_leader];
	};
	case 3: {
		_group = group _unit;
		_leader = leader _group;
		_unitList = [_leader];
	};
	case 4: {
		_group = group _unit;
		_sideGroup = side _group;
		{
			if((side _x) == _sideGroup) then {
				_unitList = _unitList + (units _x);
			};
		} forEach allGroups;
	};
	case 5: {
		_unitList = playableUnits;
	};
	default {
		_unitList = [_unit];
	};
};

_unitList