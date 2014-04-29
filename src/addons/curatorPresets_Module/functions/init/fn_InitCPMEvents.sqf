if(isServer && isDedicated) exitWith {};

[] spawn {
	[] call cpm_fnc_WaitForCuratorLoad;
	
	["Initializing Events ...", 4] call cpm_fnc_ShowMessage;
	{
		[format["CPM - Adding event handlers to curator '%1'", _x], 2] call cpm_fnc_ShowMessage;
	
		_x addEventHandler ["CuratorWaypointEdited", {
			["CPM - CuratorWaypointEdited", 2] call cpm_fnc_ShowMessage;
			_this call cpm_fnc_OnWaypointEdited;
		}];
		_x addEventHandler ["CuratorWaypointPlaced", {
			["CPM - CuratorWaypointPlaced", 2] call cpm_fnc_ShowMessage;
			_this call cpm_fnc_OnWaypointPlaced;
		}];
		_x addEventHandler ["CuratorWaypointSelectionChanged", {
			["CPM - CuratorWaypointSelectionChanged", 2] call cpm_fnc_ShowMessage;
			_this call cpm_fnc_OnWaypointSelectionChanged;
		}];
	} foreach allCurators;
	["Events Initialized", 4] call cpm_fnc_ShowMessage;
};