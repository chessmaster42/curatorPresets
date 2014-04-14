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
		requiredAddons[] = {
				"A3_UI_F",
				"A3_Functions_F_Curator",
				"A3_Modules_F_Curator",
				"A3_Modules_F"
		};
	};
};

class CfgFactionClasses
{
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
	class curatorPresets_ModuleCWSLoad: curatorPresets_ModuleBase
	{
		scope = 2;
		displayName = "CWS Injury";
		function = "curatorPresets_fnc_ModuleCWSLoad";
		scopeCurator = 2;
	};
	class curatorPresets_ModuleDamageComponent: curatorPresets_ModuleBase
	{
		scope = 1;
		displayName = "Damage Unit Component";
		function = "curatorPresets_fnc_ModuleDamageComponent";
		scopeCurator = 2;
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
		scope = 1;
		displayName = "Unit Speed";
		function = "curatorPresets_fnc_ModuleUnitSpeed";
		scopeCurator = 2;
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

class RscMapControl;
class RscText;
class RscListBox;
class RscXSliderH;
class RscControlsGroup;
class RscButtonMenuOK;
class RscButtonMenuCancel;
class RscDisplayAttributesModuleCuratorPresets
{
	idd = -1;
	movingenable = 0;
	filterAttributes = 1;
	class ControlsBackground{};
	class Controls
	{
		class Background: RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = 42101;
			x = "6.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "27 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "6.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title: RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
			idc = 42102;
			text = "Curator Presets Dialog Base";
			x = "6.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "8.4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "27 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Content: RscControlsGroup
		{
			idc = 42103;
			x = "7 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "26 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			class controls{};
		};
		class ButtonOK: RscButtonMenuOK
		{
			x = "28.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "16.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ButtonCancel: RscButtonMenuCancel
		{
			x = "6.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "16.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayAttributesModuleDamageComponent: RscDisplayAttributesModuleCuratorPresets
{
	idd = 42000;
	filterAttributes = 1;
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title
		{
			text = "Damage Component Module Config";
		};
		class Content: Content
		{
			class controls
			{
				class ComponentTitle: RscText
				{
					idc = 42011;
					text = "Component";
					x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0.5};
				};
				class ComponentValue: RscListBox
				{
					idc = 42012;
					x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class DamageTitle: RscText
				{
					idc = 42021;
					text = "Component Damage";
					x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0.5};
				};
				class DamageValue: RscXSliderH
				{
					idc = 42022;
					x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					tooltip = "Damage";
				};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
class RscDisplayAttributesModuleUnitSpeed: RscDisplayAttributesModuleCuratorPresets
{
	idd = 43000;
	filterAttributes = 1;
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title
		{
			text = "Unit Speed Module Config";
		};
		class Content: Content
		{
			class controls
			{
				class UnitSpeedTitle: RscText
				{
					idc = 43011;
					text = "Unit Speed";
					x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0.5};
				};
				class UnitSpeedValue: RscListBox
				{
					idc = 43012;
					x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
