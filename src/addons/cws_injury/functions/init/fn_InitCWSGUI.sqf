if(isServer && isDedicated) exitWith {};

[] spawn {
	[] call ccl_fnc_WaitForCuratorLoad;

	["Initializing GUI ...", 4, ["CWS"]] call ccl_fnc_ShowMessage;

	[] spawn ccl_fnc_MonitorCuratorDisplay;

	["GUI Initialized", 4, ["CWS"]] call ccl_fnc_ShowMessage;
};