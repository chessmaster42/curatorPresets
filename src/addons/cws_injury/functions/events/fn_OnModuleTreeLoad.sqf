#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

["Loading module tree ...", 99] call cws_fnc_ShowMessage;

disableSerialization;

_categoryClass = _this select 0;

//Safety precaution, wait for the curator screen to be displayed
while {isNull (findDisplay IDD_RSCDISPLAYCURATOR)} do {
	sleep 1;
};

//Get the UI control
_display = findDisplay IDD_RSCDISPLAYCURATOR;
_ctrl = _display displayCtrl IDC_RSCDISPLAYCURATOR_CREATE_MODULES;

//Get the category details
_category = (configFile >> "CfgFactionClasses" >> _categoryClass);
_categoryName = gettext (_category >> "displayName");
_subCategories = ((_category >> "subCategories") call BIS_fnc_returnChildren);

//Check to see if our category already exists and if so delete it
for [{_i=0},{_i<(_ctrl tvCount [])},{_i=_i+1}] do 
{
	_tvText = _ctrl tvText [_i];
	if(_tvText == _categoryName) then {
		_ctrl tvDelete [_i];
	};
};

//Create the new module category
_tvMainBranch = _ctrl tvAdd [[], _categoryName];

//Create the sub-categories
_subCategoryBranches = [];
{
	_tvText = gettext (_x >> "displayName");
	_tvData = gettext (_x >> "function");
	_tvBranch = _ctrl tvAdd [[_tvMainBranch], _tvText];
	_ctrl tvSetData [[_tvCPMBranch, _tvCPMCore], _tvData];

	_subCategoryBranches set [count _subCategoryBranches, _tvBranch];
} forEach _subCategories;

_moduleClassList = getArray (configFile >> "cfgPatches" >> "curatorPresets_Module" >> "units");

//Add all of the modules to the category
_index = 0;
{
	_moduleCategory = gettext (configFile >> "CfgVehicles" >> _x >> "category");

	//Check if the category is a match and the module is public
	if(_moduleCategory == _categoryClass) then {
		//Get values from config
		_moduleDisplayName = gettext (configFile >> "CfgVehicles" >> _x >> "displayName");
		_moduleIcon = gettext (configFile >> "CfgVehicles" >> _x >> "icon");
		_moduleSubCategory = gettext (configFile >> "CfgVehicles" >> _x >> "subCategory");

		_tvModuleBranch = nil;
		_idx = 0;
		{
			if(_moduleSubCategory == configName _x) exitWith {
				_tvModuleBranch = _subCategoryBranches select _idx;
			};
			_idx = _idx + 1;
		} forEach _subCategories;

		//Create the new tree entry
		_leaf = _ctrl tvAdd [[_tvCPMBranch, _tvModuleBranch], _moduleDisplayName];
		_newPath = [_tvCPMBranch, _tvModuleBranch, _leaf];

		//Copy all of the data into it
		_ctrl tvSetData [_newPath, _x];
		_ctrl tvSetPicture [_newPath, _moduleIcon];
		_ctrl tvSetValue [_newPath, _index];

		_index = _index + 1;
	};
} forEach _moduleClassList;

//Sort the new lists
_ctrl tvSort [[_tvCPMBranch, _tvCPMCore], false];
_ctrl tvSort [[_tvCPMBranch, _tvCPMUnit], false];
_ctrl tvSort [[_tvCPMBranch, _tvCPMSystem], false];
_ctrl tvSort [[_tvCPMBranch], false];

//Sort the base module list
_ctrl tvSort [[], false];

["Finished loading module tree", 99] call cws_fnc_ShowMessage;