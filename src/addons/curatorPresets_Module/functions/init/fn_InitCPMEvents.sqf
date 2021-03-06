if(isServer && isDedicated) exitWith {};

[] spawn {
	[] call ccl_fnc_WaitForCuratorLoad;

	//Skip event loading for non-curator players
	if(!([player] call ccl_fnc_IsZeusCurator)) exitWith {};
	
	["Initializing Events ...", 2, ["CPM"]] call ccl_fnc_ShowMessage;
	{
		[format["Adding event handlers to curator '%1'", _x], 2, ["CPM"]] call ccl_fnc_ShowMessage;
	
		_x addEventHandler ["CuratorWaypointEdited", {
			["CuratorWaypointEdited", 2, ["CPM"]] call ccl_fnc_ShowMessage;
			_this call cpm_fnc_OnWaypointEdited;
		}];
		_x addEventHandler ["CuratorWaypointPlaced", {
			["CuratorWaypointPlaced", 2, ["CPM"]] call ccl_fnc_ShowMessage;
			_this call cpm_fnc_OnWaypointPlaced;
		}];
		_x addEventHandler ["CuratorWaypointSelectionChanged", {
			["CuratorWaypointSelectionChanged", 2, ["CPM"]] call ccl_fnc_ShowMessage;
			_this call cpm_fnc_OnWaypointSelectionChanged;
		}];
		_x addEventHandler ["CuratorGroupSelectionChanged", {
			["CuratorGroupSelectionChanged", 2, ["CPM"]] call ccl_fnc_ShowMessage;
			_this call cpm_fnc_OnGroupSelectionChanged;
		}];
	} foreach allCurators;

	["Events Initialized", 2, ["CPM"]] call ccl_fnc_ShowMessage;
};