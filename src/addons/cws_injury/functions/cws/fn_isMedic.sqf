// Authored by chessmaster42
// Based on 'A3 Wounding System' by Psychobastard

private ["_healer","_isMedic"];
_healer = _this;

//Check if the class of the healer contains the attendant attribute
_isMedic = if (getNumber (configFile >> "CfgVehicles" >> (typeOf _healer) >> "attendant") == 1) then {true} else {false};

_isMedic