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
	
	//Load up the dialog
	_ok = createDialog "RscDisplayAttributesModuleUnitSpeed";
	waitUntil { dialog };
	sleep 0.1;

	//Get the dialog display
	_display = findDisplay 43000;

	//Configure the list box in the dialog
	_ctrlSpeed = _display displayctrl 43012;
	_ctrlSpeed lbAdd "LIMITED";
	_ctrlSpeed lbAdd "NORMAL";
	_ctrlSpeed lbAdd "FULL";
	_ctrlSpeed lbSetCurSel 0;
	_ctrlSpeed ctrlCommit 1;

	//Setup handler when OK is clicked
	_ctrlButtonOK = _display displayCtrl 1;
	_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
		_display = ctrlParent (_this select 0);
		_ctrlSpeed = _display displayCtrl 43012;
		uinamespace setVariable ["curatorPresets_SpeedValue", _ctrlSpeed lbText lbCurSel _ctrlSpeed];
	}];

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_speed = uinamespace getVariable "curatorPresets_SpeedValue";
	if(isnil "_speed") exitWith {
		[objnull, "Error - Speed was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};

	//Set unit speed
	_unit setSpeedMode _speed;
	
	[objnull, format["%1 - %3 movement speed at %2", name _unit, mapGridPosition _unit, _speed]] call bis_fnc_showCuratorFeedbackMessage;
	
	//Clean up
	uinamespace setVariable ["curatorPresets_SpeedValue", nil];
	
	deletevehicle _logic;
};