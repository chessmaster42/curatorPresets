_unit = _this select 0;
_channel = _this select 1;
_message = _this select 2;

if(_channel == "Group") then {
	_unit groupChat _message;
};
if(_channel == "Side") then {
	_unit sideChat _message;
};
if(_channel == "Global") then {
	_unit globalChat _message;
};