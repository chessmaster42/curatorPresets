[] spawn {
	//Hold here until a curator is availabe for us to attach to
	while {count allCurators < 1} do {
		sleep 5;
	};
	
	["CPM - Adding event handlers to curators ..."] call bis_fnc_logFormat;
	{
		["CPM - Adding event handlers to curator '%1'", _x] call bis_fnc_logFormat;
	
		_x addEventHandler ["CuratorWaypointEdited", {
			["CPM - CuratorWaypointEdited"] call bis_fnc_logFormat;
			_this call cpm_fnc_OnWaypointEdited;
		}];
		_x addEventHandler ["CuratorWaypointPlaced", {
			["CPM - CuratorWaypointPlaced"] call bis_fnc_logFormat;
			_this call cpm_fnc_OnWaypointPlaced;
		}];
		_x addEventHandler ["CuratorWaypointSelectionChanged", {
			["CPM - CuratorWaypointSelectionChanged"] call bis_fnc_logFormat;
			_this call cpm_fnc_OnWaypointSelectionChanged;
		}];
	} foreach allCurators;
	["CPM - Finished adding event handlers to curators"] call bis_fnc_logFormat;
	systemChat "CPM - Events Initialized";
};