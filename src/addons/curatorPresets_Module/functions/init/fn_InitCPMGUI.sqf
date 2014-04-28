#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

uinamespace setVariable ["CuratorPresetsMod_displays", []];
uinamespace setVariable ["CuratorPresetsMod_classes", []];

[] spawn {
	disableSerialization;

	//Wait for the curator screen to be displayed
	while {isNull (findDisplay IDD_RSCDISPLAYCURATOR)} do {
		sleep 5;
	};
	
	[format["CPM - Loading extra Curator GUI elements ..."], 2] call cpm_fnc_ShowMessage;
	
	_display = findDisplay IDD_RSCDISPLAYCURATOR;
	_ctrl = _display displayCtrl IDC_RSCDISPLAYCURATOR_CREATE_MODULES;

	//Wait for all of the module categories to be displayed
	while {(_ctrl tvCount []) <= 1} do {
		sleep 0.5;
	};

	//Find the 'Zeus' category where our modules are currently
	_zeusIndex = -1;
	for [{_i=0},{_i<(_ctrl tvCount [])},{_i=_i+1}] do 
	{
		_tvTextValue = _ctrl tvText [_i];
		if(_tvTextValue == "Zeus") exitWith {
			_zeusIndex = _i;
		};
	};

	if(_zeusIndex < 0) exitWith {};

	//Create the new module category
	_categoryClass = "CuratorPresets";
	_categoryName = gettext (configFile >> "CfgFactionClasses" >> _categoryClass >> "displayName");
	_tvCPMBranch = _ctrl tvAdd [[], _categoryName];
	uinamespace setvariable ["curatorPresets_ModuleCategory", _tvCPMBranch];

	_tvCPMCore = _ctrl tvAdd [[_tvCPMBranch], "Core"];
	_ctrl tvSetData [[_tvCPMBranch, _tvCPMCore], "curatorPresets_ModuleEmpty"];
	_tvCPMUnit = _ctrl tvAdd [[_tvCPMBranch], "Unit"];
	_ctrl tvSetData [[_tvCPMBranch, _tvCPMUnit], "curatorPresets_ModuleEmpty"];
	_tvCPMSystem = _ctrl tvAdd [[_tvCPMBranch], "System"];
	_ctrl tvSetData [[_tvCPMBranch, _tvCPMSystem], "curatorPresets_ModuleEmpty"];

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
			switch(_moduleSubCategory) do {
				case "Unit": {
					_tvModuleBranch = _tvCPMUnit;
				};
				case "System": {
					_tvModuleBranch = _tvCPMSystem;
				};
				default {
					_tvModuleBranch = _tvCPMCore;
				};
			};

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

	[format["CPM - Finished loading extra Curator GUI elements"], 2] call cpm_fnc_ShowMessage;
	["CPM - GUI Initialized", 1] call cpm_fnc_ShowMessage;;
};