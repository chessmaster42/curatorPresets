// Authored by chessmaster42
// Based on 'A3 Wounding System' by Psychobastard

private ["_unit","_healer","_self_revive","_behaviour","_timenow","_relpos","_dir","_offset","_time","_damage","_heal_time","_isMedic","_animChangeEVH","_has_medikit","_has_firstaidkit","_revived_counter"];
_unit = _this select 0;
_healer = _this select 1;

//Capture some details about the healer
_behaviour = behaviour _healer;
_has_medikit = ((items _healer) find "Medikit" > -1);
_has_firstaidkit = ((items _healer) find "FirstAidKit" >= 0);
_isMedic = _healer call cws_fnc_isMedic;

//If the unit and the healer are the same and it's the player then we are self-reviving
//This should ONLY ever happen from the medic's special key binding while in agony
_self_revive = (_unit == _healer) && (_unit == player) && _isMedic && (_has_medikit || _has_firstaidkit) && cws_ais_allow_self_revive;

//If the healer is also in agony then leave here
if (_healer getVariable "cws_ais_agony" && !_self_revive) exitWith {};

//If the healer is AI move them until they're within range of the injured
if (!isPlayer _healer && {_healer distance _unit > cws_ais_firstaid_distance}) then {
	_healer setBehaviour "AWARE";
	_healer doMove (position _unit);
	_timenow = time;
	WaitUntil {
		_healer distance _unit <= cws_ais_firstaid_distance		 		||
		{!alive _unit}			 					||
		{!(_unit getVariable "cws_ais_agony")} 	||
		{!alive _healer}				 					||
		{_healer getVariable "cws_ais_agony"}		 		||
		{_timenow + 120 < time}
	};
};

//If the healer is also in agony by the time they get to the injured then leave here
if (_healer getVariable "cws_ais_agony" && !_self_revive) exitWith {};

//Stop the healing if the injured died before the healer arrived
if (!alive _unit) exitWith {
	_healer setBehaviour _behaviour;
	if (isPlayer _healer) then {["It's already too late for this guy."] spawn cws_fnc_showMessage};
};

//Stop the healing if the healer is too far away
if (_healer distance _unit > cws_ais_firstaid_distance) exitWith {
	_healer setBehaviour _behaviour;
	if (isPlayer _healer) then {[format ["%1 is too far away to be healed.", name _unit]] spawn cws_fnc_showMessage};
};

//Stop the healing if the healer doesn't have enough supplies
if(!(_has_medikit && _isMedic) && !_has_firstaidkit) exitWith {
	_healer setBehaviour _behaviour;
	if (isPlayer _healer) then {[format ["%1 cannot be healed. No first aid available.", name _unit]] spawn cws_fnc_showMessage};
};

//Make sure the unit is healable
rtn = call cws_fnc_isHealable;
if (!rtn) exitWith {};

//Add the healer to the unit
cws_ais_start_heal = [_unit, _healer];
publicVariable "cws_ais_start_heal";

cws_healerStopped = false;

_healer selectWeapon primaryWeapon _healer;
sleep 1;
cws_animDelay = time + 2;

//Start the medic animation as long as this isn't a self-revive
if(!_self_revive) then {
	_healer playAction "medicStart";
};

//If the healer is an AI then stop all other AI tasks
if (!isPlayer _healer) then {
	_healer stop true;
	_healer disableAI "MOVE";
	_healer disableAI "TARGET";
	_healer disableAI "AUTOTARGET";
	_healer disableAI "ANIM";
};

//If the healer is a player then run through the healing animations
if (isPlayer _healer) then {
	_animChangeEVH = _healer addEventhandler ["AnimChanged", {
		private ["_anim","_healer"];
		_healer = _this select 0;
		_anim = _this select 1;
		if (primaryWeapon _healer != "") then {
			if (time >= cws_animDelay) then {cws_healerStopped = true};
		} else {
			if (_anim in ["amovpknlmstpsnonwnondnon","amovpknlmstpsraswlnrdnon"]) then {
				_healer playAction "medicStart";
			} else {
				if (!(_anim in ["ainvpknlmstpsnonwnondnon_medic0s","ainvpknlmstpsnonwnondnon_medic"])) then {
					if (time >= cws_animDelay) then {cws_healerStopped = true};
				};
			};
		};	
	}];
};

//Attach the injured to the healer
_offset = [0,0,0]; _dir = 0;
_relpos = _healer worldToModel position _unit;
if((_relpos select 0) < 0) then{_offset=[-0.2,0.7,0]; _dir=90} else{_offset=[0.2,0.7,0]; _dir=270};
_unit attachTo [_healer, _offset];
_unit setDir _dir;

//Get some values for the first aid timer/progress
_time = time;
_damage = damage _unit;
if(isNil {_unit getVariable "cws_ais_revived_counter"}) then {_unit setVariable ["cws_ais_revived_counter",0]};
_revived_counter = _unit getVariable "cws_ais_revived_counter";

//Calculate the healing time in seconds
//Base is up to 60 seconds plus the healed counter penalty
//The healed counter penalty is 5 seconds for every revive the unit has undergone
//There is also a minimum time of 10 seconds regardless of the damage or healed counter
_heal_time = _damage * 60 + _revived_counter * 5;
if(_heal_time < 10) then {_heal_time = 10};

//Run the healing progress bar
sleep 1;
while {
	time - _time < _heal_time
	&& {alive _healer}
	&& {alive _unit}
	&& {(_healer distance _unit) < cws_ais_firstaid_distance}
	&& {!cws_healerStopped}
} do {
	sleep 0.5;

	//If the healer is a player then run the progress bar on-screen
	if (isPlayer _healer) then {["Applying First Aid", ((time - _time) / (_heal_time)) min 1] spawn cws_fnc_progressbar};

	//if the healer goes into agony but this isn't a self-revive then interrupt the process
	if(_healer getVariable "cws_ais_agony" && !_self_revive) then {cws_healerStopped = true};

	//Refresh first aid checks in case the items are removed during the first aid process
	_has_medikit = ((items _healer) find "Medikit" > -1);
	_has_firstaidkit = ((items _healer) find "FirstAidKit" >= 0);
	if(!(_has_medikit && _isMedic) && !_has_firstaidkit) then {cws_healerStopped = true};
};

if (isPlayer _healer) then {_healer removeEventHandler ["AnimChanged", _animChangeEVH]};

//Detach the injured from the healer
detach _healer;
detach _unit;

//Clear the healer from the unit
cws_ais_start_heal = [_unit, ObjNull];
publicVariable "cws_ais_start_heal";

//If the healer is an AI then start up all other AI tasks
if (!isPlayer _healer) then {
	_healer stop false;
	_healer enableAI "MOVE";
	_healer enableAI "TARGET";
	_healer enableAI "AUTOTARGET";
	_healer enableAI "ANIM";
};

//If the healer is still healthy and this isn't a self-revive then stop animations and restore behaviour
if (alive _healer && {!(_healer getVariable "cws_ais_agony")} && !_self_revive) then {
	_healer playAction "medicStop";
	_healer setBehaviour _behaviour;
};

//If either the healer or the injured died during the healing, bail out
if (!alive _healer) exitWith {};
if (!alive _unit) exitWith {["It's already too late for this guy."] spawn cws_fnc_showMessage};

//Do the actual unit healing as long as the process wasn't interrupted
if (!cws_healerStopped) then {
    //Increment the revived counter
    _unit setVariable ["cws_ais_revived_counter", _revived_counter + 1];
    
    //Do the healing
	[_unit, _healer] call cws_fnc_handleHeal;

	//Broadcast unit agony state
	_unit setVariable ["cws_ais_agony", false, true];
} else {
	if (isPlayer _healer) then {["You have stopped the healing process."] spawn cws_fnc_showMessage};
};