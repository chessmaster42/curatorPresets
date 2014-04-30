// Authored by chessmaster42
// Based on 'A3 Wounding System' by Psychobastard

private ["_key","_return"];
_key = _this select 1;
_return = false;
_return = if ((player getVariable 'unit_is_unconscious') && {_key in [34]}) then {true} else {false};	// throw grenade
{
	if ((player getVariable 'unit_is_unconscious') && {_key in (actionkeys _x)}) then {
		_return = (_key == (actionkeys _x) select 0);
	};
} forEach ['ReloadMagazine','Gear','SwitchWeapon','Diary'];

_return