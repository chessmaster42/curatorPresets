class CfgPatches
{
	class curatorPresets_Module
	{
		units[] = {
				"curatorPresets_ModuleAirFlight",
				"curatorPresets_ModuleArtillery",
				"curatorPresets_ModuleConfig",
				"curatorPresets_ModuleDamageComponent",
				"curatorPresets_ModuleFailsafeReload",
				"curatorPresets_ModuleSpawnGarrison",
				"curatorPresets_ModuleTaskForceRadio",
				"curatorPresets_ModuleUnitAction",
				"curatorPresets_ModuleUnitAnimation",
				"curatorPresets_ModuleUnitChat",
				"curatorPresets_ModuleUnitRecruitable",
				"curatorPresets_ModuleUnitSkills",
				"curatorPresets_ModuleUnitSurrender",
				"curatorPresets_ModuleUnitTeleport",
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
				"A3_Modules_F_Curator",
				"chessmastersCommonLibrary"
		};
		author[] = {"Chessmaster42"};
		authorUrl = "https://github.com/chessmaster42/curatorPresets";
		version = 1.9.1;
		versionStr = "1.9.1";
		versionAr[] = {1,9,1};
	};
};

class CfgFactionClasses
{
	class ChessmastersCommonLibrary;
	class CuratorPresets: ChessmastersCommonLibrary
	{
		displayname = "Curator Presets";

		addon = "curatorPresets_Module";
	};
};

class CfgVehicles
{
	#include "cfgVehicles.hpp"
};

class CfgFunctions
{
	#include "cfgFunctions.hpp"
};

#include "dialogs.hpp"
