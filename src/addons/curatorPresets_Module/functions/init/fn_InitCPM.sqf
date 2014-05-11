missionnamespace setVariable ["curatorPresets_Debugging", false];

[] spawn {
	[] call ccl_fnc_WaitForGameLoad;

	//Broadcast our version info
	_modConfig = (configFile >> "CfgPatches" >> "curatorPresets_Module");
	_version = gettext (_modConfig >> "versionStr");
	[[format ["%1 is loading CPM v%2", name player, _version], 2, ["CPM"]], "ccl_fnc_ShowMessage", false] call ccl_fnc_GlobalExec;

	["Initializing ...", 2, ["CPM"]] call ccl_fnc_ShowMessage;

	//Do stuff

	["Initialized", 2, ["CPM"]] call ccl_fnc_ShowMessage;
};