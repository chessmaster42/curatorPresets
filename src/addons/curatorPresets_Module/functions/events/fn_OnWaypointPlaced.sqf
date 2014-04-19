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

["CPM - Waypoint placed started ..."] call bis_fnc_logFormat;

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
		[objnull, "Error - Waypoint Type was not defined"] call bis_fnc_showCuratorFeedbackMessage;
	};
	uinamespace setVariable ["curatorPresets_WaypointTypeValue", nil];
	
	_group addWaypoint [_pos, 0, _wpID];

	//Handle special waypoint cases
	if(_waypointType == "GUARD") then {
		_point = createGuardedPoint [side _leader, _pos, -1, objnull];
	
		_iconParams = ["a3\ui_f\data\map\MapControl\waypointeditor_ca.paa", [1,1,1,1], _pos, 0.5, 0.5, 0, "Guard", 0, 0.025];
		[_curator, _iconParams, true, true] call bis_fnc_addCuratorIcon;
	};
	if(_waypointType == "Land") then {
		[_group, _wpID] setWaypointStatements ["true", "vehicle this land 'LAND';"];
	
		_waypointType = "MOVE";
	};
	if(_waypointType == "Land - Get in") then {
		[_group, _wpID] setWaypointStatements ["true", "vehicle this land 'GET IN';"];
	
		_waypointType = "MOVE";
	};
	
	[_group, _wpID] setWaypointType _waypointType;
	[_group, _wpID] setWaypointDescription format["%1 Waypoint", _waypointType];
	[_group, _wpID] setWaypointName format["%1 Waypoint", _waypointType];
	
	[objnull, format["%1 - Using waypoint type %2", _leader, _waypointType]] call bis_fnc_showCuratorFeedbackMessage;

	["CPM - Waypoint placed complete"] call bis_fnc_logFormat;
};