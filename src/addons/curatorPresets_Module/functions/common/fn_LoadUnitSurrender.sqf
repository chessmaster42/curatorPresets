_unit = _this select 0;

if(local _unit) then {
	removeAllWeapons _unit;
	_unit setCaptive true;
	_unit allowFleeing 0;
	_unit disableAI "MOVE";
	_unit switchmove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
	dostop _unit;
};

_unit addAction ["Secure Hostage", {
	_captive = _this select 0;
	[_captive] join (_this select 1);
	_captive setCaptive false;
	_captive allowFleeing 1;
	_captive enableAI "MOVE";
	_captive switchmove "";
}, _unit, 6, false, true];