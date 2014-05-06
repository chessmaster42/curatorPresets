_unit = _this select 0;
_appliesTo = _this select 1;

_unitList = [_appliesTo, _unit] call cpm_fnc_GetAppliesToUnitList;

if(count _unitList < 1) exitWith {};

{
	_recruitAction = _x addAction [format ["Recruit %1", name _x], {
		_target = _this select 0;
		[_target] join (group (_this select 1));
		_action = _target getVariable "curatorPresets_Action_Recruitable";
		_target removeAction _action;
	}, _x, 6, false, true];
	_x setVariable ["curatorPresets_Action_Recruitable", _recruitAction, true];
} forEach _unitList;