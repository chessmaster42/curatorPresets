#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

_control = _this select 0;

_control ctrlRemoveAllEventHandlers "setFocus";

//Get the display for the dialog
_display = ctrlParent _control;

//Get unit info
_unit = uinamespace getVariable "curatorPresets_ModuleUnit";

//Setup the skill sliders
_skillTypes = ["aimingSpeed","aimingAccuracy","aimingShake","spotDistance","spotTime","reloadSpeed","commanding","endurance","courage","general"];
_skillSliders = [41172,41174,41176,41178,41180,41182,41184,41186,41188,41190];
_index = 0;
{
	_ctrl = _display displayCtrl (_skillSliders select _index); 
	_ctrl sliderSetRange [0, 1];
	_ctrl sliderSetPosition (_unit skill _x);
	_ctrl ctrlSetTooltip str (_unit skill _x);
	_ctrl ctrlCommit 1;
	_index = _index + 1;
} forEach _skillTypes;

//Setup handler when OK is clicked
_ctrlButtonOK = _display displayCtrl IDC_OK;
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", {
	_skillTypes = ["aimingSpeed","aimingAccuracy","aimingShake","spotDistance","spotTime","reloadSpeed","commanding","endurance","courage","general"];
	_skillSliders = [41172,41174,41176,41178,41180,41182,41184,41186,41188,41190];
	_display = ctrlParent (_this select 0);
	_index = 0;
	_skillValues = [];
	{
		_ctrl = _display displayCtrl (_skillSliders select _index);
		_skillValue = [_x, (sliderPosition _ctrl)];
		_skillValues set [_index, _skillValue];
		_index = _index + 1;
	} forEach _skillTypes;
	uinamespace setVariable ["curatorPresets_UnitSkillsArray", _skillValues];
}];