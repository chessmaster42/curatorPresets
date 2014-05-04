_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	if([player] call ccl_fnc_IsZeusCurator) then
	{
		[] call cws_fnc_InitCWS;
		[] call cws_fnc_InitCWSGUI;
	};

	deletevehicle _logic;
};