if (count _this < 3) exitWith {
	[objnull, "Error - Not enough params"] call bis_fnc_showCuratorFeedbackMessage;
};

_curator = _this select 0;
_group = _this select 1;
_wpID = _this select 2;

uinamespace setVariable ["curatorPresets_Module_CuratorPlacedWaypoint", [_group, _wpID]];

if(uinamespace getVariable ["curatorPresets_Module_PlacingCustomWaypoint", false]) then {
	deleteWaypoint [_group, _wpID];
	[[_group, _wpID], "cpm_fnc_RemoveWaypoint", false] call ccl_fnc_GlobalExec;
};