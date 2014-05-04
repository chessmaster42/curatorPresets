class CfgVehicles
{
	class Logic;
	class Module_F;
	class chessmastersCommonLibrary_ModuleBase;
	class curatorPresets_ModuleBase: chessmastersCommonLibrary_ModuleBase
	{
		category = "CuratorPresets";

		displayName = "Curator Presets Module Base";
	};
	class curatorPresets_ModuleConfig: curatorPresets_ModuleBase
	{
		subCategory = "System";

		scope = 2;
		scopeCurator = 2;

		displayName = "CPM Config";
		function = "cpm_fnc_ModuleConfig";

		curatorInfoType = "RscDisplayAttributesModuleCPMConfig";
	};
	class curatorPresets_ModuleFailsafeReload: curatorPresets_ModuleBase
	{
		category = "Curator";

		scope = 2;
		scopeCurator = 2;

		displayName = "CPM Failsafe Reload";
		function = "cpm_fnc_ModuleFailsafeReload";
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
		subCategory = "System";

		scope = 2;
		scopeCurator = 2;

		displayName = "Task Force Radio";
		icon = "\curatorPresets_Module\data\icon_tfr_ca.paa";
		picture = "\curatorPresets_Module\data\icon_tfr_ca.paa";
		portrait = "\curatorPresets_Module\data\icon_tfr_ca.paa";

		function = "ccl_fnc_ModuleDummy";

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
	class curatorPresets_ModuleUnitSurrender: curatorPresets_ModuleBase
	{
		displayName = "Unit Surrender";
		function = "cpm_fnc_ModuleUnitSurrender";
		scopeCurator = 2;
		subCategory = "Unit";
	};
	class curatorPresets_ModuleUnitTeleport: curatorPresets_ModuleBase
	{
		displayName = "Unit Teleport";
		function = "cpm_fnc_ModuleUnitTeleport";
		scopeCurator = 2;
		subCategory = "Unit";
	};
	class curatorPresets_ModuleVAS: curatorPresets_ModuleBase
	{
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
