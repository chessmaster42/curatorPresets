// Authored by chessmaster42
// Based on 'A3 Wounding System' by Psychobastard

#define __includedMates (units group _unit - [_unit])
private ["_unit","_canHeal","_need_help","_help_him"];
_unit = _this select 0;

//Stop looking for wounded if we can't heal anyone
_canHeal = [_unit] call cws_fnc_canHeal;
if(!_canHeal) exitWith {};

_help_him = objNull;

//Check for group members that might need help
{
	_isHealable = [_x] call cws_fnc_IsHealable;
	_inAgony = _x getVariable ["cws_ais_agony", false];
	if (_isHealable && _inAgony) exitWith {_help_him = _x};
} forEach __includedMates;

//If noone in the group needs help see if anyone else nearby does
if(isNull _help_him) then {
	_min_distance = 100;
	_unitFaction = side (group _unit);
	{
		//Ensure that the group we're checking is on the same side as the unit
		if((side _x) == _unitFaction) then {
			{
				_distance = _unit distance _x;
				_isHealable = [_x] call cws_fnc_IsHealable;
				_inAgony = _x getVariable ["cws_ais_agony", false];

				//Update the selection if closer, in agony, are healable, and our not ourselves
				if ((_distance < _min_distance) && _isHealable && _inAgony && (_x != _unit)) then {
					_min_distance = _distance;
					_help_him = _x;
				};
			} foreach units _x;
		};
	} forEach allGroups;
};

//Check if we found someone to help
if(isNull _help_him) then {
	if(cws_ais_debugging) then {
		[format ["%1 found nobody to help", _unit], 2] call ccl_fnc_ShowMessage;
	};
} else {
	if(cws_ais_debugging) then {
		diag_log format["%1 is going to help %2", _unit, _help_him];
	};

	//Go help them!
	[_help_him, _unit] spawn cws_fnc_FirstAid;
};