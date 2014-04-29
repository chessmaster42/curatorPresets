private["_message"];
_message = _this select 0;
_mode = if(count _this > 1) then {_this select 1} else {0};

if(_mode >= 99) then {
	_message = format["DEBUG - %1", _message];
};
_taggedMessage = format["[CPM] - %1", _message];
_timestampedMessage = format["%1 [CPM] - %2", time, _message];

switch(_mode) do {
	case 0: {	//Large, center of screen text
		[_message, 0, 0.035 * safezoneH + safezoneY, 5, 0.3] spawn BIS_fnc_dynamicText;
	};
	case 1: {	//System chat text
		systemChat _taggedMessage;
	};
	case 2: {	//System log text
		_timestampedMessage call bis_fnc_logFormat;
	};
	case 3: {	//Curator message at top of screen
		[objnull, _message] call bis_fnc_showCuratorFeedbackMessage;
	};
	case 4: {	//Case 1 + Case 2
		systemChat _taggedMessage;
		_timestampedMessage call bis_fnc_logFormat;
	};
	case 5: {	//Case 3 + Case 2
		[objnull, _message] call bis_fnc_showCuratorFeedbackMessage;
		_timestampedMessage call bis_fnc_logFormat;
	};
	case 99: {	//DEBUG mode
		_isDebugging = missionNamespace getVariable "curatorPresets_Debugging";
		if(_isDebugging) then {
			systemChat _taggedMessage;
			_timestampedMessage call bis_fnc_logFormat;
			[objnull, _message] call bis_fnc_showCuratorFeedbackMessage;
		};
	};
};