class CfgScriptPaths
{
	CuratorPresetsModDisplays = "\curatorPresets_Module\functions\ui\displays\";
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

class RscDisplayAttributeModule: RscControlsGroupNoScrollbars
{
	onSetFocus = "";
	idc = -1;
	x = "7 * (((safezoneW / safezoneH) min 1.2) / 40)";
	y = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "26 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controls{};
};
class RscDisplayAttributeModuleCombo: RscDisplayAttributeModule
{
	onSetFocus = "";
	idc = -1;
	class controls
	{
		class Title1: RscText
		{
			idc = -1;
			text = "";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value1: RscCombo
		{
			wholeHeight = "7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			idc = -1;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayAttributeModuleSlider: RscDisplayAttributeModule
{
	onSetFocus = "";
	idc = -1;
	class controls
	{
		class Title1: RscText
		{
			idc = -1;
			text = "";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value1: RscXSliderH
		{
			onSliderPosChanged = "(_this select 0) ctrlSetTooltip str(sliderPosition (_this select 0))";
			idc = -1;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};

class RscDisplayAttributeModuleCoordinates: RscDisplayAttributeModule
{
	onSetFocus = "_this call cpm_fnc_InitCoordinates";
	idc = 41000;
	h = "2.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controls: controls
	{
		class Title1: RscText
		{
			idc = 41001;
			text = "X Coordinate";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value1: RscEdit
		{
			idc = 41002;
			text = "0";
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title2: RscText
		{
			idc = 41003;
			text = "Y Coordinate";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "1.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value2: RscEdit
		{
			idc = 41004;
			text = "0";
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "1.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayAttributeModuleWaypointType: RscDisplayAttributeModuleCombo
{
	onSetFocus = "_this call cpm_fnc_InitWaypointType";
	idc = 41010;
	class controls: controls
	{
		class Title1: Title1
		{
			idc = 41011;
			text = "Waypoint Type";
		};
		class Value1: Value1
		{
			idc = 41012;
		};
	};
};
class RscDisplayAttributeModuleAmmoType: RscDisplayAttributeModuleCombo
{
	onSetFocus = "_this call cpm_fnc_InitAmmoType";
	idc = 41020;
	class controls: controls
	{
		class Title1: Title1
		{
			idc = 41021;
			text = "Ammo Type";
		};
		class Value1: Value1
		{
			idc = 41022;
		};
	};
};
class RscDisplayAttributeModuleUnitSpeed: RscDisplayAttributeModuleCombo
{
	onSetFocus = "_this call cpm_fnc_InitUnitSpeed";
	idc = 41030;
	class controls: controls
	{
		class Title1: Title1
		{
			idc = 41031;
			text = "Movement Speed";
		};
		class Value1: Value1
		{
			idc = 41032;
		};
	};
};
class RscDisplayAttributeModuleRoundCount: RscDisplayAttributeModuleCombo
{
	onSetFocus = "_this call cpm_fnc_InitRoundCount";
	idc = 41040;
	class controls: controls
	{
		class Title1: Title1
		{
			idc = 41041;
			text = "Number of Rounds";
		};
		class Value1: Value1
		{
			idc = 41042;
		};
	};
};
class RscDisplayAttributeModuleUnitComponent: RscDisplayAttributeModuleCombo
{
	onSetFocus = "_this call cpm_fnc_InitUnitComponent";
	idc = 41050;
	class controls: controls
	{
		class Title1: Title1
		{
			idc = 41051;
			text = "Component";
		};
		class Value1: Value1
		{
			idc = 41052;
		};
	};
};
class RscDisplayAttributeModuleDamageSlider: RscDisplayAttributeModuleSlider
{
	onSetFocus = "_this call cpm_fnc_InitDamageSlider";
	idc = 41060;
	class controls: controls
	{
		class Title1: Title1
		{
			idc = 41061;
			text = "Damage";
		};
		class Value1: Value1
		{
			idc = 41062;
		};
	};
};
class RscDisplayAttributeModuleVehicleUnits: RscDisplayAttributeModuleCombo
{
	onSetFocus = "_this call cpm_fnc_InitVehicleUnits";
	idc = 41070;
	class controls: controls
	{
		class Title1: Title1
		{
			idc = 41071;
			text = "Unit Category";
		};
		class Value1: Value1
		{
			idc = 41072;
		};
	};
};
class RscDisplayAttributeModuleVehicleAltitude: RscDisplayAttributeModule
{
	onSetFocus = "_this call cpm_fnc_InitVehicleAltitude";
	idc = 41080;
	class controls: controls
	{
		class Title1: RscText
		{
			idc = 41081;
			text = "Altitude";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value1: RscEdit
		{
			idc = 41082;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayAttributeModuleUnitAction: RscDisplayAttributeModuleCombo
{
	onSetFocus = "_this call cpm_fnc_InitUnitAction";
	idc = 41090;
	class controls: controls
	{
		class Title1: Title1
		{
			idc = 41091;
			text = "Action";
		};
		class Value1: Value1
		{
			idc = 41092;
		};
	};
};
class RscDisplayAttributeModuleUnitAnimation: RscDisplayAttributeModuleCombo
{
	onSetFocus = "_this call cpm_fnc_InitUnitAnimation";
	idc = 41100;
	class controls: controls
	{
		class Title: RscText
		{
			idc = 41101;
			text = "Animation";
		};
		class Value: RscCombo
		{
			idc = 41102;
		};
	};
};
class RscDisplayAttributeModuleUnitChatChannel: RscDisplayAttributeModuleCombo
{
	onSetFocus = "_this call cpm_fnc_InitUnitChatChannel";
	idc = 41110;
	class controls: controls
	{
		class Title1: Title1
		{
			idc = 41111;
			text = "Channel";
		};
		class Value1: Value1
		{
			idc = 41112;
		};
	};
};
class RscDisplayAttributeModuleUnitChatText: RscDisplayAttributeModule
{
	onSetFocus = "_this call cpm_fnc_InitUnitChatText";
	idc = 41120;
	h = "4.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controls: controls
	{
		class Title1: RscText
		{
			idc = 41121;
			text = "Text";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value1: RscEdit
		{
			style = 16;
			idc = 41122;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {1,1,1,0.1};
		};
	};
};
class RscDisplayAttributeModuleDensitySlider: RscDisplayAttributeModuleSlider
{
	onSetFocus = "_this call cpm_fnc_InitDensitySlider";
	idc = 41130;
	class controls: controls
	{
		class Title1: Title1
		{
			idc = 41131;
			text = "Density";
		};
		class Value1: Value1
		{
			idc = 41132;
		};
	};
};
class RscDisplayAttributeModuleUnitSide: RscDisplayAttributeModuleCombo
{
	onSetFocus = "_this call cpm_fnc_InitUnitSide";
	idc = 41140;
	class controls: controls
	{
		class Title1: Title1
		{
			idc = 41141;
			text = "Side";
		};
		class Value1: Value1
		{
			idc = 41142;
		};
	};
};
class RscDisplayAttributeModuleCoordinateRadius: RscDisplayAttributeModuleSlider
{
	onSetFocus = "_this call cpm_fnc_InitCoordinateRadius";
	idc = 41150;
	class controls: controls
	{
		class Title1: Title1
		{
			idc = 41151;
			text = "Radius";
		};
		class Value1: Value1
		{
			idc = 41152;
		};
	};
};
class RscDisplayAttributeModuleAppliesTo: RscDisplayAttributeModuleCombo
{
	onSetFocus = "_this call cpm_fnc_InitAppliesTo";
	idc = 41160;
	class controls: controls
	{
		class Title1: Title1
		{
			idc = 41161;
			text = "Applies To";
		};
		class Value1: Value1
		{
			idc = 41162;
		};
	};
};
class RscDisplayAttributeModuleUnitSkills: RscDisplayAttributeModule
{
	onSetFocus = "_this call cpm_fnc_InitUnitSkills";
	idc = 41170;
	h = "11.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controls: controls
	{
		class Title1: RscText
		{
			idc = 41171;
			text = "Aiming Speed";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value1: RscXSliderH
		{
			idc = 41172;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title2: RscText
		{
			idc = 41173;
			text = "Aiming Accuracy";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "1.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value2: RscXSliderH
		{
			idc = 41174;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "1.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title3: RscText
		{
			idc = 41175;
			text = "Aiming Shake";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "2.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value3: RscXSliderH
		{
			idc = 41176;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "2.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title4: RscText
		{
			idc = 41177;
			text = "Spot Distance";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "3.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value4: RscXSliderH
		{
			idc = 41178;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "3.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title5: RscText
		{
			idc = 41179;
			text = "Spot Time";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "4.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value5: RscXSliderH
		{
			idc = 41180;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "4.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title6: RscText
		{
			idc = 41181;
			text = "Reload Speed";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "5.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value6: RscXSliderH
		{
			idc = 41182;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "5.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title7: RscText
		{
			idc = 41183;
			text = "Commanding";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "6.6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value7: RscXSliderH
		{
			idc = 41184;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "6.6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title8: RscText
		{
			idc = 41185;
			text = "Endurance";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "7.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value8: RscXSliderH
		{
			idc = 41186;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "7.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title9: RscText
		{
			idc = 41187;
			text = "Courage";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "8.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value9: RscXSliderH
		{
			idc = 41188;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "8.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title10: RscText
		{
			idc = 41189;
			text = "General";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "9.9 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value10: RscXSliderH
		{
			idc = 41190;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "9.9 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayAttributeModuleTFRSpawnLR: RscDisplayAttributeModuleCombo
{
	onSetFocus = "_this call cpm_fnc_InitTFRSpawnLR";
	idc = 41200;
	class controls: controls
	{
		class Title1: Title1
		{
			idc = 41201;
			text = "Spawn Long-Range Radio";
		};
		class Value1: Value1
		{
			idc = 41202;
		};
	};
};
class RscDisplayAttributeModuleTFRSameLR: RscDisplayAttributeModuleCombo
{
	onSetFocus = "_this call cpm_fnc_InitTFRSameLR";
	idc = 41210;
	class controls: controls
	{
		class Title1: Title1
		{
			idc = 41211;
			text = "Same Long-Range for Side";
		};
		class Value1: Value1
		{
			idc = 41212;
		};
	};
};
class RscDisplayAttributeModuleTFRSameSW: RscDisplayAttributeModuleCombo
{
	onSetFocus = "_this call cpm_fnc_InitTFRSameSW";
	idc = 41220;
	class controls: controls
	{
		class Title1: Title1
		{
			idc = 41221;
			text = "Same Short-Range for Side";
		};
		class Value1: Value1
		{
			idc = 41222;
		};
	};
};

class RscDisplayAttributesModuleCuratorPresets
{
	idd = -1;
	movingenable = 0;
	class ControlsBackground{};
	class Controls
	{
		class Background: RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = 30001;
			x = "6.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "27 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "6.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title: RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
			idc = 30002;
			text = "Curator Presets Mod Dialog";
			x = "6.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "8.4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "27 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Content: RscControlsGroup
		{
			idc = 30003;
			x = "7 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "26 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "5.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
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
	onLoad = "['onLoad',_this,'RscDisplayAttributesModuleAirFlight','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	onUnload = "['onUnload',_this,'RscDisplayAttributesModuleAirFlight','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	idd = 42100;
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
				class Control1: RscDisplayAttributeModuleUnitSpeed{};
				class Control2: RscDisplayAttributeModuleVehicleAltitude{};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
class RscDisplayAttributesModuleArtillery: RscDisplayAttributesModuleCuratorPresets
{
	onLoad = "['onLoad',_this,'RscDisplayAttributesModuleArtillery','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	onUnload = "['onUnload',_this,'RscDisplayAttributesModuleArtillery','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	idd = 42110;
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title
		{
			text = "Artillery";
		};
		class Content: Content
		{
			class Controls: controls
			{
				class Control1: RscDisplayAttributeModuleCoordinates{};
				class Control2: RscDisplayAttributeModuleAmmoType{};
				class Control3: RscDisplayAttributeModuleRoundCount{};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
class RscDisplayAttributesModuleDamageComponent: RscDisplayAttributesModuleCuratorPresets
{
	onLoad = "['onLoad',_this,'RscDisplayAttributesModuleDamageComponent','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	onUnload = "['onUnload',_this,'RscDisplayAttributesModuleDamageComponent','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	idd = 42120;
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title
		{
			text = "Damage Component";
		};
		class Content: Content
		{
			class Controls: controls
			{
				class Control1: RscDisplayAttributeModuleUnitComponent{};
				class Control2: RscDisplayAttributeModuleDamageSlider{};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
class RscDisplayAttributesModuleUnitSpeed: RscDisplayAttributesModuleCuratorPresets
{
	onLoad = "['onLoad',_this,'RscDisplayAttributesModuleUnitSpeed','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	onUnload = "['onUnload',_this,'RscDisplayAttributesModuleUnitSpeed','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	idd = 42130;
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title
		{
			text = "Group Speed";
		};
		class Content: Content
		{
			class Controls: controls
			{
				class Control1: RscDisplayAttributeModuleUnitSpeed{};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
class RscDisplayAttributesModuleVehicleDisembark: RscDisplayAttributesModuleCuratorPresets
{
	onLoad = "['onLoad',_this,'RscDisplayAttributesModuleVehicleDisembark','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	onUnload = "['onUnload',_this,'RscDisplayAttributesModuleVehicleDisembark','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	idd = 42140;
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title
		{
			text = "Vehicle Disembark";
		};
		class Content: Content
		{
			class Controls: controls
			{
				class Control1: RscDisplayAttributeModuleVehicleUnits{};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
class RscDisplayAttributesModuleWaypoint: RscDisplayAttributesModuleCuratorPresets
{
	onLoad = "['onLoad',_this,'RscDisplayAttributesModuleWaypoint','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	onUnload = "['onUnload',_this,'RscDisplayAttributesModuleWaypoint','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	idd = 42150;
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title
		{
			text = "Waypoint";
		};
		class Content: Content
		{
			class Controls: controls
			{
				class Control1: RscDisplayAttributeModuleWaypointType{};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
class RscDisplayAttributesModuleUnitAction: RscDisplayAttributesModuleCuratorPresets
{
	onLoad = "['onLoad',_this,'RscDisplayAttributesModuleUnitAction','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	onUnload = "['onUnload',_this,'RscDisplayAttributesModuleUnitAction','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	idd = 42160;
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title
		{
			text = "Unit Action";
		};
		class Content: Content
		{
			class Controls: controls
			{
				class Control1: RscDisplayAttributeModuleUnitAction{};
				class Control2: RscDisplayAttributeModuleAppliesTo{};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
class RscDisplayAttributesModuleUnitAnimation: RscDisplayAttributesModuleCuratorPresets
{
	onLoad = "['onLoad',_this,'RscDisplayAttributesModuleUnitAnimation','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	onUnload = "['onUnload',_this,'RscDisplayAttributesModuleUnitAnimation','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	idd = 42170;
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title
		{
			text = "Unit Animation";
		};
		class Content: Content
		{
			class Controls: controls
			{
				class Control1: RscDisplayAttributeModuleUnitAnimation{};
				class Control2: RscDisplayAttributeModuleAppliesTo{};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
class RscDisplayAttributesModuleUnitChat: RscDisplayAttributesModuleCuratorPresets
{
	onLoad = "['onLoad',_this,'RscDisplayAttributesModuleUnitChat','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	onUnload = "['onUnload',_this,'RscDisplayAttributesModuleUnitChat','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	idd = 42180;
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title
		{
			text = "Unit Chat";
		};
		class Content: Content
		{
			class Controls: controls
			{
				class Control1: RscDisplayAttributeModuleUnitChatChannel{};
				class Control2: RscDisplayAttributeModuleUnitChatText{};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
class RscDisplayAttributesModuleSpawnGarrison: RscDisplayAttributesModuleCuratorPresets
{
	onLoad = "['onLoad',_this,'RscDisplayAttributesModuleSpawnGarrison','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	onUnload = "['onUnload',_this,'RscDisplayAttributesModuleSpawnGarrison','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	idd = 42190;
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title
		{
			text = "Spawn Garrison";
		};
		class Content: Content
		{
			class Controls: controls
			{
				class Control1: RscDisplayAttributeModuleCoordinates{};
				class Control2: RscDisplayAttributeModuleCoordinateRadius{};
				class Control3: RscDisplayAttributeModuleDensitySlider{};
				class Control4: RscDisplayAttributeModuleUnitSide{};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
class RscDisplayAttributesModuleUnitSkills: RscDisplayAttributesModuleCuratorPresets
{
	onLoad = "['onLoad',_this,'RscDisplayAttributesModuleUnitSkills','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	onUnload = "['onUnload',_this,'RscDisplayAttributesModuleUnitSkills','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	idd = 42200;
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title
		{
			text = "Unit Skills";
		};
		class Content: Content
		{
			class Controls: controls
			{
				class Control1: RscDisplayAttributeModuleUnitSkills{};
				class Control2: RscDisplayAttributeModuleAppliesTo{};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
class RscDisplayAttributesModuleCWS: RscDisplayAttributesModuleCuratorPresets
{
	onLoad = "['onLoad',_this,'RscDisplayAttributesModuleCWS','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	onUnload = "['onUnload',_this,'RscDisplayAttributesModuleCWS','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	idd = 42210;
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title
		{
			text = "Chessmaster's Wounding System";
		};
		class Content: Content
		{
			class Controls: controls
			{
				class Control1: RscDisplayAttributeModuleAppliesTo{};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
class RscDisplayAttributesModuleUnitRecruitable: RscDisplayAttributesModuleCuratorPresets
{
	onLoad = "['onLoad',_this,'RscDisplayAttributesModuleUnitRecruitable','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	onUnload = "['onUnload',_this,'RscDisplayAttributesModuleUnitRecruitable','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	idd = 42220;
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title
		{
			text = "Unit Recruitable";
		};
		class Content: Content
		{
			class Controls: controls
			{
				class Control1: RscDisplayAttributeModuleAppliesTo{};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
class RscDisplayAttributesModuleUnitSurrender: RscDisplayAttributesModuleCuratorPresets
{
	onLoad = "['onLoad',_this,'RscDisplayAttributesModuleUnitSurrender','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	onUnload = "['onUnload',_this,'RscDisplayAttributesModuleUnitSurrender','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	idd = 42230;
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title
		{
			text = "Unit Surrender";
		};
		class Content: Content
		{
			class Controls: controls
			{
				class Control1: RscDisplayAttributeModuleAppliesTo{};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
class RscDisplayAttributesModuleTaskForceRadio: RscDisplayAttributesModuleCuratorPresets
{
	onLoad = "['onLoad',_this,'RscDisplayAttributesModuleTaskForceRadio','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	onUnload = "['onUnload',_this,'RscDisplayAttributesModuleTaskForceRadio','CuratorPresetsModDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	idd = 42240;
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title
		{
			text = "Task Force Radio";
		};
		class Content: Content
		{
			class Controls: controls
			{
				class Control1: RscDisplayAttributeModuleTFRSpawnLR{};
				class Control2: RscDisplayAttributeModuleTFRSameLR{};
				class Control3: RscDisplayAttributeModuleTFRSameSW{};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
