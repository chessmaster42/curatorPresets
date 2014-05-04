// Authored by chessmaster42
// Based on 'A3 Wounding System' by Psychobastard

private ["_unit","_healer","_isHealable","_has_medikit","_has_firstaidkit","_isMedic","_self_revive","_canHeal","_healerStopped","_animDelay","_relpos","_dir","_offset","_time","_damage","_heal_time","_animChangeEVH","_revived_counter"];
_unit = _this select 0;
_healer = _this select 1;

//-------------------------------------------\\
//Start testing the viability of this healing\\
//-------------------------------------------\\

[format ["%1 is attempting to heal %2", _healer, _unit], 2] call ccl_fnc_ShowMessage;

_isHealable = [_unit] call cws_fnc_isHealable;
_canHeal = [_healer] call cws_fnc_canHeal;
_isMedic = _healer call cws_fnc_isMedic;

//Self-heal check
if((_unit == _healer) && (_unit != player)) exitWith {
	[format ["%1 cannot heal themselves, calling for another healer", _unit], 2] call ccl_fnc_ShowMessage;

	//Call for another healer
	[_unit] call cws_fnc_SendAIHealer;
};

if (!_isHealable) exitWith {
	if(!isPlayer _healer) then {
		[format ["%1 cannot heal %2, not healable, looking for others to heal", _healer, _unit], 2] call ccl_fnc_ShowMessage;

		//Look for other injured friends
		[_healer] call cws_fnc_LookingForWoundedMates;
	};
};

//Get some info about the healer
_has_medikit = ((items _healer) find "Medikit" > -1);
_has_firstaidkit = ((items _healer) find "FirstAidKit" >= 0);
_isMedic = _healer call cws_fnc_isMedic;

//If the unit and the healer are the same and it's the player then we are self-reviving
//This should ONLY ever happen from the medic's special key binding while in agony
_self_revive = (_unit == _healer) && (_unit == player) && _isMedic && (_has_medikit || _has_firstaidkit) && cws_ais_allow_self_revive;

//Stop the healing if the healer can no longer heal
if (!_canHeal && !_self_revive) exitWith {
	[format ["%1 cannot heal %2, calling for another healer", _healer, _unit], 2] call ccl_fnc_ShowMessage;

	//Call for another healer
	[_unit] call cws_fnc_SendAIHealer;
};

//If the healer is AI move them until they're within range of the injured
//Fails if either unit die or their agony states change
//Fails if this takes more than 2 minutes
//Fails if the healer can no longer heal
if (!isPlayer _healer && {_healer distance _unit > cws_ais_firstaid_distance}) then {
	_healer doMove (position _unit);
	_timenow = time;
	WaitUntil {
		_healer distance _unit <= cws_ais_firstaid_distance		 		||
		{!alive _unit}			 					||
		{!(_unit getVariable "cws_ais_agony")} 	||
		{!alive _healer}				 					||
		{_healer getVariable "cws_ais_agony"}		 		||
		{_timenow + 120 < time}								||
		{!([_healer] call cws_fnc_CanHeal)}
	};
};

//Stop the healing if the healer can no longer heal
_canHeal = [_healer] call cws_fnc_CanHeal;
if (!_canHeal && !_self_revive) exitWith {
	[format ["%1 cannot heal %2, calling for another healer", _healer, _unit], 2] call ccl_fnc_ShowMessage;

	//Call for another healer
	[_unit] call cws_fnc_SendAIHealer;
};

//Stop the healing if the healer is too far away
if (_healer distance _unit > cws_ais_firstaid_distance) exitWith {
	if (isPlayer _healer) then {
		[format ["%1 is too far away to be healed.", name _unit], 0] spawn ccl_fnc_showMessage
	} else {
		[format ["%1 cannot heal %2, too far away, calling for another healer", _healer, _unit], 2] call ccl_fnc_ShowMessage;

		//Call for another healer
		[_unit] call cws_fnc_SendAIHealer;
	};
};

//Make sure the unit is still healable
if (!_isHealable) exitWith {
	if(!isPlayer _healer) then {
		[format ["%1 cannot heal %2, not healable, looking for others to heal", _healer, _unit], 2] call ccl_fnc_ShowMessage;

		//Look for other injured friends
		[_healer] call cws_fnc_LookingForWoundedMates;
	};
};

//---------------------------------------------------------------------\\
//All tests have passed and now we actually start the first aid process\\
//---------------------------------------------------------------------\\


[format ["%1 is now healing %2", _healer, _unit], 2] call ccl_fnc_ShowMessage;

//Add the healer to the unit
[[_unit, _healer], "cws_fnc_setHealer"] spawn ccl_fnc_GlobalExec;

_healerStopped = false;

_healer selectWeapon primaryWeapon _healer;
sleep 1;
_animDelay = time + 2;

//If the healer is an AI then stop all other AI tasks
if (!isPlayer _healer) then {
	_healer stop true;
	_healer disableAI "MOVE";
	_healer disableAI "TARGET";
	_healer disableAI "AUTOTARGET";
};

//Start the medic animation as long as this isn't a self-revive
if(!_self_revive) then {
	_healer playAction "medicStart";
};

//If the healer is a player then setup an animation change event handler
if (isPlayer _healer) then {
	_animChangeEVH = _healer addEventhandler ["AnimChanged", {
		private ["_anim","_healer"];
		_healer = _this select 0;
		_anim = _this select 1;
		if (primaryWeapon _healer != "") then {
			if (time >= _animDelay) then {_healerStopped = true};
		} else {
			if (_anim in ["amovpknlmstpsnonwnondnon","amovpknlmstpsraswlnrdnon"]) then {
				_healer playAction "medicStart";
			} else {
				if (!(_anim in ["ainvpknlmstpsnonwnondnon_medic0s","ainvpknlmstpsnonwnondnon_medic"])) then {
					if (time >= _animDelay) then {_healerStopped = true};
				};
			};
		};	
	}];
};

//Attach the injured to the healer
_offset = [0,0,0];
_dir = 0;
_relpos = _healer worldToModel position _unit;
if((_relpos select 0) < 0) then{_offset=[-0.2,0.7,0]; _dir=90} else{_offset=[0.2,0.7,0]; _dir=270};
_unit attachTo [_healer, _offset];
_unit setDir _dir;

//Get some values for the first aid timer/progress
_time = time;
_damage = damage _unit;
_revived_counter = _unit getVariable ["cws_ais_revived_counter", 0];

//Calculate the healing time in seconds
//Base is up to 60 seconds plus the healed counter penalty
//The healed counter penalty is 5 seconds for every revive the unit has undergone
//There is also a minimum time of 10 seconds regardless of the damage or healed counter
_heal_time = _damage * 60 + _revived_counter * 5;
if(_heal_time < 10) then {_heal_time = 10};

//Run the healing progress bar
[[_unit, 0], "cws_fnc_SetHealingProgress"] call ccl_fnc_GlobalExec;
sleep 1;
while {
	time - _time < _heal_time
	&& {alive _healer}
	&& {alive _unit}
	&& {(_healer distance _unit) < cws_ais_firstaid_distance}
	&& {!_healerStopped}
} do {
	sleep 0.5;

	_healingProgress = (time - _time) / (_heal_time);

	//If the healer is a player then run the progress bar on-screen
	if (isPlayer _healer) then {["Applying First Aid", (_healingProgress) min 1] spawn cws_fnc_progressbar};

	//if the healer goes into agony but this isn't a self-revive then interrupt the process
	if(_healer getVariable "cws_ais_agony" && !_self_revive) then {_healerStopped = true};

	//Refresh first aid checks in case the items are removed during the first aid process
	_has_medikit = ((items _healer) find "Medikit" > -1);
	_has_firstaidkit = ((items _healer) find "FirstAidKit" >= 0);
	if(!(_has_medikit && _isMedic) && !_has_firstaidkit) then {_healerStopped = true};

	[[_unit, _healingProgress], "cws_fnc_SetHealingProgress"] call ccl_fnc_GlobalExec;
};

if (isPlayer _healer) then {_healer removeEventHandler ["AnimChanged", _animChangeEVH]};

//Detach the injured from the healer
detach _healer;
detach _unit;

//Clear the healer from the unit
[[_unit, objnull], "cws_fnc_setHealer"] spawn ccl_fnc_GlobalExec;

//If the healer is an AI then start up all other AI tasks
if (!isPlayer _healer) then {
	_healer stop false;
	_healer enableAI "MOVE";
	_healer enableAI "TARGET";
	_healer enableAI "AUTOTARGET";
};

//If the healer is still healthy and this isn't a self-revive then stop animations and restore behaviour
if (alive _healer && {!(_healer getVariable "cws_ais_agony")} && !_self_revive) then {
	_healer playAction "medicStop";
};

//If either the healer or the injured died during the healing, bail out
if (!alive _healer) exitWith {
	//Call for another healer
	[_unit] call cws_fnc_SendAIHealer;
};
if (!alive _unit) exitWith {
	if(isPlayer _healer) then {
		["It's already too late for this guy.", 0] spawn ccl_fnc_showMessage;
	} else {
		//Look for other injured friends
		[_healer] call cws_fnc_LookingForWoundedMates;
	};
};

//Do the actual unit healing as long as the process wasn't interrupted
if (!_healerStopped) then {
    //Increment the revived counter
    _unit setVariable ["cws_ais_revived_counter", _revived_counter + 1];
    
    //Do the healing
	[_unit, _healer] call cws_fnc_handleHeal;

	//Broadcast unit agony state
	_unit setVariable ["cws_ais_agony", false, true];

	[format ["%1 finished healing %2", _healer, _unit], 2] call ccl_fnc_ShowMessage;

	[[_unit, 0], "cws_fnc_SetHealingProgress"] call ccl_fnc_GlobalExec;

	//AI healers will now look for other units in agony
	if(!isPlayer _healer) then {
		//Look for other injured friends
		[_healer] call cws_fnc_LookingForWoundedMates;
	};
} else {
	if (isPlayer _healer) then {
		["You have stopped the healing process.", 0] spawn ccl_fnc_showMessage;
	} else {
		[format ["%1 was interrupted while healing %2", _healer, _unit], 2] call ccl_fnc_ShowMessage;
	};
};