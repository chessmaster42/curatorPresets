if(isServer && isDedicated) exitWith {};

[] spawn {
	[] call ccl_fnc_WaitForCuratorLoad;

	["Initializing GUI ...", 2, ["CWS"]] call ccl_fnc_ShowMessage;

	["CWSInjury"] spawn ccl_fnc_MonitorCuratorDisplay;

	["GUI Initialized", 2, ["CWS"]] call ccl_fnc_ShowMessage;
};