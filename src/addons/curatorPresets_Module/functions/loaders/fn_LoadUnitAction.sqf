_unit = _this select 0;
_action = _this select 1;
_appliesTo = _this select 2;

if(local _unit) then {
	switch(_appliesTo) do {
		case 0: {
			_unit action [_action];
		};
		case 1: {
			_group = group _unit;
			{
				_x action [_action];
			} forEach units _group;
		};
		case 2: {
			_group = group _unit;
			_leader = leader _group;
			{
				_x action [_action];
			} forEach (units _group - _leader);
		};
		case 3: {
			_group = group _unit;
			_leader = leader _group;
			_leader action [_action];
		};
		case 5: {
			{
				_x action [_action];
			} forEach playableUnits;
		};
		default {
			_unit action [_action];
		};
	};
};