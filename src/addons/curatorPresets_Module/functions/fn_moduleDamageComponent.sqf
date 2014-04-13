_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	//--- Get unit under cursor
	_unit = objnull;
	_mouseOver = missionnamespace getvariable ["bis_fnc_curatorObjectPlaced_mouseOver",[""]];
	if ((_mouseOver select 0) == typename objnull) then {_unit = _mouseOver select 1;};
	
	_unitClass = typeOf _unit;
	_component = "HitEngine";	//HitHull, HitEngine, HitFuel, HitAvionics, HitVRotor, HitHRotor
	_hit = 1;
	_componentName = getText(configFile >> "cfgVehicles" >> _unitClass >> "HitPoints" >> _component >> "name");
	_unit setHit [_componentName, _hit];
	
	[objnull, format["%1 - Component %3 is now damaged at %2", name _unit, mapGridPosition _unit, _componentName]] call bis_fnc_showCuratorFeedbackMessage;
	
	deletevehicle _logic;
};