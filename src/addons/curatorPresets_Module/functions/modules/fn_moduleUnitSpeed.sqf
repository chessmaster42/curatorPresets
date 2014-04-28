_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	_group = [_logic] call cpm_fnc_GetGroupUnderCursor;

	//Load up the dialog
	_ok = createDialog "RscDisplayAttributesModuleUnitSpeed";
	waitUntil { dialog };
	sleep 0.1;

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_speed = uinamespace getVariable "curatorPresets_UnitSpeedValue";
	if(isnil "_speed") exitWith {
		[objnull, "Error - 'Speed' was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};

	switch (_speed) do {
		case 0: {
			_speed = "LIMITED";
		};
		case 1: {
			_speed = "NORMAL";
		};
		case 2: {
			_speed = "FULL";
		};
	};

	//Set the group speed
	_group setSpeedMode _speed;

	//Alert Zeus	
	[objnull, format["%1 - %3 movement speed at %2", _group, mapGridPosition leader _group, _speed]] call bis_fnc_showCuratorFeedbackMessage;
	
	deletevehicle _logic;
};