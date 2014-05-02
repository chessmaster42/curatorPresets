_cwsDebugging = cws_ais_debugging;
cws_ais_debugging = false;
_cwsUnitsArray = missionnamespace getVariable ["curatorPresets_CWS_Units", []];
{
	//Build the config for the icon
	_unitDamage = [_x] call cws_fnc_GetUnitDamage;
	_iconColor = [1, 1 - _unitDamage, 1 - _unitDamage, 0.5 + _unitDamage * 0.5];
	_pos = visiblePosition _x;
	_pos set [2, (_pos select 2) + 4];
	_icon_size = 0.5;
	_angle = 0;
	_message = "CWS";
	_text_size = 0.025;

	//Add bleedout time if the unit is in agony
	if(_x getVariable "cws_ais_agony") then {
		_life_remaining = _x getVariable "cws_ais_bleedout_time";
		_message = _message + format[" (%1%2)", ceil (_life_remaining * 100), "%"];
	};
	
	//Draw the icon in 3D space
	drawIcon3D["a3\ui_f\data\map\MapControl\hospital_ca.paa", _iconColor, _pos, _icon_size, _icon_size, _angle, _message, 0, _text_size];
	
	//Clear out dead AI from the list
	if(!isPlayer _x && !alive _x) then {
		_cwsUnitsArray = _cwsUnitsArray - [_x];
		missionnamespace setVariable ["curatorPresets_CWS_Units", _cwsUnitsArray];
	};
} forEach _cwsUnitsArray;
cws_ais_debugging = _cwsDebugging;