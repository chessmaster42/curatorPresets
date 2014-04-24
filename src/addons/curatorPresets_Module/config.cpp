class CfgPatches
{
	class curatorPresets_Module
	{
		units[] = {
				"curatorPresets_ModuleAirFlight",
				"curatorPresets_ModuleArtillery",
				"curatorPresets_ModuleCWSLoad",
				"curatorPresets_ModuleDamageComponent",
				"curatorPresets_ModuleSpawnGarrison",
				"curatorPresets_ModuleUnitAction",
				"curatorPresets_ModuleUnitAnimation",
				"curatorPresets_ModuleUnitChat",
				"curatorPresets_ModuleUnitRecruitable",
				"curatorPresets_ModuleUnitSpeed",
				"curatorPresets_ModuleUnitSurrender",
				"curatorPresets_ModuleVAS",
				"curatorPresets_ModuleVehicleDisembark"
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
		isPersistent = 1;
		isTriggerActivated = 0;
		isDisposable = 0;

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
	class curatorPresets_ModuleAirFlight: curatorPresets_ModuleBase
	{
		scope = 1;
		displayName = "Air Flight";
		function = "cpm_fnc_ModuleAirFlight";
		scopeCurator = 2;
	};
	class curatorPresets_ModuleArtillery: curatorPresets_ModuleBase
	{
		scope = 1;
		displayName = "Artillery";
		function = "cpm_fnc_ModuleArtillery";
		scopeCurator = 2;
	};
	class curatorPresets_ModuleCWSLoad: curatorPresets_ModuleBase
	{
		scope = 2;
		displayName = "CWS Injury";
		function = "cpm_fnc_ModuleCWSLoad";
		scopeCurator = 2;
	};
	class curatorPresets_ModuleDamageComponent: curatorPresets_ModuleBase
	{
		scope = 1;
		displayName = "Damage Unit Component";
		function = "cpm_fnc_ModuleDamageComponent";
		scopeCurator = 2;
	};
	class curatorPresets_ModuleSpawnGarrison: curatorPresets_ModuleBase
	{
		scope = 1;
		displayName = "Spawn Garrison";
		function = "cpm_fnc_ModuleSpawnGarrison";
		scopeCurator = 2;
	};
	class curatorPresets_ModuleUnitAction: curatorPresets_ModuleBase
	{
		scope = 2;
		displayName = "Unit Action";
		function = "cpm_fnc_ModuleUnitAction";
		scopeCurator = 2;
	};
	class curatorPresets_ModuleUnitAnimation: curatorPresets_ModuleBase
	{
		scope = 2;
		displayName = "Unit Animation";
		function = "cpm_fnc_ModuleUnitAnimation";
		scopeCurator = 2;
	};
	class curatorPresets_ModuleUnitChat: curatorPresets_ModuleBase
	{
		scope = 1;
		displayName = "Unit Chat";
		function = "cpm_fnc_ModuleUnitChat";
		scopeCurator = 2;
	};
	class curatorPresets_ModuleUnitRecruitable: curatorPresets_ModuleBase
	{
		scope = 2;
		displayName = "Unit Recruitable";
		function = "cpm_fnc_ModuleUnitRecruitable";
		scopeCurator = 2;
	};
	class curatorPresets_ModuleUnitSpeed: curatorPresets_ModuleBase
	{
		scope = 1;
		displayName = "Unit Speed";
		function = "cpm_fnc_ModuleUnitSpeed";
		scopeCurator = 2;
	};
	class curatorPresets_ModuleUnitSurrender: curatorPresets_ModuleBase
	{
		scope = 2;
		displayName = "Unit Surrender";
		function = "cpm_fnc_ModuleUnitSurrender";
		scopeCurator = 2;
	};
	class curatorPresets_ModuleVAS: curatorPresets_ModuleBase
	{
		scope = 2;
		displayName = "Virtual Ammobox System";
		function = "cpm_fnc_ModuleVAS";
		scopeCurator = 2;
	};
	class curatorPresets_ModuleVehicleDisembark: curatorPresets_ModuleBase
	{
		scope = 1;
		displayName = "Vehicle Disembark";
		function = "cpm_fnc_ModuleVehicleDisembark";
		scopeCurator = 2;
	};
};

class CfgFunctions
{
	createShortcuts = 1;
	class curatorPresets
	{
		tag = "cpm";
		class modules
		{
			file = "\curatorPresets_Module\functions\modules";
			class moduleAirFlight{};
			class moduleArtillery{};
			class moduleCWSLoad{};
			class moduleDamageComponent{};
			class moduleSpawnGarrison{};
			class moduleUnitAction{};
			class moduleUnitAnimation{};
			class moduleUnitChat{};
			class moduleUnitRecruitable{};
			class moduleUnitSpeed{};
			class moduleUnitSurrender{};
			class moduleVAS{};
			class moduleVehicleDisembark{};
		};
		class common
		{
			file = "\curatorPresets_Module\functions\common";
			class initCPM{preInit = 1;};
			class globalExec{};
			class spawnGarrison{};

			class getUnitUnderCursor{};
			class getGroupUnderCursor{};

			class loadDamageComponent{};
			class loadRecruitable{};
			class loadUnitAction{};
			class loadUnitChat{};
			class loadUnitSurrender{};
			class loadVAS{};
		};
		class ui
		{
			file = "\curatorPresets_Module\functions\ui";
			class initAmmoType{};
			class initCoordinates{};
			class initCoordinateRadius{};
			class initDamageSlider{};
			class initDensitySlider{};
			class initRoundCount{};
			class initUnitAction{};
			class initUnitAnimation{};
			class initUnitChatChannel{};
			class initUnitChatText{};
			class initUnitComponent{};
			class initUnitSide{};
			class initUnitSpeed{};
			class initVehicleAltitude{};
			class initVehicleUnits{};
			class initWaypointType{};
		};
		class events
		{
			file = "\curatorPresets_Module\functions\events";
			class onWaypointPlaced{};
		};
	};
};

class RscButtonMenuOK;
class RscButtonMenuCancel;
class RscCombo;
class RscControlsGroup;
class RscControlsGroupNoScrollbars;
class RscEdit;
class RscListBox;
class RscMapControl;
class RscText;
class RscXSliderH;

class RscDisplayAttributeModuleCoordinates: RscControlsGroupNoScrollbars
{
	onSetFocus = "_this call cpm_fnc_InitCoordinates";
	idc = 41000;
	x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
	y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "26 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "2.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controls
	{
		class XTitle: RscText
		{
			idc = 41001;
			text = "X Coordinate";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class XValue: RscEdit
		{
			idc = 41002;
			text = "0";
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class YTitle: RscText
		{
			idc = 41003;
			text = "Y Coordinate";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "1.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class YValue: RscEdit
		{
			idc = 41004;
			text = "0";
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "1.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayAttributeModuleWaypointType: RscControlsGroupNoScrollbars
{
	onSetFocus = "_this call cpm_fnc_InitWaypointType";
	idc = 41010;
	x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
	y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "26 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controls
	{
		class Title: RscText
		{
			idc = 41011;
			text = "Waypoint Type";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value: RscCombo
		{
			wholeHeight = "4.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			idc = 41012;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayAttributeModuleAmmoType: RscControlsGroupNoScrollbars
{
	onSetFocus = "_this call cpm_fnc_InitAmmoType";
	idc = 41020;
	x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
	y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "26 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controls
	{
		class Title: RscText
		{
			idc = 41021;
			text = "Ammo Type";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value: RscCombo
		{
			wholeHeight = "4.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			idc = 41022;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayAttributeModuleUnitSpeed: RscControlsGroupNoScrollbars
{
	onSetFocus = "_this call cpm_fnc_InitUnitSpeed";
	idc = 41030;
	x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
	y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "26 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controls
	{
		class Title: RscText
		{
			idc = 41031;
			text = "Movement Speed";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value: RscCombo
		{
			wholeHeight = "4.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			idc = 41032;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayAttributeModuleRoundCount: RscControlsGroupNoScrollbars
{
	onSetFocus = "_this call cpm_fnc_InitRoundCount";
	idc = 41040;
	x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
	y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "26 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controls
	{
		class Title: RscText
		{
			idc = 41041;
			text = "Rounds";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value: RscCombo
		{
			wholeHeight = "4.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			idc = 41042;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayAttributeModuleUnitComponent: RscControlsGroupNoScrollbars
{
	onSetFocus = "_this call cpm_fnc_InitUnitComponent";
	idc = 41050;
	x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
	y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "26 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controls
	{
		class Title: RscText
		{
			idc = 41051;
			text = "Component";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value: RscCombo
		{
			wholeHeight = "4.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			idc = 41052;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayAttributeModuleDamageSlider: RscControlsGroupNoScrollbars
{
	onSetFocus = "_this call cpm_fnc_InitDamageSlider";
	idc = 41060;
	x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
	y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "26 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controls
	{
		class Title: RscText
		{
			idc = 41061;
			text = "Damage";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value: RscXSliderH
		{
			idc = 41062;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayAttributeModuleVehicleUnits: RscControlsGroupNoScrollbars
{
	onSetFocus = "_this call cpm_fnc_InitVehicleUnits";
	idc = 41070;
	x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
	y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "26 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controls
	{
		class Title: RscText
		{
			idc = 41071;
			text = "Vehicle Units";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value: RscCombo
		{
			wholeHeight = "4.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			idc = 41072;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayAttributeModuleVehicleAltitude: RscControlsGroupNoScrollbars
{
	onSetFocus = "_this call cpm_fnc_InitVehicleAltitude";
	idc = 41080;
	x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
	y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "26 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controls
	{
		class Title: RscText
		{
			idc = 41081;
			text = "Altitude";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value: RscEdit
		{
			idc = 41082;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayAttributeModuleUnitAction: RscControlsGroupNoScrollbars
{
	onSetFocus = "_this call cpm_fnc_InitUnitAction";
	idc = 41090;
	x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
	y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "26 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controls
	{
		class Title: RscText
		{
			idc = 41091;
			text = "Action";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value: RscCombo
		{
			wholeHeight = "4.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			idc = 41092;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayAttributeModuleUnitAnimation: RscControlsGroupNoScrollbars
{
	onSetFocus = "_this call cpm_fnc_InitUnitAnimation";
	idc = 41100;
	x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
	y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "26 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controls
	{
		class Title: RscText
		{
			idc = 41101;
			text = "Animation";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value: RscCombo
		{
			wholeHeight = "4.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			idc = 41102;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayAttributeModuleUnitChatChannel: RscControlsGroupNoScrollbars
{
	onSetFocus = "_this call cpm_fnc_InitUnitChatChannel";
	idc = 41110;
	x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
	y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "26 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controls
	{
		class Title: RscText
		{
			idc = 41111;
			text = "Channel";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value: RscCombo
		{
			wholeHeight = "4.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			idc = 41112;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayAttributeModuleUnitChatText: RscControlsGroupNoScrollbars
{
	onSetFocus = "_this call cpm_fnc_InitUnitChatText";
	idc = 41120;
	x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
	y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "26 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "4.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controls
	{
		class Title: RscText
		{
			idc = 41121;
			text = "Text";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value: RscEdit
		{
			idc = 41122;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayAttributeModuleDensitySlider: RscControlsGroupNoScrollbars
{
	onSetFocus = "_this call cpm_fnc_InitDensitySlider";
	idc = 41130;
	x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
	y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "26 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controls
	{
		class Title: RscText
		{
			idc = 41131;
			text = "Density";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value: RscXSliderH
		{
			idc = 41132;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayAttributeModuleUnitSide: RscControlsGroupNoScrollbars
{
	onSetFocus = "_this call cpm_fnc_InitUnitSide";
	idc = 41140;
	x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
	y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "26 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controls
	{
		class Title: RscText
		{
			idc = 41141;
			text = "Side";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value: RscCombo
		{
			wholeHeight = "4.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			idc = 41142;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayAttributeModuleCoordinateRadius: RscControlsGroupNoScrollbars
{
	onSetFocus = "_this call cpm_fnc_InitCoordinateRadius";
	idc = 41150;
	x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
	y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "26 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controls
	{
		class Title: RscText
		{
			idc = 41151;
			text = "Radius";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value: RscXSliderH
		{
			idc = 41152;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};

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
			idc = 42001;
			x = "6.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "27 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "6.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title: RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
			idc = 42002;
			text = "Curator Presets Dialog Base";
			x = "6.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "8.4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "27 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Content: RscControlsGroup
		{
			idc = 42003;
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
class RscDisplayAttributesModuleAirFlight: RscDisplayAttributesModuleCuratorPresets
{
	idd = 42100;
	filterAttributes = 1;
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title
		{
			text = "Air Flight Module Config";
		};
		class Content: Content
		{
			class Controls: controls
			{
				class FlightSpeed: RscDisplayAttributeModuleUnitSpeed{};
				class Altitude: RscDisplayAttributeModuleVehicleAltitude
				{
					y = "1.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
class RscDisplayAttributesModuleArtillery: RscDisplayAttributesModuleCuratorPresets
{
	idd = 42200;
	filterAttributes = 1;
	class Controls: Controls
	{
		class Background: Background
		{
			h = "9.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title: Title
		{
			text = "Artillery Module Config";
		};
		class Content: Content
		{
			h = "8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			class Controls: controls
			{
				class Coordinates: RscDisplayAttributeModuleCoordinates{};
				class Ammo: RscDisplayAttributeModuleAmmoType
				{
					y = "2.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class RoundCount: RscDisplayAttributeModuleRoundCount
				{
					y = "3.6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
			};
		};
		class ButtonOK: ButtonOK
		{
			y = "19.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class ButtonCancel: ButtonCancel
		{
			y = "19.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
	};
};
class RscDisplayAttributesModuleDamageComponent: RscDisplayAttributesModuleCuratorPresets
{
	idd = 42300;
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
			class Controls: controls
			{
				class Component: RscDisplayAttributeModuleUnitComponent{};
				class Damage: RscDisplayAttributeModuleDamageSlider
				{
					y = "1.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
class RscDisplayAttributesModuleUnitSpeed: RscDisplayAttributesModuleCuratorPresets
{
	idd = 42400;
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
			class Controls: controls
			{
				class UnitSpeed: RscDisplayAttributeModuleUnitSpeed{};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
class RscDisplayAttributesModuleVehicleDisembark: RscDisplayAttributesModuleCuratorPresets
{
	idd = 42600;
	filterAttributes = 1;
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title
		{
			text = "Vehicle Disembark Module Config";
		};
		class Content: Content
		{
			class Controls: controls
			{
				class Units: RscDisplayAttributeModuleVehicleUnits{};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
class RscDisplayAttributesModuleWaypoint: RscDisplayAttributesModuleCuratorPresets
{
	idd = 42700;
	filterAttributes = 1;
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title
		{
			text = "Waypoint Module Config";
		};
		class Content: Content
		{
			class Controls: controls
			{
				class WaypointType: RscDisplayAttributeModuleWaypointType{};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
class RscDisplayAttributesModuleUnitAction: RscDisplayAttributesModuleCuratorPresets
{
	idd = 42800;
	filterAttributes = 1;
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title
		{
			text = "Action Module Config";
		};
		class Content: Content
		{
			class Controls: controls
			{
				class UnitAction: RscDisplayAttributeModuleUnitAction{};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
class RscDisplayAttributesModuleUnitAnimation: RscDisplayAttributesModuleCuratorPresets
{
	idd = 42900;
	filterAttributes = 1;
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title
		{
			text = "Animation Module Config";
		};
		class Content: Content
		{
			class Controls: controls
			{
				class UnitAnimation: RscDisplayAttributeModuleUnitAnimation{};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
class RscDisplayAttributesModuleUnitChat: RscDisplayAttributesModuleCuratorPresets
{
	idd = 43000;
	filterAttributes = 1;
	class Controls: Controls
	{
		class Background: Background
		{
			h = "9.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title: Title
		{
			text = "Chat Module Config";
		};
		class Content: Content
		{
			h = "8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			class Controls: controls
			{
				class Channel: RscDisplayAttributeModuleUnitChatChannel{};
				class Text: RscDisplayAttributeModuleUnitChatText
				{
					y = "1.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
			};
		};
		class ButtonOK: ButtonOK
		{
			y = "19.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class ButtonCancel: ButtonCancel
		{
			y = "19.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
	};
};
class RscDisplayAttributesModuleSpawnGarrison: RscDisplayAttributesModuleCuratorPresets
{
	idd = 43100;
	filterAttributes = 1;
	class Controls: Controls
	{
		class Background: Background
		{
			h = "9.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title: Title
		{
			text = "Spawn Garrison Module Config";
		};
		class Content: Content
		{
			h = "8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			class Controls: controls
			{
				class Coordinates: RscDisplayAttributeModuleCoordinates{};
				class Radius: RscDisplayAttributeModuleCoordinateRadius
				{
					y = "2.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class Density: RscDisplayAttributeModuleDensitySlider
				{
					y = "3.6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class Side: RscDisplayAttributeModuleUnitSide
				{
					y = "4.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
			};
		};
		class ButtonOK: ButtonOK
		{
			y = "19.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class ButtonCancel: ButtonCancel
		{
			y = "19.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
	};
};
