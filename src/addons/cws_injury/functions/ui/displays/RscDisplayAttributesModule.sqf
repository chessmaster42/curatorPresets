#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

_mode = _this select 0;
_params = _this select 1;
_class = _this select 2;

switch _mode do {
	case "onLoad": {
		_display = _params select 0;
		_displayConfig = configfile >> _class;

		_ctrlBackground = _display displayctrl IDC_RSCDISPLAYATTRIBUTES_BACKGROUND;
		_ctrlTitle = _display displayctrl IDC_RSCDISPLAYATTRIBUTES_TITLE;
		_ctrlContent = _display displayctrl IDC_RSCDISPLAYATTRIBUTES_CONTENT;
		_ctrlButtonOK = _display displayctrl IDC_OK;
		_ctrlButtonCancel = _display displayctrl IDC_CANCEL;

		_ctrlBackgroundPos = ctrlposition _ctrlBackground;
		_ctrlTitlePos = ctrlposition _ctrlTitle;
		_ctrlContentPos = ctrlposition _ctrlContent;
		_ctrlButtonOKPos = ctrlposition _ctrlButtonOK;
		_ctrlButtonCancelPos = ctrlposition _ctrlButtonCancel;

		_ctrlTitleOffsetY = (_ctrlBackgroundPos select 1) - (_ctrlTitlePos select 1) - (_ctrlTitlePos select 3);
		_ctrlContentOffsetY = (_ctrlContentPos select 1) - (_ctrlBackgroundPos select 1);

		//Initialize attributes
		_posY = _ctrlContentOffsetY;
		_contentControls = _displayConfig >> "Controls" >> "Content" >> "Controls";
		for "_i" from 0 to (count _contentControls - 1) do {
			_cfgControl = _contentControls select _i;
			if (isclass _cfgControl) then {
				_idc = getnumber (_cfgControl >> "idc");
				_control = _display displayctrl _idc;

				_controlPos = ctrlposition _control;
				_controlPos set [0,0];
				_controlPos set [1,_posY];
				_control ctrlsetposition _controlPos;
				_control ctrlcommit 0;
				_posY = _posY + (_controlPos select 3) + 0.005;
				ctrlsetfocus _control;
			};
		};
		_posH = ((_posY + _ctrlContentOffsetY) min 0.9) * 0.5 + 0.10;

		//Calculate title text
		_target = missionnamespace getvariable ["BIS_fnc_initCuratorAttributes_target",objnull];
		_name = switch (typename _target) do {
			case (typename objnull): {gettext (configfile >> "cfgvehicles" >> typeof _target >> "displayname")};
			case (typename grpnull): {groupid _target};
			case (typename []): {format ["%1: %3 #%2",groupid (_target select 0),_target select 1,localize "str_a3_cfgmarkers_waypoint_0"]};
			case (typename ""): {markertext _target};
		};
		_ctrlTitle ctrlsettext format [ctrltext _ctrlTitle,toupper _name];

		//Calculate position of all elements

		_ctrlTitlePos set [1,(0.5 - _posH) - (_ctrlTitlePos select 3) - _ctrlTitleOffsetY];
		_ctrlTitle ctrlsetposition _ctrlTitlePos;
		_ctrlTitle ctrlcommit 0;

		_ctrlContentPos set [1,0.5 - _posH];
		_ctrlContentPos set [3,_posH * 2];
		_ctrlContent ctrlsetposition _ctrlContentPos;
		_ctrlContent ctrlcommit 0;

		_ctrlBackgroundPos set [1,0.5 - _posH];
		_ctrlBackgroundPos set [3,_posH * 2];
		_ctrlBackground ctrlsetposition _ctrlBackgroundPos;
		_ctrlBackground ctrlcommit 0;

		_ctrlButtonOKPos set [1,0.5 + _posH + _ctrlTitleOffsetY];
		_ctrlButtonOK ctrlsetposition _ctrlButtonOKPos;
		_ctrlButtonOK ctrlcommit 0;
		ctrlsetfocus _ctrlButtonOK;

		_ctrlButtonCancelPos set [1,0.5 + _posH + _ctrlTitleOffsetY];
		_ctrlButtonCancel ctrlsetposition _ctrlButtonCancelPos;
		_ctrlButtonCancel ctrlcommit 0;
	};
	case "onUnload": {
	};
};