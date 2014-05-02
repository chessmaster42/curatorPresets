if(isServer && isDedicated) exitWith {};

[] spawn {
	[] call ccl_fnc_WaitForCuratorLoad;
	
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
	} foreach allCurators;
	["Events Initialized", 2, ["CPM"]] call ccl_fnc_ShowMessage;
};