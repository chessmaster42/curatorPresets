class CfgPatches
{
	class cws_injury
	{
		units[] = {
				"cws_injury_ModuleEmpty",
				"cws_injury_ModuleFailsafeReload",
				"cws_injury_ModuleConfig",
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
		authorUrl = "https://github.com/chessmaster42/cws_injury";
		version = 1.0.1;
		versionStr = "1.0.1";
		versionAr[] = {1,0,1};
	};
};

class CfgFactionClasses
{
	class CWSInjury
	{
		displayname = "CWS Injury";
		priority = 8;
		side = 7;
	};
};

#include "cfgVehicles.hpp"

#include "cfgFunctions.hpp"

#include "dialogs.hpp"
