if (count _this < 3) exitWith {
	[objnull, "Error - Not enough params"] call bis_fnc_showCuratorFeedbackMessage;
};

_curator = _this select 0;
_group = _this select 1;
_wpID = _this select 2;

_type = waypointType [_group, _wpID];
if(_type != "MOVE") exitWith {
	[objnull, "Skipping waypoint config"] call bis_fnc_showCuratorFeedbackMessage;
};

_pos = waypointPosition [_group, _wpID];

deleteWaypoint [_group, _wpID];

[_this, _pos] spawn
{
	_curator = (_this select 0) select 0;
	_group = (_this select 0) select 1;
	_wpID = (_this select 0) select 2;
	_pos = _this select 1;

	_leader = leader _group;

	//Load up the dialog
	_ok = createDialog "RscDisplayAttributesModuleWaypoint";
	waitUntil { dialog };
	sleep 0.5;
	
	//Wait until the dialog has been closed
	waitUntil { !dialog };
	
	//Get the param from the dialog
	_waypointType = uinamespace getVariable "curatorPresets_WaypointTypeValue";
	if(isnil "_waypointType") exitWith {
		[objnull, "Error - 'Waypoint Type' was not defined"] call bis_fnc_showCuratorFeedbackMessage;
	};

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
		//_trigger setTriggerStatements ["this", "", "(this getVariable 'curatorPresets_Waypoint_GuardIcon') call bis_fnc_removeCuratorIcon"];
		_trigger setTriggerArea [50, 50, 0, false];
	
		_iconParams = ["a3\ui_f\data\map\MapControl\waypointeditor_ca.paa", [1,1,1,1], _pos, 0.5, 0.5, 0, "Guard", 0, 0.025];
		_iconID = [_curator, _iconParams, true, true] call bis_fnc_addCuratorIcon;

		//TODO - Find a better way to manage the icon
		//_trigger setVariable ["curatorPresets_Waypoint_GuardIcon", [_curator, _iconID]];
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
	
	//Alert Zeus
	[objnull, format["%1 - Using waypoint type %2", _leader, _waypointType]] call bis_fnc_showCuratorFeedbackMessage;

	["%1 - Using waypoint type %2", _leader, _waypointType] call bis_fnc_logFormat;
};