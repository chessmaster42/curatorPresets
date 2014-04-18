[] spawn
{
	["CPM - Initializing ..."] call bis_fnc_logFormat;

	["CPM - Adding event handlers ..."] call bis_fnc_logFormat;
	{
		["CPM - Adding event handlers to %1", _x] call bis_fnc_logFormat;

		_x addEventHandler ["CuratorWaypointEdited", {
			["CPM - CuratorWaypointEdited"] call bis_fnc_logFormat;
			//_this call cpm_fnc_OnWaypointPlaced;
		}];
		_x addEventHandler ["CuratorWaypointPlaced", {
			["CPM - CuratorWaypointPlaced"] call bis_fnc_logFormat;
			_this call cpm_fnc_OnWaypointPlaced;
		}];
		_x addEventHandler ["CuratorWaypointSelectionChanged", {
			["CPM - CuratorWaypointSelectionChanged"] call bis_fnc_logFormat;
			//_this call cpm_fnc_OnWaypointPlaced;
		}];
	} foreach allCurators;
	["CPM - Finished adding event handlers"] call bis_fnc_logFormat;
	
	["CPM - Initialized"] call bis_fnc_logFormat;
};