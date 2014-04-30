// Authored by chessmaster42
// Based on 'A3 Wounding System' by Psychobastard

private ['_unit','_healer','_has_medikit','_has_firstaidkit','_isMedic'];
_unit = _this select 0;
_healer = _this select 1;

_has_medikit = ((items _healer) find "Medikit" > -1);
_has_firstaidkit = ((items _healer) find "FirstAidKit" >= 0);
_isMedic = _healer call cws_fnc_isMedic;

if(!(_isMedic && _has_medikit) && !_has_firstaidkit) exitWith {false};

_current_headhit = _unit getVariable "cws_ais_headhit";
_current_bodyhit = _unit getVariable "cws_ais_bodyhit";
_current_overall = _unit getVariable "cws_ais_overall";
_current_legshit = _unit getVariable "cws_ais_legshit";
_current_handshit = _unit getVariable "cws_ais_handshit";
_revived_counter = _unit getVariable "cws_ais_revived_counter";

_core_healed = 1;
_extremeties_healed = 1;
switch (true) do {
	//Medic: Yes, Medikit: Yes - Free and heal 99% of damage
	case (_isMedic && _has_medikit) : {
		_core_healed = 0.01;
		_extremeties_healed = 0.01;
	};
	//Medic: Yes, FirstAid: Yes - Consume FirstAid and heal 75% of most damage and 50% of legs and hands
	case (_isMedic && _has_firstaidkit) : {
		_healer removeItem "FirstAidKit";
		_core_healed = 0.25;
		_extremeties_healed = 0.5;
	};
	//Medic: No, FirstAid: Yes - Consume FirstAid and heal 50% of damage of damage and 10% of legs and hands
	case (!_isMedic && _has_firstaidkit) : {
		_healer removeItem "FirstAidKit";
		_core_healed = 0.5;
		_extremeties_healed = 0.9;
	};
};

if(local _unit) then {
	_unit setVariable ["cws_ais_headhit", _core_healed * _current_headhit, true];
	_unit setVariable ["cws_ais_bodyhit", _core_healed * _current_bodyhit, true];
	_unit setVariable ["cws_ais_overall", _core_healed * _current_overall, true];
	_unit setVariable ["cws_ais_legshit", _extremeties_healed * _current_legshit, true];
	_unit setVariable ["cws_ais_handshit", _extremeties_healed * _current_handshit, true];

	[_unit] call cws_fnc_setUnitDamage;
} else {
	_unit setVariable ["cws_ais_headhit", _core_healed * _current_headhit];
	_unit setVariable ["cws_ais_bodyhit", _core_healed * _current_bodyhit];
	_unit setVariable ["cws_ais_overall", _core_healed * _current_overall];
	_unit setVariable ["cws_ais_legshit", _extremeties_healed * _current_legshit];
	_unit setVariable ["cws_ais_handshit", _extremeties_healed * _current_handshit];

	[_unit] call cws_fnc_setUnitDamage;

	cws_ais_healed = [_unit, _core_healed * _current_headhit, _core_healed * _current_bodyhit, _core_healed * _current_overall, _extremeties_healed * _current_legshit, _extremeties_healed * _current_handshit, _revived_counter];
	publicVariable "cws_ais_healed";
};

false