private ["_control","_button","_mouseX","_mouseY","_shift_state","_ctrl_state","_alt_state"];
_control = _this select 0;
_button = _this select 1;
_mouseX = _this select 2;
_mouseY = _this select 3;
_shift_state = _this select 4;
_ctrl_state = _this select 5;
_alt_state = _this select 6;

//Ctrl + Shift + RMB
if(_ctrl_state && _shift_state && _button == 1) then {
	uinamespace setVariable ["curatorPresets_Module_PlacingCustomWaypoint", true];

	[_mouseX, _mouseY] spawn {
		_mouse3DPos = screenToWorld [_this select 0, _this select 1];
		_wpPos = [_mouse3DPos select 0, _mouse3DPos select 1, 0];
	
		//Get the current selected group
		_groupData = uinamespace getVariable ["curatorPresets_Module_SelectedGroup", [objnull, objnull]];
		_curator = _groupData select 0;
		_group = _groupData select 1;
		if(isNull _group) exitWith {
			["Error - Group was not selected", 3] call ccl_fnc_ShowMessage;
		};

		_leader = leader _group;
	
		//Load up the dialog
		createDialog "RscDisplayAttributesModuleWaypoint";
		waitUntil { dialog };
		
		//Wait until the dialog has been closed
		waitUntil { !dialog };
		
		//Get the param from the dialog
		_waypointType = uinamespace getVariable "curatorPresets_WaypointTypeValue";
	
		//If no waypoint type was defined assume the dialog was canceled and exit
		if(isnil "_waypointType") exitWith {};
	
		//Create the new waypoint at the end of the groups waypoint list
		//[[_group, _wpPos, count waypoints _group, _waypointType], "cpm_fnc_AddWaypoint", false] call ccl_fnc_GlobalExec;
		[_group, _wpPos, count waypoints _group, _waypointType] call cpm_fnc_AddWaypoint;
	
		//Alert Zeus
		[format["%1 - Added waypoint type %2 at %3", _group, _waypointType, _wpPos], 5] call ccl_fnc_ShowMessage;

		uinamespace setVariable ["curatorPresets_Module_PlacingCustomWaypoint", false];
	};
};