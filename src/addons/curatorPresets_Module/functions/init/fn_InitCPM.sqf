missionnamespace setVariable ["curatorPresets_Debugging", true];

[] spawn {
	[] call ccl_fnc_WaitForCuratorLoad;

	["Initializing ...", 2, ["CPM"]] call ccl_fnc_ShowMessage;

	{
		//Load the addon server-side
		if(isServer) then {
			_x addCuratorAddons ["curatorPresets_Module"];
		};

		if(isServer && isDedicated) exitWith {};

		if([player] call ccl_fnc_IsZeusCurator) then
		{
			//Load the 3D icons client-side for curators
			_3dIcons = addMissionEventHandler ["Draw3D", {[] call cpm_fnc_DrawCWSIcons}];
			_x setVariable ["curatorPresets_CWS_3DIconHandler", _3dIcons];

			//Make sure that the curator unit has a radio item
			_curatorUnit = getAssignedCuratorUnit _x;
			_curatorUnit addItem "ItemRadio";
			_curatorUnit assignItem "ItemRadio";
		};
	} foreach allCurators;

	//Build an array of all units that currently have CWS loaded
	//This is later used for the curator CWS 3D icons
	_initialCWSUnitsArray = [];
	{
		{
			if (_x getVariable "cws_ais_aisInit") then {
				_initialCWSUnitsArray = _initialCWSUnitsArray + [_x];
			};
		} forEach units _x;
	} forEach allGroups;
	missionnamespace setVariable ["curatorPresets_CWS_Units", _initialCWSUnitsArray];

	["Initialized", 2, ["CPM"]] call ccl_fnc_ShowMessage;
};