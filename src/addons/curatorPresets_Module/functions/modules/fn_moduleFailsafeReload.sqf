_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	if([player] call cpm_fnc_IsZeusCurator) then
	{
		[] call cpm_fnc_InitCPM;
		[] call cpm_fnc_InitCPMEvents;
		[] call cpm_fnc_InitCPMGUI;
	};

	deletevehicle _logic;
};