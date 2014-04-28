private["_message"];
_message = _this select 0;
_mode = if(count _this > 1) then {_this select 1} else {0};

switch(_mode) do {
	case 0: {
		[_message, 0, 0.035 * safezoneH + safezoneY, 5, 0.3] spawn BIS_fnc_dynamicText;
	};
	case 1: {
		systemChat _message;
	};
	case 2: {
		_message call bis_fnc_logFormat;
	};
	case 3: {
		[objnull, _message] call bis_fnc_showCuratorFeedbackMessage;
	};
};