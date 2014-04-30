if(isServer && isDedicated) exitWith {};

[] spawn {
	[] call cws_fnc_WaitForCuratorLoad;

	["Initializing GUI ...", 4] call cws_fnc_ShowMessage;

	[] spawn cws_fnc_MonitorCuratorDisplay;

	["GUI Initialized", 4] call cws_fnc_ShowMessage;
};