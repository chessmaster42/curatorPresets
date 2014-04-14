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

	//Get class of unit
	_unitClass = typeOf _unit;
	
	//Load up the dialog
	_ok = createDialog "RscDisplayAttributesModuleDamageComponent";
	waitUntil { dialog };
	sleep 0.1;

	//Get the dialog display
	_display = findDisplay 42000;

	//Configure the list box in the dialog
	_ctrlComponent = _display displayctrl 42012;
	{
		_name = configName _x;
		_lbComponent = _ctrlComponent lbAdd _name;
	} foreach ((configFile >> "cfgVehicles" >> _unitClass >> "HitPoints") call BIS_fnc_returnChildren);
	_ctrlComponent lbSetCurSel 0;
	_ctrlComponent ctrlCommit 1;

	//Configure the slider in the dialog
	_ctrlDamage = _display displayCtrl 42022;
	_ctrlDamage sliderSetRange [0, 10];
	_ctrlDamage sliderSetPosition 5;
	_ctrlDamage ctrlCommit 1;

	//Setup handler when OK is clicked
	_ctrlButtonOK = _display displayCtrl 1;
	_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
		_display = ctrlParent (_this select 0);
		_ctrlComponent = _display displayCtrl 42012;
		_ctrlDamage = _display displayCtrl 42022;
		uinamespace setVariable ["curatorPresets_ComponentValue", _ctrlComponent lbText lbCurSel _ctrlComponent];
		uinamespace setVariable ["curatorPresets_DamageValue", 1 - ((sliderPosition _ctrlDamage) * 0.1)];
	}];

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_component = uinamespace getVariable "curatorPresets_ComponentValue";
	_hit = uinamespace getVariable "curatorPresets_DamageValue";
	if(isnil "_component") exitWith {
		[objnull, "Error - Component was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};
	if(isnil "_hit") exitWith {
		[objnull, "Error - Damage was not defined"] call bis_fnc_showCuratorFeedbackMessage;
		deletevehicle _logic;
	};

	//Calculate the component name
	_componentName = getText(configFile >> "cfgVehicles" >> _unitClass >> "HitPoints" >> _component >> "name");

	//Damage the component
	_unit setHit [_componentName, _hit];

	//Alert Zeus
	[objnull, format["%1 - Component %3 has %4 damage at %2", name _unit, mapGridPosition _unit, _componentName, _hit]] call bis_fnc_showCuratorFeedbackMessage;
	
	//Clean up
	uinamespace setVariable ["curatorPresets_ComponentValue", nil];
	uinamespace setVariable ["curatorPresets_DamageValue", nil];
	
	deletevehicle _logic;
};