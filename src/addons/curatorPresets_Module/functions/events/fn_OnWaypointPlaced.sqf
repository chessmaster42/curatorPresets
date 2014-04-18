if (count _this < 3) exitWith {
	[objnull, "Error - Not enough params"] call bis_fnc_showCuratorFeedbackMessage;
};

_curator = _this select 0;
_group = _this select 1;
_wpID = _this select 2;

_pos = waypointPosition [_group, _wpID];
_leader = leader _group;

//Temporarily put the position on the leader
[_group, _wpID] setWaypointPosition [position _leader, 0];

["CPM - Waypoint placed started ..."] call bis_fnc_logFormat;

//[_this, _pos] spawn
//{
//	_curator = (_this select 0) select 0;
//	_group = (_this select 0) select 1;
//	_wpID = (_this select 0) select 2;
//	_pos = _this select 1;

	_waypoint = [_group, _wpID];
	_leader = leader _group;

	//Load up the dialog
	_ok = createDialog "RscDisplayAttributesModuleWaypoint";
	waitUntil { dialog };
	sleep 0.1;
	
	//Wait until the dialog has been closed
	waitUntil { !dialog };
	
	//Get the param from the dialog
	_waypointType = uinamespace getVariable "curatorPresets_WaypointTypeValue";
	if(isnil "_waypointType") exitWith {
		[objnull, "Error - Waypoint Type was not defined"] call bis_fnc_showCuratorFeedbackMessage;
	};
	uinamespace setVariable ["curatorPresets_WaypointTypeValue", nil];
	
	//Handle special waypoint cases
	if(_waypointType == "GUARD") then {
		_point = createGuardedPoint [side _leader, _pos, -1, objnull];
	
		_iconParams = ["a3\ui_f\data\map\MapControl\waypointeditor_ca.paa", [1,1,1,1], _pos, 0.5, 0.5, 0, "Guard", 0, 0.025];
		[_curator, _iconParams, true, true] call bis_fnc_addCuratorIcon;
	};
	if(_waypointType == "Land") then {
		_waypoint setWaypointStatements ["true", "vehicle this land 'LAND';"];
	
		_waypointType = "MOVE";
	};
	if(_waypointType == "Land - Get in") then {
		_waypoint setWaypointStatements ["true", "vehicle this land 'GET IN';"];
	
		_waypointType = "MOVE";
	};
	
	_waypoint setWaypointType _waypointType;
	_waypoint setWaypointName format["%1 Waypoint", _waypointType];
	_waypoint setWaypointDescription format["%1 Waypoint", _waypointType];

	//Restore the waypoint position now that we're all done
	_waypoint setWaypointPosition [_pos, 0];
	
	[objnull, format["%1 - Using waypoint type %2", _leader, _waypointType]] call bis_fnc_showCuratorFeedbackMessage;

	["CPM - Waypoint placed complete"] call bis_fnc_logFormat;
//};