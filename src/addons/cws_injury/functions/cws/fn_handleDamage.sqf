// Authored by chessmaster42
// Based on 'A3 Wounding System' by Psychobastard

private ['_unit','_bodypart','_damage','_source','_ammo','_scaled_damage','_agony','_part_total_damage','_scale','_delay','_can_die'];
_unit 		= _this select 0;
_bodypart	= _this select 1;
_damage		= _this select 2;
_source		= _this select 3;
_ammo		= _this select 4;

_scaled_damage = _damage / (cws_ais_rambofactor max 1);
_agony = false;

if(cws_ais_debugging) then {
	//diag_log format["%1 took %2 damage in the %3 from %4", _unit, _scaled_damage, _bodypart, _source];
};

//Stop any damage that doesn't have a source defined
//This is a known bug with HandleDamage EVH
if(isNull _source) exitWith {0};

//Skip over the unit if it's not local
if(!local _unit) exitWith {0};

//If the unit is no longer alive flag them has having died and exit
if (!alive _unit) exitWith {
	_unit setVariable ["cws_ais_unit_died", true];
	0
};

if(cws_ais_debugging) then {
	//diag_log format["%1 has %2 AIS damage and %3 vanilla damage", _unit, [_unit] call cws_fnc_getUnitDamage, damage _unit];
};

if(isNil {_unit getVariable "cws_ais_bodyhit"}) then {_unit setVariable ["cws_ais_bodyhit",0]};
if(isNil {_unit getVariable "cws_ais_headhit"}) then {_unit setVariable ["cws_ais_headhit",0]};
if(isNil {_unit getVariable "cws_ais_overall"}) then {_unit setVariable ["cws_ais_overall",0]};
if(isNil {_unit getVariable "cws_ais_legshit"}) then {_unit setVariable ["cws_ais_legshit",0]};
if(isNil {_unit getVariable "cws_ais_handshit"}) then {_unit setVariable ["cws_ais_handshit",0]};

if(cws_ais_debugging) then {
	//diag_log format["%1 has %2 AIS damage and %3 vanilla damage", _unit, [_unit] call cws_fnc_getUnitDamage, damage _unit];
};

switch _bodypart do {
	case "body" : {
		_part_total_damage = (_unit getVariable "cws_ais_bodyhit") + _scaled_damage;
		_unit setVariable ["cws_ais_bodyhit", _part_total_damage];
		if (_part_total_damage >= 0.9) then {
			_agony = true;
		} else {
			_unit setHit ["body", _part_total_damage];
		};
	};
	case "head" : {
		_part_total_damage = (_unit getVariable "cws_ais_headhit") + _scaled_damage * 2;
		_unit setVariable ["cws_ais_headhit", _part_total_damage];
		if (_part_total_damage >= 0.9) then {
			_agony = true;
		} else {
			_unit setHit ["head", _part_total_damage];
		};
	};
	case "legs" : {
		_part_total_damage = (_unit getVariable "cws_ais_legshit") + _scaled_damage;
		_unit setVariable ["cws_ais_legshit", _part_total_damage];
		if (_part_total_damage >= 1.8) then {
			_agony = true;
		} else {
			_unit setHit ["legs", _part_total_damage];
		};
	};
	case "legs_l" : {
		_part_total_damage = (_unit getVariable "cws_ais_legshit") + _scaled_damage;
		_unit setVariable ["cws_ais_legshit", _part_total_damage];
		if (_part_total_damage >= 1.8) then {
			_agony = true;
		} else {
			_unit setHit ["legs", _part_total_damage];
		};
	};
	case "legs_r" : {
		_part_total_damage = (_unit getVariable "cws_ais_legshit") + _scaled_damage;
		_unit setVariable ["cws_ais_legshit", _part_total_damage];
		if (_part_total_damage >= 1.8) then {
			_agony = true;
		} else {
			_unit setHit ["legs", _part_total_damage];
		};
	};
	case "hands" : {
		_part_total_damage = (_unit getVariable "cws_ais_handshit") + _scaled_damage;
		_unit setVariable ["cws_ais_handshit", _part_total_damage];
		if (_part_total_damage >= 2.3) then {
			_agony = true;
		} else {
			_unit setHit ["hands", _part_total_damage];
		};
	};
	case "hands_l" : {
		_part_total_damage = (_unit getVariable "cws_ais_handshit") + _scaled_damage;
		_unit setVariable ["cws_ais_handshit", _part_total_damage];
		if (_part_total_damage >= 2.3) then {
			_agony = true;
		} else {
			_unit setHit ["hands", _part_total_damage];
		};
	};
	case "hands_r" : {
		_part_total_damage = (_unit getVariable "cws_ais_handshit") + _scaled_damage;
		_unit setVariable ["cws_ais_handshit", _part_total_damage];
		if (_part_total_damage >= 2.3) then {
			_agony = true;
		} else {
			_unit setHit ["hands", _part_total_damage];
		};
	};
	default {
		_part_total_damage = (_unit getVariable "cws_ais_overall") + _scaled_damage;
		_unit setVariable ["cws_ais_overall", _part_total_damage];
		if (_part_total_damage >= 0.9) then {
			_agony = true;
		};
	};
};

//If the agony request flag is set and the unit isn't already in agony, put the unit into agony
if (_agony && !(_unit getVariable "cws_ais_agony")) then {
	//Set the invulnerability timer so the unit can't die when first going into agony
	_delay = time + 10;
	_unit setVariable ["cws_ais_fall_in_agony_time_delay", _delay];

	//Set the agony state
	_unit setVariable ["cws_ais_agony", true, true];
};

//Determine if the unit can die from this damage
_can_die = if((_unit getVariable "cws_ais_agony") && (time > (_unit getVariable "cws_ais_fall_in_agony_time_delay"))) then {true} else {false};

//If revive guaranty is turned off then force enable _can_die
if(!cws_ais_revive_guaranty) then {
    _can_die = true;
};

//If the unit can die make sure that we don't scale the damage at all
//Otherwise scale down the damage
if(_can_die) then {
	_scale = 1.0;
} else {
	_scale = cws_ais_damage_limit / (([_unit] call cws_fnc_getUnitDamage) max cws_ais_damage_limit);
};

if(cws_ais_debugging) then {
	//diag_log format["%1 Damaged: AIS=%2, Vanilla=%3, CanDie=%4", _unit, [_unit] call cws_fnc_getUnitDamage, damage _unit, _can_die];
};

_unit setVariable ["cws_ais_headhit", (_unit getVariable "cws_ais_headhit") * _scale, true];
_unit setVariable ["cws_ais_bodyhit", (_unit getVariable "cws_ais_bodyhit") * _scale, true];
_unit setVariable ["cws_ais_overall", (_unit getVariable "cws_ais_overall") * _scale, true];
_unit setVariable ["cws_ais_legshit", (_unit getVariable "cws_ais_legshit") * _scale, true];
_unit setVariable ["cws_ais_handshit", (_unit getVariable "cws_ais_handshit") * _scale, true];

[_unit, _can_die] call cws_fnc_setUnitDamage;

if(cws_ais_debugging) then {
	//diag_log format["%1 Damaged: AIS=%2, Vanilla=%3, CanDie=%4", _unit, [_unit] call cws_fnc_getUnitDamage, damage _unit, _can_die];
};

0