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
	_ok = createDialog "RscDisplayAttributesModuleArtillery";
	waitUntil { dialog };
	sleep 0.1;

	//Get the dialog display
	_display = findDisplay 45000;

	//Configure the list boxe for ammo type
	_ctrlType = _display displayctrl 45032;
	{
		_lbComponent = _ctrlType lbAdd _x;
	} foreach getArtilleryAmmo [_unit];
	_ctrlType lbSetCurSel 0;
	_ctrlType ctrlCommit 1;

	//Configure the list boxe for round count
	_ctrlRounds = _display displayctrl 45042;
	_ctrlRounds lbAdd "1";
	_ctrlRounds lbAdd "2";
	_ctrlRounds lbAdd "3";
	_ctrlRounds lbAdd "4";
	_ctrlRounds lbAdd "5";
	_ctrlRounds lbSetCurSel 0;
	_ctrlRounds ctrlCommit 1;

	//Setup handler when OK is clicked
	_ctrlButtonOK = _display displayCtrl 1;
	_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
		_display = ctrlParent (_this select 0);
		_ctrlX = _display displayCtrl 45012;
		_ctrlY = _display displayCtrl 45022;
		_ctrlType = _display displayCtrl 45032;
		_ctrlRounds = _display displayCtrl 45042;
		uinamespace setVariable ["curatorPresets_XValue", ctrlText _ctrlX];
		uinamespace setVariable ["curatorPresets_YValue", ctrlText _ctrlY];
		uinamespace setVariable ["curatorPresets_TypeValue", _ctrlType lbText lbCurSel _ctrlType];
		uinamespace setVariable ["curatorPresets_RoundsValue", _ctrlRounds lbText lbCurSel _ctrlRounds];
	}];

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_xCoordinate = uinamespace getVariable "curatorPresets_XValue";
	_yCoordinate = uinamespace getVariable "curatorPresets_YValue";
	_ammoType = uinamespace getVariable "curatorPresets_TypeValue";
	_roundCount = uinamespace getVariable "curatorPresets_RoundsValue";
	if(isnil "_xCoordinate") exitWith {
		[objnull, "Error - X Coordinate was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};
	if(isnil "_yCoordinate") exitWith {
		[objnull, "Error - Y Coordinate was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};
	_pos = [parseNumber _xCoordinate, parseNumber _yCoordinate];

	if(_pos inRangeOfArtillery [[_unit], _ammoType]) then {
		//Run the artillery
		_unit commandArtilleryFire [_pos, _ammoType, parseNumber _roundCount];
	
		//Alert Zeus
		[objnull, format["%1 - Fired %3 %4 times with target %5,%6 at %2", name _unit, mapGridPosition _unit, _ammoType, _roundCount, _xCoordinate, _yCoordinate]] call bis_fnc_showCuratorFeedbackMessage;
	} else {
		//Alert Zeus
		[objnull, format["%1 - Out of range, cannot fire with target %3,%4 at %2", name _unit, mapGridPosition _unit, _xCoordinate, _yCoordinate]] call bis_fnc_showCuratorFeedbackMessage;
	};

	
	//Clean up
	uinamespace setVariable ["curatorPresets_XValue", nil];
	uinamespace setVariable ["curatorPresets_YValue", nil];
	uinamespace setVariable ["curatorPresets_TypeValue", nil];
	uinamespace setVariable ["curatorPresets_RoundsValue", nil];
	
	deletevehicle _logic;
};