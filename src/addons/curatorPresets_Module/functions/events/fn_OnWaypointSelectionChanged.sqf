if (count _this < 3) exitWith {
	[objnull, "Error - Not enough params"] call bis_fnc_showCuratorFeedbackMessage;
};

_curator = _this select 0;
_group = _this select 1;
_wpID = _this select 2;

//TODO - Do stuff here