class CfgPatches
{
	class curatorPresets_Module
	{
		units[] = {
				"curatorPresets_ModuleCWSLoad",
				"curatorPresets_ModuleDamageComponent",
				"curatorPresets_ModuleHelicopterLand",
				"curatorPresets_ModuleHelicopterHover",
				"curatorPresets_ModuleUnitRecruitable",
				"curatorPresets_ModuleUnitSpeed",
				"curatorPresets_ModuleUnitSurrender",
				"curatorPresets_ModuleVAS"
		};
		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Modules_F"};
	};
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class curatorPresets_FactionClass: NO_CATEGORY
	{
		displayName = "Curator Presets";
	};
	class curatorPresets_Category
	{
		displayName = "Curator Presets";
		priority = 8;
		side = 7;
	};
};

class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class ArgumentsBaseUnits
		{
			class Units;
		};
		class ModuleDescription
		{
			class AnyBrain;
		};
	};
	class curatorPresets_ModuleBase: Module_F
	{
		scope = 1;
		displayName = "";
		icon = "\curatorPresets_Module\data\iconPresets_ca.paa";
		category = "Curator";

		function = "";
		functionPriority = 1;
		isGlobal = 2;
		isTriggerActivated = 0;
		isDisposable = 1;

		curatorInfoType = "RscDisplayAttributesMan";

		scopeCurator = 1;
		vehicleClass = "Modules";
		
		class Arguments: ArgumentsBaseUnits
		{
			class Units: Units {};
		};

		class ModuleDescription: ModuleDescription
		{
			description = "Short module description";
			sync[] = {};
		};
	};
	class curatorPresets_ModuleCWS: curatorPresets_ModuleBase
	{
		scope = 2;
		displayName = "CWS Injury";
		function = "curatorPresets_fnc_ModuleCWSLoad";
		scopeCurator = 2;
	};
	class curatorPresets_ModuleDamageComponent: curatorPresets_ModuleBase
	{
		scope = 2;
		displayName = "Damage Unit Component";
		function = "curatorPresets_fnc_ModuleDamageComponent";
		scopeCurator = 2;

		class Arguments: ArgumentsBaseUnits
		{
			class Units: Units {};
			class Component
  			{
				displayName = "Unit/Vehicle Component";
				description = "Which component will be damaged";
				typeName = "STRING";
				class values
				{
					//Common
					class HitEngine {
						name = "Engine";
						value = "HitEngine";
						default = 1;
					};
					class HitHull {
						name = "Hull";
						value = "HitHull";
					};
					class HitFuel {
						name = "Fuel";
						value = "HitFuel";
					};

					//Air
					class HitAvionics {
						name = "Avionics";
						value = "HitAvionics";
					};
					class HitVRotor {
						name = "Vertical Rotor";
						value = "HitVRotor";
					};
					class HitHRotor {
						name = "Horizontal Rotor";
						value = "HitHRotor";
					};

					//Tracked
					class HitLTrack {
						name = "Left Track";
						value = "HitLTrack";
					};
					class HitRTrack {
						name = "Right Track";
						value = "HitRTrack";
					};
				};
			};
			class Damage
  			{
				displayName = "Damage";
				description = "Amount to damage the component";
				typeName = "NUMBER";
				defaultValue = 1;
			};
		};
	};
	class curatorPresets_ModuleHelicopterLand: curatorPresets_ModuleBase
	{
		scope = 2;
		displayName = "Helicopter Land";
		function = "curatorPresets_fnc_ModuleHelicopterLand";
		scopeCurator = 2;
	};
	class curatorPresets_ModuleHelicopterHover: curatorPresets_ModuleBase
	{
		scope = 2;
		displayName = "Helicopter Hover";
		function = "curatorPresets_fnc_ModuleHelicopterHover";
		scopeCurator = 2;
	};
	class curatorPresets_ModuleUnitRecruitable: curatorPresets_ModuleBase
	{
		scope = 2;
		displayName = "Unit Recruitable";
		function = "curatorPresets_fnc_ModuleUnitRecruitable";
		scopeCurator = 2;
	};
	class curatorPresets_ModuleUnitSpeed: curatorPresets_ModuleBase
	{
		scope = 2;
		displayName = "Unit Speed";
		function = "curatorPresets_fnc_ModuleUnitSpeed";
		scopeCurator = 2;

		class Arguments: ArgumentsBaseUnits
		{
			class Units: Units {};
			class Component
			{
				displayName = "Unit/Vehicle Speed";
				description = "Which speed the unit will travel at";
				typeName = "STRING";
				class values
				{
					class LimitedSpeed {
						name = "Limited";
						value = "LIMITED";
						default = 1;
					};
					class NormalSpeed {
						name = "Normal";
						value = "NORMAL";
					};
					class FullSpeed {
						name = "Full";
						value = "FULL";
					};
				};
			};
		};
	};
	class curatorPresets_ModuleUnitSurrender: curatorPresets_ModuleBase
	{
		scope = 2;
		displayName = "Unit Surrender";
		function = "curatorPresets_fnc_ModuleUnitSurrender";
		scopeCurator = 2;
	};
	class curatorPresets_ModuleVAS: curatorPresets_ModuleBase
	{
		scope = 2;
		displayName = "Virtual Ammobox System";
		function = "curatorPresets_fnc_ModuleVAS";
		scopeCurator = 2;
	};
};

class CfgFunctions
{
	class curatorPresets
	{
		class curatorPresets_FactionClass
		{
			file = "\curatorPresets_Module\functions";
			class moduleCWSLoad{};
			class moduleDamageComponent{};
			class moduleHelicopterLand{};
			class moduleHelicopterHover{};
			class moduleUnitRecruitable{};
			class moduleUnitSpeed{};
			class moduleUnitSurrender{};
			class moduleVAS{};
		};
	};
};
