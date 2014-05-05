// Authored by chessmaster42

private["_unit","_return","_has_medikit","_has_firstaidkit","_isMedic","_attachedUnit"];
_unit = _this select 0;
_return = true;

_has_medikit = ((items _unit) find "Medikit" > -1);
_has_firstaidkit = ((items _unit) find "FirstAidKit" >= 0);
_isMedic = _unit call cws_fnc_isMedic;

//If the healer is dead
if(!alive _unit) then {_return = false};

//If the healer is in agony
if(_unit getVariable "cws_ais_agony") then {_return = false};

//If the healer has no supplies
if(!(_has_medikit && _isMedic) && !_has_firstaidkit) then {_return = false};

//Check that the unit isn't already healing someone
_attachedUnit = attachedTo _unit;
if(!isNull _attachedUnit) then {_return = false};

_return