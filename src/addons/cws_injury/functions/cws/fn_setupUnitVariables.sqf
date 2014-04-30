// Authored by chessmaster42
// Based on 'A3 Wounding System' by Psychobastard

private["_unit"];
_unit = _this select 0;

_unit setVariable ["cws_ais_side", _side, true];
_unit setVariable ["cws_ais_itemStorage", [0,0]];
_unit setVariable ["cws_ais_unit_died", false];

if(isNil {_unit getVariable "cws_ais_bodyhit"}) then {_unit setVariable ["cws_ais_bodyhit",0]};
if(isNil {_unit getVariable "cws_ais_headhit"}) then {_unit setVariable ["cws_ais_headhit",0]};
if(isNil {_unit getVariable "cws_ais_overall"}) then {_unit setVariable ["cws_ais_overall",0]};
if(isNil {_unit getVariable "cws_ais_legshit"}) then {_unit setVariable ["cws_ais_legshit",0]};
if(isNil {_unit getVariable "cws_ais_handshit"}) then {_unit setVariable ["cws_ais_handshit",0]};

if(isNil {_unit getVariable "cws_ais_agony"}) then {_unit setVariable ["cws_ais_agony", false]};
if(isNil {_unit getVariable "unit_is_unconscious"}) then {_unit setVariable ["unit_is_unconscious", false]};
if(isNil {_unit getVariable "cws_ais_leader"}) then {_unit setVariable ["cws_ais_leader", false]};

if(isNil {_unit getVariable "dragger"}) then {_unit setVariable ["dragger", ObjNull]};
if(isNil {_unit getVariable "healer"}) then {_unit setVariable ["healer", ObjNull]};

if(isNil {_unit getVariable "cws_ais_fall_in_agony_time_delay"}) then {_unit setVariable ["cws_ais_fall_in_agony_time_delay", 0]};