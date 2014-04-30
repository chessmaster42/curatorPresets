_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {
	if(isNil "tf_no_auto_long_range_radio") then {
		tf_no_auto_long_range_radio = false;
	};
	if(isNil "tf_same_lr_frequencies_for_side") then {
		tf_same_lr_frequencies_for_side = false;
	};
	if(isNil "tf_same_sw_frequencies_for_side") then {
		tf_same_sw_frequencies_for_side = false;
	};

	//Load up the dialog
	_ok = createDialog "RscDisplayAttributesModuleTaskForceRadio";
	waitUntil { dialog };
	sleep 0.5;

	//Wait until the dialog has been closed
	waitUntil { !dialog };

	//Get config from saved UI variables
	_enableLRSpawn = uinamespace getVariable "curatorPresets_TFR_LRPackSpawn_Value";
	if(isnil "_enableLRSpawn") exitWith {
		_enableLRSpawn = 0;
	};
	_sameLR = uinamespace getVariable "curatorPresets_TFR_SameLR_Value";
	if(isnil "_sameLR") exitWith {
		_sameLR = 0;
	};
	_sameSW = uinamespace getVariable "curatorPresets_TFR_SameSW_Value";
	if(isnil "_sameSW") exitWith {
		_sameSW = 0;
	};

	if(_enableLRSpawn > 0) then {
		tf_no_auto_long_range_radio = true;
	} else {
		tf_no_auto_long_range_radio = false;
	};
	
	if(_sameLR > 0) then {
		tf_same_lr_frequencies_for_side = true;
		tf_freq_west_lr = 51;
		tf_freq_east_lr = 51;
		tf_freq_guer_lr = 51;
	} else {
		tf_same_lr_frequencies_for_side = false;
	};

	if(_sameSW > 0) then {
		tf_same_sw_frequencies_for_side = true;
		tf_freq_west = 31;
		tf_freq_east = 31;
		tf_freq_guer = 31;
	} else {
		tf_same_sw_frequencies_for_side = false;
	};
	
	["Task Force Radio configured", 3] call cpm_fnc_ShowMessage;
};