// Authored by chessmaster42

private["_message"];
_message = _this select 0;

[_message, 0, 0.035 * safezoneH + safezoneY, 5, 0.3] spawn BIS_fnc_dynamicText;