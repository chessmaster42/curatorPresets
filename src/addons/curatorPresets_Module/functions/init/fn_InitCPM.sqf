[] spawn {
	//Hold here until a curator is availabe for us to attach to
	while {count allCurators < 1} do {
		sleep 5;
	};

	["CPM - Initializing ..."] call bis_fnc_logFormat;

	{
		_x addCuratorAddons ["curatorPresets_Module"];

		_3dIcons = addMissionEventHandler ["Draw3D", {
			{
				{
					if ((_x getVariable "cws_ais_aisInit") && (alive _x)) then {
						_message = "CWS";
						_icon_size = 0.5;
						_text_size = 0.025;
						_pos = visiblePosition _x;
						_pos set [2, (_pos select 2) + 3];
						drawIcon3D["a3\ui_f\data\map\MapControl\hospital_ca.paa", [1,0,0,1], _pos, _icon_size, _icon_size, 0, _message, 0, _text_size];
					};
				} forEach units _x;
			} forEach allGroups;
		}];
		_x setVariable ["curatorPresets_3DIconHandler", _3dIcons];
	} foreach allCurators;

	["CPM - Initialized"] call bis_fnc_logFormat;
	systemChat "CPM - Initialized";
};