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
	_unitClass = typeOf _unit;
	
	//Load up the dialog
	_ok = createDialog "RscDisplayAttributesModuleDamageComponent";
	waitUntil { dialog };
	sleep 0.1;

	//Configure the list box in the dialog
	_display = uinamespace getvariable ["RscDisplayAttributesModuleDamageComponent", objNull];
	_ctrlValue = _display displayctrl 42003;
	{
		_name = gettext(_x);
		_lbComponent = _ctrlValue lbAdd [_name];
	} foreach ((configFile >> "cfgVehicles" >> _unitClass >> "HitPoints") call bis_fnc_returnchildren);
	_ctrlValue lbSetCurSel 0;

	//Configure the slider in the dialog
	_ctrlSlider = _display displayctrl 42012;
	_ctrlSlider slidersetposition 10;

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	_component = _ctrlValue lbText lbCurSel _ctrlValue;
	_hit = 1 - sliderposition _ctrlSlider * 0.1;
	_componentName = getText(configFile >> "cfgVehicles" >> _unitClass >> "HitPoints" >> _component >> "name");
	_unit setHit [_componentName, _hit];
	
	[objnull, format["%1 - Component %3 has %4 damage at %2", name _unit, mapGridPosition _unit, _componentName, _hit]] call bis_fnc_showCuratorFeedbackMessage;
	
	deletevehicle _logic;
};