if(isServer && isDedicated) exitWith {};

[] spawn {
	[] call ccl_fnc_WaitForCuratorLoad;

	//Skip GUI loading for non-curator players
	if(!([player] call ccl_fnc_IsZeusCurator)) exitWith {};
	
	["Initializing GUI ...", 2, ["CPM"]] call ccl_fnc_ShowMessage;

	uinamespace setVariable ["CuratorPresetsMod_displays", []];
	uinamespace setVariable ["CuratorPresetsMod_classes", []];

	["CuratorPresets"] spawn ccl_fnc_MonitorCuratorDisplay;
	[] spawn cpm_fnc_SetupDisplayHandlers;

	["GUI Initialized", 2, ["CPM"]] call ccl_fnc_ShowMessage;
};