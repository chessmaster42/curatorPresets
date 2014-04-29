_unit = _this select 0;
_result = false;

//if(!(_unit call bis_fnc_isUnitVirtual)) exitWith {false};

//if(!(_unit call bis_fnc_isCurator)) exitWith {false};

{
	_player = getassignedcuratorunit _x;
	if(_unit == _player) exitWith {
		_result = true
	};
} foreach allCurators;

//[format["Unit = %1; IsCurator = %2", _unit, _result], 99] call cpm_fnc_ShowMessage;

_result