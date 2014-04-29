if(isServer && isDedicated) exitWith {};

uinamespace setVariable ["CuratorPresetsMod_displays", []];
uinamespace setVariable ["CuratorPresetsMod_classes", []];

[] spawn {
	[] call cpm_fnc_WaitForCuratorLoad;

	["Initializing GUI ...", 4] call cpm_fnc_ShowMessage;

	[] spawn cpm_fnc_MonitorCuratorDisplay;

	["GUI Initialized", 4] call cpm_fnc_ShowMessage;
};