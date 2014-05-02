if(isServer && isDedicated) exitWith {};

uinamespace setVariable ["CuratorPresetsMod_displays", []];
uinamespace setVariable ["CuratorPresetsMod_classes", []];

[] spawn {
	[] call ccl_fnc_WaitForCuratorLoad;

	["Initializing GUI ...", 2, ["CPM"]] call ccl_fnc_ShowMessage;

	["CuratorPresets"] spawn ccl_fnc_MonitorCuratorDisplay;

	["GUI Initialized", 2, ["CPM"]] call ccl_fnc_ShowMessage;
};