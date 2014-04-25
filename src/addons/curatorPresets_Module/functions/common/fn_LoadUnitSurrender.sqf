_unit = _this select 0;
_mode = if(count _this > 1) then {_this select 1} else {0};

//Mode 0 - Unit is surrendering
if(_mode == 0) then {
	if(local _unit) then {
		removeAllWeapons _unit;
		_unit setCaptive true;
		_unit allowFleeing 0;
		_unit disableAI "MOVE";
	};
	_unit switchmove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
	
	_secureAction = _unit addAction ["Secure Hostage", {
		_captive = _this select 0;
		_captor = _this select 1;
		[[_captive, 1, _captor], "cpm_fnc_LoadUnitSurrender"] spawn cpm_fnc_GlobalExec;
	}, _unit, 6, false, true];
	if(local _unit) then {
		_unit setVariable ["curatorPresets_secureAction", _secureAction, true];
	};
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

	_secureAction = _unit getVariable "curatorPresets_secureAction";
	if(!isnil "_secureAction") then {
		_unit removeAction _secureAction;
		if(local _unit) then {
			_unit setVariable ["curatorPresets_secureAction", nil, true];
		};
	};
};