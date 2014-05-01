_unit = _this select 0;
_mode = _this select 1;
_appliesTo = if(_mode == 0) then {_this select 2} else {0};

//Mode 0 - Unit is surrendering
if(_mode == 0) then {
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
		if(local _x) then {
			removeAllWeapons _x;
			_x setCaptive true;
			_x allowFleeing 0;
			_x disableAI "MOVE";
		};
		_x switchmove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
		
		_secureAction = _x addAction ["Secure Hostage", {
			_captive = _this select 0;
			_captor = _this select 1;
			[[_captive, 1, _captor], "cpm_fnc_LoadUnitSurrender"] spawn ccl_fnc_GlobalExec;
		}, _x, 6, false, true];
		if(local _x) then {
			_x setVariable ["curatorPresets_Action_SecureHostage", _secureAction, true];
		};
	} forEach _unitList;
};

//Mode 1 - Surrendered unit is being secured
if(_mode == 1) then {
	if(local _unit) then {
		if(count _this > 2) then {
			[_unit] join (_this select 2);
		};
		_unit setCaptive false;
		_unit allowFleeing 1;
		_unit enableAI "MOVE";
	};
	_unit switchmove "";

	_secureAction = _unit getVariable "curatorPresets_Action_SecureHostage";
	if(!isnil "_secureAction") then {
		_unit removeAction _secureAction;
		if(local _unit) then {
			_unit setVariable ["curatorPresets_Action_SecureHostage", nil, true];
		};
	};
};