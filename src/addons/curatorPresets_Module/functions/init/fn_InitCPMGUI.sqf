if(isServer && isDedicated) exitWith {};

uinamespace setVariable ["CuratorPresetsMod_displays", []];
uinamespace setVariable ["CuratorPresetsMod_classes", []];

[] spawn {
	[] call ccl_fnc_WaitForCuratorLoad;

	["Initializing GUI ...", 4, ["CPM"]] call ccl_fnc_ShowMessage;

	[] spawn ccl_fnc_MonitorCuratorDisplay;

	["GUI Initialized", 4, ["CPM"]] call ccl_fnc_ShowMessage;
};