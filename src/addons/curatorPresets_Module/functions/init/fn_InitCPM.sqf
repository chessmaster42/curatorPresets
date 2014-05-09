missionnamespace setVariable ["curatorPresets_Debugging", false];

[] spawn {
	[] call ccl_fnc_WaitForCuratorLoad;

	["Initializing ...", 2, ["CPM"]] call ccl_fnc_ShowMessage;

	//Do stuff

	["Initialized", 2, ["CPM"]] call ccl_fnc_ShowMessage;
};