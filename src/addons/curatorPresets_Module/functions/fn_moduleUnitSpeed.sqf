_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	//--- Get unit under cursor
	_unit = objnull;
	_mouseOver = missionnamespace getvariable ["bis_fnc_curatorObjectPlaced_mouseOver",[""]];
	if ((_mouseOver select 0) == typename objnull) then {_unit = _mouseOver select 1;};
	
	_speed = "LIMITED";
	_unit setSpeedMode _speed;
	
	[objnull, format["%1 - %3 movement speed at %2", name _unit, mapGridPosition _unit, _speed]] call bis_fnc_showCuratorFeedbackMessage;
	
	deletevehicle _logic;
};