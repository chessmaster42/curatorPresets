// Authored by chessmaster42
// Based on 'A3 Wounding System' by Psychobastard

#define __includedMates (units group _unit - [_unit])
private ["_unit","_need_help","_help_him"];
_unit = _this select 0;
_need_help = false;
_help_him = objNull;

{
	if (_x getVariable "cws_ais_agony") then {_need_help = true};
	if (_need_help) exitWith {_help_him = _x}
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

				//Update the selection if closer, alive, in agony, and doesn't have a healer yet
				if (_distance < _min_distance && alive _x && (_x getVariable "cws_ais_agony") && isNull(_unit getVariable ["healer", objNull])) then {
					_min_distance = _distance;
					_help_him = _x;
				};
			} foreach units _x;
		};
	} forEach allGroups;
};

if(cws_ais_debugging) then {
	if(isNull _help_him) then {
		diag_log format["%1 found noone to help", _unit];
	} else {
		diag_log format["%1 is going to help %2", _unit, _help_him];
	};
};

if (_need_help) then {
	if (!isNull _help_him) then {
		[_help_him, _unit] spawn cws_fnc_sendAIHealer;
	};
};