_group = _this select 0;
_pos = _this select 1;
_wpID = _this select 2;
_waypointType = _this select 3;

//Only create the waypoints on the server
if(!isServer) exitWith {};

//Create the new waypoint	
_newWP = _group addWaypoint [_pos, 0, _wpID];

//Handle special waypoint cases
if(_waypointType == "GUARD") then {
	_triggerType = "NONE";
	switch(side _group) do {
		case west: {
			_triggerType = "WEST G";
		};
		case east: {
			_triggerType = "EAST G";
		};
		case resistance: {
			_triggerType = "GUER G";
		};
		case civilian: {
			_triggerType = "EAST G";
		};
	};

	_trigger = createTrigger [_triggerType, _pos];
	_trigger synchronizeWaypoint [_newWP];
	//_trigger setTriggerStatements ["this", "", "(missionnamespace getVariable 'curatorPresets_Waypoint_GuardIcon') call bis_fnc_removeCuratorIcon"];
	_trigger setTriggerArea [50, 50, 0, false];
/*
	{
		_iconParams = ["a3\ui_f\data\map\MapControl\waypointeditor_ca.paa", [1,1,1,1], _pos, 0.5, 0.5, 0, "Guard", 0, 0.025];
		_iconID = [_x, _iconParams, true, true] call bis_fnc_addCuratorIcon;

		_curatorGuardIcons = missionnamespace getVariable ["curatorPresets_Waypoint_GuardIcons", []];
		_curatorGuardIcons = _curatorGuardIcons + [_x, _group, _iconID];
		missionnamespace setVariable ["curatorPresets_Waypoint_GuardIcons", _curatorGuardIcons];
	} foreach allCurators;*/
};
if(_waypointType == "Land") then {
	_newWP setWaypointStatements ["true", "vehicle this land 'LAND'; vehicle this allowFleeing 1;"];

	_waypointType = "MOVE";

	vehicle _leader allowFleeing 0;
};
if(_waypointType == "Land - Get in") then {
	_newWP setWaypointStatements ["true", "vehicle this land 'GET IN'; vehicle this allowFleeing 1;"];

	_waypointType = "MOVE";

	vehicle _leader allowFleeing 0;
};
if(_waypointType == "Search Building") then {
	_newWP setWaypointStatements ["true", "[group this] call cpm_fnc_MoveGroupThroughBuilding;"];

	_waypointType = "MOVE";
};

//Configure the waypoint
_newWP setWaypointType _waypointType;
_newWP setWaypointDescription format["%1 Waypoint", _waypointType];
_newWP setWaypointName format["%1 Waypoint", _waypointType];

//Return the new waypoint
_newWP