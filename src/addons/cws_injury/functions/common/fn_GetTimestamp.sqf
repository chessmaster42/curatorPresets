_mode = if(count _this > 0) then {_this select 0} else {0};

_year = date select 0;
_month = date select 1;
_day = date select 2;
_hour = date select 4;
_minute = date select 5;
_second = time % 60;
_millisecond = (diag_tickTime * 1000) % 1000;

_hourText = if(_hour > 10 ) then {format ["%1", _hour]} else {format ["0%1", _hour]};
_minuteText = if(_minute > 10 ) then {format ["%1", _minute]} else {format ["0%1", _minute]};
_secondText = if(_second > 10 ) then {format ["%1", _second]} else {format ["0%1", _second]};

if(_mode == 0) exitWith
{
	format ["%1-%2-%3 %4:%5:%6", _year, _month, _day, _hourText, _minuteText, _secondText]
};

if(_mode == 1) exitWith
{
	_hour = (time / 3600) % 24;
	_minute = (time / 60) % 60;
	_hourText = if(_hour > 10 ) then {format ["%1", _hour]} else {format ["0%1", _hour]};
	_minuteText = if(_minute > 10 ) then {format ["%1", _minute]} else {format ["0%1", _minute]};
	
	format ["%1:%2:%3.%4", _hourText, _minuteText, _secondText, _millisecond]
};