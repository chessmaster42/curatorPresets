class CfgPatches
{
	class curatorPresets_Module
	{
		units[] = {
				"curatorPresets_ModuleAirFlight",
				"curatorPresets_ModuleArtillery",
				"curatorPresets_ModuleCWSLoad",
				"curatorPresets_ModuleDamageComponent",
				"curatorPresets_ModuleEmpty",
				"curatorPresets_ModuleFailsafeReload",
				"curatorPresets_ModuleSpawnGarrison",
				"curatorPresets_ModuleTaskForceRadio",
				"curatorPresets_ModuleUnitAction",
				"curatorPresets_ModuleUnitAnimation",
				"curatorPresets_ModuleUnitChat",
				"curatorPresets_ModuleUnitRecruitable",
				"curatorPresets_ModuleUnitSkills",
				"curatorPresets_ModuleUnitSpeed",
				"curatorPresets_ModuleUnitSurrender",
				"curatorPresets_ModuleVAS",
				"curatorPresets_ModuleVehicleDisembark"
		};
		requiredVersion = 1.0;
		requiredAddons[] = {
				"A3_UI_F",
				"A3_UI_F_Curator",
				"A3_Functions_F",
				"A3_Functions_F_Curator",
				"A3_Modules_F",
				"A3_Modules_F_Curator"
		};
		author[] = {"Chessmaster42"};
		authorUrl = "https://github.com/chessmaster42/curatorPresets";
		version = 1.8.1;
		versionStr = "1.8.1";
		versionAr[] = {1,8,1};
	};
};

class CfgFactionClasses
{
	class CuratorPresets
	{
		displayname = "Curator Presets";
		priority = 8;
		side = 7;
	};
};

#include "cfgVehicles.hpp"

#include "cfgFunctions.hpp"

#include "dialogs.hpp"
