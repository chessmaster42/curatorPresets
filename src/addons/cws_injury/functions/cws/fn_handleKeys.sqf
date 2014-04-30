// Authored by chessmaster42
// Based on 'A3 Wounding System' by Psychobastard

private ["_key","_shift_state","_ctrl_state","_return","_isMedic"];
_key = _this select 1;
_shift_state = _this select 2;
_ctrl_state = _this select 3;

_return = _this call cws_fnc_keyUnbind;

//If one of the unbindings triggered then leave here
if(_return) exitWith {true};

//Check for self-revive key binding (Ctrl+E)
//The First Aid function checks that the player is a medic and has supplies, no need to check it here
if(_ctrl_state && {_key in [18]} && (player getVariable 'unit_is_unconscious') && cws_ais_allow_self_revive) then {
	[player, player, true] spawn cws_fnc_firstaid;
};

false