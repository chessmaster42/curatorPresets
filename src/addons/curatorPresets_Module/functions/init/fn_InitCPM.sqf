//TODO - Add this to some sort of config
missionnamespace setVariable ["curatorPresets_Debugging", true];

if(isServer && isDedicated) exitWith {};

[] spawn {
	[] call cpm_fnc_WaitForCuratorLoad;

	["Initializing ...", 4] call cpm_fnc_ShowMessage;

	{
		[format["Initializing curator %1", _x], 99] call cpm_fnc_ShowMessage;
		//Load the addon server-side
		if(isServer) then {
			_x addCuratorAddons ["curatorPresets_Module"];
		};

		//Load the 3D icons client-side for curators
		if([player] call cpm_fnc_IsZeusCurator) then
		{
			_3dIcons = addMissionEventHandler ["Draw3D", {[] call cpm_fnc_DrawCWSIcons}];
			_x setVariable ["curatorPresets_CWS_3DIconHandler", _3dIcons];
		};
	} foreach allCurators;

	//Build an array of all units that currently have CWS loaded
	_initialCWSUnitsArray = [];
	{
		{
			if (_x getVariable "cws_ais_aisInit") then {
				_initialCWSUnitsArray = _initialCWSUnitsArray + [_x];
			};
		} forEach units _x;
	} forEach allGroups;
	missionnamespace setVariable ["curatorPresets_CWS_Units", _initialCWSUnitsArray];

	["Initialized", 4] call cpm_fnc_ShowMessage;
};