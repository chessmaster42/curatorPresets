disableSerialization;

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	//Get unit under cursor
	_unit = objnull;
	_mouseOver = missionnamespace getvariable ["bis_fnc_curatorObjectPlaced_mouseOver",[""]];
	if ((_mouseOver select 0) == typename objnull) then {_unit = _mouseOver select 1;};
	if(isnull _unit) exitWith {
		[objnull, "Error - Module was not placed on any unit"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};

	_group = group _unit;

	//Save the unit for the UI
	uinamespace setVariable ["curatorPresets_ModuleUnit", _unit];

	//Load up the dialog
	_ok = createDialog "RscDisplayAttributesModuleUnitWaypoint";
	waitUntil { dialog };
	sleep 0.1;

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_xCoordinate = uinamespace getVariable "curatorPresets_XValue";
	_yCoordinate = uinamespace getVariable "curatorPresets_YValue";
	_waypointType = uinamespace getVariable "curatorPresets_WaypointTypeValue";
	if(isnil "_xCoordinate") exitWith {
		[objnull, "Error - X Coordinate was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};
	if(isnil "_yCoordinate") exitWith {
		[objnull, "Error - Y Coordinate was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};
	if(isnil "_waypointType") exitWith {
		[objnull, "Error - Waypoint Type was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};

	//Build the position from the coordinates
	_pos = [parseNumber _xCoordinate, parseNumber _yCoordinate];

	//Add the waypoint to the unit's group
	_waypoint = _group addWaypoint [_pos, 0];

	//Handle special waypoint cases
	if(_waypointType == "GUARD") then {
		_point = createGuardedPoint [side _unit, _pos, -1, objnull];

		_iconParams = ["a3\ui_f\data\map\MapControl\waypointeditor_ca.paa", [1,1,1,1], _pos, 0.5, 0.5, 0, "Guard", 0, 0.025];
		{
			[_x, _iconParams, true, true] call bis_fnc_addCuratorIcon;
		} foreach allcurators;
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

	[objnull, format["%1 - Using waypoint type %3 position %4,%5 at %2", _group, mapGridPosition leader _unit, _waypointType, _xCoordinate, _yCoordinate]] call bis_fnc_showCuratorFeedbackMessage;

	//Clean up
	uinamespace setVariable ["curatorPresets_ModuleUnit", nil];
	uinamespace setVariable ["curatorPresets_XValue", nil];
	uinamespace setVariable ["curatorPresets_YValue", nil];
	uinamespace setVariable ["curatorPresets_WaypointTypeValue", nil];
	
	deletevehicle _logic;
};