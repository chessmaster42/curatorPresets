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
	class curatorPresets_ModuleBase: Module_F
	{
		mapSize = 1;
		author = "Chessmaster42";
		vehicleClass = "Modules";
		category = "CuratorPresets";
		subCategory = "Core";
		side = 7;

		scope = 1;
		scopeCurator = 1;

		displayName = "Curator Presets Module Base";
		icon = "\curatorPresets_Module\data\iconPresets_ca.paa";

		function = "";
		functionPriority = 1;
		isGlobal = 2;
		isTriggerActivated = 0;
		isDisposable = 0;

		class Arguments{};
		class ModuleDescription: ModuleDescription
		{
			description = "Core module for Curator Presets Mod";
		};
	};
	class curatorPresets_ModuleEmpty: curatorPresets_ModuleBase
	{
		mapSize = 0;
		category = "Curator";
		subCategory = "";
		icon = "";

		displayName = "";
		function = "cpm_fnc_ModuleEmpty";
		scopeCurator = 1;
	};
	class curatorPresets_ModuleFailsafeReload: curatorPresets_ModuleBase
	{
		category = "Curator";

		displayName = "CPM Failsafe Reload";
		function = "cpm_fnc_ModuleFailsafeReload";
		scopeCurator = 2;
	};
	class curatorPresets_ModuleAirFlight: curatorPresets_ModuleBase
	{
		displayName = "Air Flight";
		function = "cpm_fnc_ModuleAirFlight";
		scopeCurator = 2;
	};
	class curatorPresets_ModuleArtillery: curatorPresets_ModuleBase
	{
		displayName = "Artillery";
		function = "cpm_fnc_ModuleArtillery";
		scopeCurator = 2;
	};
	class curatorPresets_ModuleCWSLoad: curatorPresets_ModuleBase
	{
		displayName = "CWS Injury";
		function = "cpm_fnc_ModuleCWSLoad";
		scopeCurator = 2;
		subCategory = "System";
	};
	class curatorPresets_ModuleDamageComponent: curatorPresets_ModuleBase
	{
		displayName = "Damage Unit Component";
		function = "cpm_fnc_ModuleDamageComponent";
		scopeCurator = 2;
	};
	class curatorPresets_ModuleSpawnGarrison: curatorPresets_ModuleBase
	{
		displayName = "Spawn Garrison";
		function = "cpm_fnc_ModuleSpawnGarrison";
		scopeCurator = 2;
	};
	class curatorPresets_ModuleTaskForceRadio: curatorPresets_ModuleBase
	{
		displayName = "Task Force Radio";
		function = "cpm_fnc_ModuleTaskForceRadio";
		scopeCurator = 2;
		subCategory = "System";
		curatorInfoType = "RscDisplayAttributesModuleTaskForceRadio";
	};
	class curatorPresets_ModuleUnitAction: curatorPresets_ModuleBase
	{
		displayName = "Unit Action";
		function = "cpm_fnc_ModuleUnitAction";
		scopeCurator = 2;
		subCategory = "Unit";
	};
	class curatorPresets_ModuleUnitAnimation: curatorPresets_ModuleBase
	{
		displayName = "Unit Animation";
		function = "cpm_fnc_ModuleUnitAnimation";
		scopeCurator = 2;
		subCategory = "Unit";
	};
	class curatorPresets_ModuleUnitChat: curatorPresets_ModuleBase
	{
		displayName = "Unit Chat";
		function = "cpm_fnc_ModuleUnitChat";
		scopeCurator = 2;
		subCategory = "Unit";
	};
	class curatorPresets_ModuleUnitRecruitable: curatorPresets_ModuleBase
	{
		displayName = "Unit Recruitable";
		function = "cpm_fnc_ModuleUnitRecruitable";
		scopeCurator = 2;
		subCategory = "Unit";
	};
	class curatorPresets_ModuleUnitSkills: curatorPresets_ModuleBase
	{
		displayName = "Unit Skills";
		function = "cpm_fnc_ModuleUnitSkills";
		scopeCurator = 2;
		subCategory = "Unit";
	};
	class curatorPresets_ModuleUnitSpeed: curatorPresets_ModuleBase
	{
		displayName = "Unit Speed";
		function = "cpm_fnc_ModuleUnitSpeed";
		scopeCurator = 2;
		subCategory = "Unit";
	};
	class curatorPresets_ModuleUnitSurrender: curatorPresets_ModuleBase
	{
		displayName = "Unit Surrender";
		function = "cpm_fnc_ModuleUnitSurrender";
		scopeCurator = 2;
		subCategory = "Unit";
	};
	class curatorPresets_ModuleVAS: curatorPresets_ModuleBase
	{
		scope = 2;
		displayName = "Virtual Ammobox System";
		function = "cpm_fnc_ModuleVAS";
		scopeCurator = 2;
		subCategory = "System";
	};
	class curatorPresets_ModuleVehicleDisembark: curatorPresets_ModuleBase
	{
		displayName = "Vehicle Disembark";
		function = "cpm_fnc_ModuleVehicleDisembark";
		scopeCurator = 2;
	};
};
