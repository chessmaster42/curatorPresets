class CfgPatches
{
	class chessmastersCommonLibrary
	{
		units[] = {
				"chessmastersCommonLibrary_ModuleEmpty"
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
		authorUrl = "https://github.com/chessmaster42/";
		version = 1.0.1;
		versionStr = "1.0.1";
		versionAr[] = {1,0,1};
	};
};

class CfgFactionClasses
{
	class ChessmastersCommonLibrary
	{
		displayname = "Chessmasters Common Library";
		priority = 8;
		side = 7;

		addon = "chessmastersCommonLibrary";

		class subCategories
		{
			class Common
			{
				displayname = "Common";
				moduleClass = "chessmastersCommonLibrary_ModuleEmpty";
			};
			class System
			{
				displayname = "System";
				moduleClass = "chessmastersCommonLibrary_ModuleEmpty";
			};
			class Unit
			{
				displayname = "Unit";
				moduleClass = "chessmastersCommonLibrary_ModuleEmpty";
			};
		};
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
