// Authored by chessmaster42
// Based on 'A3 Wounding System' by Psychobastard

private ["_unit","_current_head_damage","_current_body_damage","_current_overall_damage","_current_legs_damage","_current_hands_damage","_average_damage"];
_unit = _this select 0;

if(!local _unit) exitWith {
	if(cws_ais_debugging) then {
		//diag_log format["Unit was remote - %1 damage: %2", _unit, damage _unit];
	};
	damage _unit
};

if(isNil {_unit getVariable "cws_ais_bodyhit"}) then {_unit setVariable ["cws_ais_bodyhit",0]};
if(isNil {_unit getVariable "cws_ais_headhit"}) then {_unit setVariable ["cws_ais_headhit",0]};
if(isNil {_unit getVariable "cws_ais_overall"}) then {_unit setVariable ["cws_ais_overall",0]};
if(isNil {_unit getVariable "cws_ais_legshit"}) then {_unit setVariable ["cws_ais_legshit",0]};
if(isNil {_unit getVariable "cws_ais_handshit"}) then {_unit setVariable ["cws_ais_handshit",0]};

_current_head_damage = _unit getVariable "cws_ais_headhit";
_current_body_damage = _unit getVariable "cws_ais_bodyhit";
_current_overall_damage = _unit getVariable "cws_ais_overall";
_current_legs_damage = _unit getVariable "cws_ais_legshit";
_current_hands_damage = _unit getVariable "cws_ais_handshit";

_average_damage = _current_head_damage * 0.25 + _current_body_damage * 0.25 + _current_overall_damage * 0.25 + _current_legs_damage * 0.125 + _current_hands_damage * 0.125;
if(isNil "_average_damage") exitWith {
	if(cws_ais_debugging) then {
		diag_log format["Average was nil - %1 damage: %2", _unit, damage _unit];
	};
	damage _unit
};
if(_average_damage <= 0) exitWith {
	if(cws_ais_debugging) then {
		diag_log format["Average was 0 - %1 damage: %2", _unit, damage _unit];
	};
	damage _unit
};

_average_damage