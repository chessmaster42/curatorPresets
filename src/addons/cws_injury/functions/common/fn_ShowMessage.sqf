private["_message"];
_message = _this select 0;
_mode = if(count _this > 1) then {_this select 1} else {0};
_params = if(count _this > 2) then {_this select 2} else {[]};

_isDebugging = missionNamespace getVariable ["curatorPresets_Debugging", false];
_modPrefix = "CWS";

//Headless client or dedicated server can only ever use mode 2
if(isServer && isDedicated) then {
	_mode = 2;
};

switch(_mode) do {
	case 0: {	//Large, center of screen text
		[_message, 0, 0.035 * safezoneH + safezoneY, 5, 0.3] spawn BIS_fnc_dynamicText;
	};
	case 1: {	//System chat
		systemChat format ["[%1] - %2", _modPrefix, _message];
	};
	case 2: {	//Log file
		format ["[%1] [%2] - %3", [1] call cpm_fnc_GetTimestamp, _modPrefix, _message] call bis_fnc_logFormat;
	};
	case 3: {	//Curator message at top of screen
		[objnull, _message] call bis_fnc_showCuratorFeedbackMessage;
	};
	case 4: {
		[_message, 1] call cws_fnc_ShowMessage;
		[_message, 2] call cws_fnc_ShowMessage;
	};
	case 5: {
		[_message, 2] call cws_fnc_ShowMessage;
		[_message, 3] call cws_fnc_ShowMessage;
	};
	case 6: {
		_unit = if(count _params > 0) then {_params select 0} else {player};
		_channel = if(count _params > 1) then {_params select 1} else {"Group"};
		_useHQ = if(count _params > 2) then {_params select 2} else {false};
		_useTimestamp = if(count _params > 3) then {_params select 3} else {false};
		_useModPrefix = if(count _params > 4) then {_params select 4} else {false};

		_sender = _unit;
		if(_useHQ) then {
			_sender = [side _unit, "HQ"];
		};
		if(_useModPrefix) then {
			_message = format ["[%1] %2", _modPrefix, _message];
		};
		if(_useTimestamp) then {
			_message = format ["[%1] %2", [0] call cpm_fnc_GetTimestamp, _message]
		};

		[[_sender, _channel, _message], "cws_fnc_LoadUnitChat"] spawn cpm_fnc_GlobalExec;
	};
	case 7: {
		hint _message;
	};
	case 99: {	//DEBUG mode
		if(_isDebugging) then {
			_message = format ["DEBUG - %1", _message];
			[_message, 1] call cws_fnc_ShowMessage;
			[_message, 2] call cws_fnc_ShowMessage;
			[_message, 3] call cws_fnc_ShowMessage;
		};
	};
};