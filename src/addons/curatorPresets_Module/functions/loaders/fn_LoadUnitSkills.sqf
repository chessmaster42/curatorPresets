_unit = _this select 0;
_skillParams = _this select 1;
_appliesTo = _this select 2;

if(local _unit) then {
	_unitList = [_appliesTo, _unit] call cpm_fnc_GetAppliesToUnitList;

	{
		_x setSkill _skillParams;
	} forEach _unitList;
};