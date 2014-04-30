class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class ModuleDescription
		{
			class AnyPlayer;
			class AnyBrain;
			class EmptyDetector;
		};
	};
	class cws_injury_ModuleBase: Module_F
	{
		mapSize = 1;
		author = "Chessmaster42";
		vehicleClass = "Modules";
		category = "CWSInjury";
		subCategory = "Core";
		side = 7;

		scope = 1;
		scopeCurator = 1;

		displayName = "CWS Injury Module Base";
		icon = "\cws_injury\data\icon_ca.paa";

		function = "";
		functionPriority = 1;
		isGlobal = 2;
		isTriggerActivated = 0;
		isDisposable = 0;

		class Arguments{};
		class ModuleDescription: ModuleDescription
		{
			description = "Core module for CWS Injury";
		};
	};
	class cws_injury_ModuleEmpty: cws_injury_ModuleBase
	{
		mapSize = 0;
		category = "Curator";
		subCategory = "";
		icon = "";

		displayName = "";
		function = "cws_fnc_ModuleEmpty";
		scopeCurator = 1;
	};
	class cws_injury_ModuleConfig: cws_injury_ModuleBase
	{
		displayName = "CWS Config";
		function = "cws_fnc_ModuleConfig";
		scopeCurator = 2;
	};
};
