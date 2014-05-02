class CfgVehicles
{
	class chessmastersCommonLibrary_ModuleBase;
	class cws_injury_ModuleBase: chessmastersCommonLibrary_ModuleBase
	{
		category = "CWSInjury";

		displayName = "CWS Injury Module Base";
	};
	class cws_injury_ModuleConfig: cws_injury_ModuleBase
	{
		subCategory = "System";

		scope = 2;
		scopeCurator = 2;

		displayName = "CWS Config";
		function = "cws_fnc_ModuleConfig";

		curatorInfoType = "RscDisplayAttributesModuleCWSConfig";
	};
	class cws_injury_ModuleCWSLoad: cws_injury_ModuleBase
	{
		subCategory = "Unit";

		scopeCurator = 2;

		displayName = "Load CWS";
		function = "cws_fnc_ModuleCWSLoad";
	};
	class cws_injury_ModuleRevive: cws_injury_ModuleBase
	{
		subCategory = "Unit";

		scopeCurator = 2;

		displayName = "Revive Unit";
		function = "cws_fnc_ModuleRevive";
	};
};
