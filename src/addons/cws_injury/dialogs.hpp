class CfgScriptPaths
{
	ChessmastersWoundingSystemDisplays = "\cws_injury\functions\ui\displays\";
};

class RscButtonMenuOK;
class RscButtonMenuCancel;
class RscCombo;
class RscControlsGroup;
class RscControlsGroupNoScrollbars;
class RscEdit;
class RscListBox;
class RscCheckBox;
class RscMapControl;
class RscText;
class RscXSliderH;

class RscDisplayAttributeModule: RscControlsGroupNoScrollbars
{
	class controls{};
};
class RscDisplayAttributeModuleCombo: RscDisplayAttributeModule
{
	class controls
	{
		class Title1: RscText{};
		class Value1: RscCombo{};
	};
};

class RscDisplayAttributeModuleCWSEnableDebugging: RscDisplayAttributeModuleCombo
{
	onSetFocus = "_this call cws_fnc_InitEnableDebugging";
	idc = 43010;
	class controls: controls
	{
		class Title1: Title1
		{
			idc = 43011;
			text = "Enable Debugging";
		};
		class Value1: Value1
		{
			idc = 43012;
		};
	};
};
class RscDisplayAttributeModuleCWSAppliesTo: RscDisplayAttributeModuleCombo
{
	onSetFocus = "_this call cws_fnc_InitAppliesTo";
	idc = 43020;
	class controls: controls
	{
		class Title1: Title1
		{
			idc = 43021;
			text = "Applies To";
		};
		class Value1: Value1
		{
			idc = 43022;
		};
	};
};
class RscDisplayAttributeModuleCWSConfigCheckboxes: RscDisplayAttributeModule
{
	onSetFocus = "_this call cws_fnc_InitConfigCheckboxes";
	idc = 43030;
	h = "7.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controls: controls
	{
		class Title1: RscText
		{
			idc = 43031;
			text = "Revive Guaranty";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value1: RscCheckBox
		{
			idc = 43032;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title2: RscText
		{
			idc = 43033;
			text = "Enable Medic Self-Revive";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "1.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value2: RscCheckBox
		{
			idc = 43034;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "1.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title3: RscText
		{
			idc = 43035;
			text = "Show Injury Map Marker";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "2.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value3: RscCheckBox
		{
			idc = 43036;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "2.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title4: RscText
		{
			idc = 43037;
			text = "Show Injury Message";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "3.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value4: RscCheckBox
		{
			idc = 43038;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "3.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title5: RscText
		{
			idc = 43039;
			text = "Show Injury 3D Icons";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "4.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value5: RscCheckBox
		{
			idc = 43040;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "4.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title6: RscText
		{
			idc = 43041;
			text = "Enable Death Dialog";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "5.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value6: RscCheckBox
		{
			idc = 43042;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "5.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
class RscDisplayAttributeModuleCWSConfigSliders: RscDisplayAttributeModule
{
	onSetFocus = "_this call cws_fnc_InitConfigSliders";
	idc = 43050;
	h = "7.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controls: controls
	{
		class Title1: RscText
		{
			idc = 43051;
			text = "Rambo Factor";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value1: RscXSliderH
		{
			onSliderPosChanged = "(_this select 0) ctrlSetTooltip str(sliderPosition (_this select 0))";
			idc = 43052;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title2: RscText
		{
			idc = 43053;
			text = "Random Bleed Time Factor";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "1.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value2: RscXSliderH
		{
			onSliderPosChanged = "(_this select 0) ctrlSetTooltip str(sliderPosition (_this select 0))";
			idc = 43054;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "1.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title3: RscText
		{
			idc = 43055;
			text = "3D Icon Range";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "2.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value3: RscXSliderH
		{
			onSliderPosChanged = "(_this select 0) ctrlSetTooltip str(sliderPosition (_this select 0))";
			idc = 43056;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "2.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title4: RscText
		{
			idc = 43057;
			text = "Body Cleanup Time";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "3.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value4: RscXSliderH
		{
			onSliderPosChanged = "(_this select 0) ctrlSetTooltip str(sliderPosition (_this select 0))";
			idc = 43058;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "3.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title5: RscText
		{
			idc = 43059;
			text = "FirstAid Distance";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "4.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value5: RscXSliderH
		{
			onSliderPosChanged = "(_this select 0) ctrlSetTooltip str(sliderPosition (_this select 0))";
			idc = 43060;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "4.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Title6: RscText
		{
			idc = 43061;
			text = "Damage Limit";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "5.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value6: RscXSliderH
		{
			onSliderPosChanged = "(_this select 0) ctrlSetTooltip str(sliderPosition (_this select 0))";
			idc = 43062;
			x = "10.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "5.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};

class RscDisplayAttributesModuleChessmastersCommonLibraryBase
{
	class Controls
	{
		class Background: RscText{};
		class Title: RscText{};
		class Content: RscControlsGroup
		{
			class controls{};
		};
		class ButtonOK: RscButtonMenuOK{};
		class ButtonCancel: RscButtonMenuCancel{};
	};
};

class RscDisplayAttributesModuleCWSConfig: RscDisplayAttributesModuleChessmastersCommonLibraryBase
{
	onLoad = "['onLoad',_this,'RscDisplayAttributesModuleCWSConfig','ChessmastersWoundingSystemDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	onUnload = "['onUnload',_this,'RscDisplayAttributesModuleCWSConfig','ChessmastersWoundingSystemDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	idd = 44100;
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title
		{
			text = "CWS Config";
		};
		class Content: Content
		{
			class Controls: controls
			{
				class Control1: RscDisplayAttributeModuleCWSEnableDebugging{};
				class Control2: RscDisplayAttributeModuleCWSConfigCheckboxes{};
				class Control3: RscDisplayAttributeModuleCWSConfigSliders{};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
class RscDisplayAttributesModuleCWS: RscDisplayAttributesModuleChessmastersCommonLibraryBase
{
	onLoad = "['onLoad',_this,'RscDisplayAttributesModuleCWS','ChessmastersWoundingSystemDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	onUnload = "['onUnload',_this,'RscDisplayAttributesModuleCWS','ChessmastersWoundingSystemDisplays'] call compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'";
	idd = 44110;
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title
		{
			text = "Load CWS";
		};
		class Content: Content
		{
			class Controls: controls
			{
				class Control1: RscDisplayAttributeModuleCWSAppliesTo{};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};

class RscTitles
{
	class RscDeadQuote {
		onload = "uinamespace setvariable ['cws_title',_this select 0];";
		idd = 1792;
		movingEnable = false;
		moving = false;
		duration=10e10;
		enableSimulation = true;
		controlsBackground[] = {};
		objects[] = {};
		controls[] = {QuoteStructuredText,HeaderDeath};

		class HeaderDeath {
			idc = -1;
			type = 13;
			style = 0x00;
			colorBackground[] = {1, 1, 1, 0};
			colorText[] = {1, 0.0, 0.0, 1};
			x = safezoneX + 0.3 * safezoneW;
			y = safezoneY + 0.045 * safezoneW;
			w = 1;
			h = 0.6;
			size = 0.08;
			text = "You are dead.";
			class Attributes {
				font = "PuristaMedium";
				color = "#CC0000";
				align = "center";
				valign = "middle";
				shadow = false;
				shadowColor = "#ff0000";
				size = "1.6";
			};
		};
		class QuoteStructuredText {
			idc = 1793;
			type = 13;
			style = 0x00;
			colorBackground[] = { 1, 1, 1, 0 };
			colorText[] = {1,1,1,1};
			x = safezoneX + 0.3 * safezoneW;
			y = safezoneY + 0.67 * safezoneW;
			w = 1;
			h = 0.6;
			size = 0.02;
			text = "";
			class Attributes {
				font = "PuristaMedium";
				color = "#000000";
				align = "center";
				valign = "middle";
				shadow = false;
				shadowColor = "#ff0000";
				size = "1.6";
			};
		};
	};

	class ais_ProgressBar {
		idd = -1;
		movingEnable = 0;
		objects[] = {};
		duration = 1e+011;
		name = "ais_ProgressBar";
		onload = "_this call cws_fnc_progressBarInit;";

		class controlsBackground {
			class mpsf_progressbar_background {
				idc = 0;
				x = "0.298906 * safezoneW + safezoneX";
				y = "0.082 * safezoneH + safezoneY";
				w = "0.407344 * safezoneW";
				h = "0.011 * safezoneH";
				type = 0;
				style = 0;
				shadow = 0;
				colorShadow[] = {0,0,0,0.5};
				font = "PuristaMedium";
				SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
				text = "";
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,0.7};
				linespacing = 1;
			};
		};
		class controls {
			class mpsf_progressbar_foreground {
				idc = 1;
				x = "0.298906 * safezoneW + safezoneX";
				y = "0.082 * safezoneH + safezoneY";
				w = "0.001 * safezoneW";
				h = "0.011 * safezoneH";
				type = 0;
				style = 0;
				shadow = 0;
				colorShadow[] = {0,0,0,0.5};
				font = "PuristaMedium";
				SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
				text = "";
				colorText[] = {1,1,1,1};
				colorBackground[] = {0.6784, 0.7490, 0.5137, 0.7};
				linespacing = 1;
			};
			class mpsf_progressbar_text {
				idc = 2;
				type = 13;
				style = 0x00;
				colorBackground[] = {0,0,0,0};
				x = "0.298906 * safezoneW + safezoneX";
				y = "0.093 * safezoneH + safezoneY";
				w = "0.407344 * safezoneW";
				h = "0.022 * safezoneH";
				text = "";
				size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
				colorText[] = {0, 0, 0, 1};
				class Attributes {
					font = "EtelkaMonospaceProBold";
					color = "#FFFFFF";
					align = "left";
					valign = "middle";
					shadow = 1;
					shadowColor = "#000000";
					//size = "2.25";
				};
			};
		};
	};
};
