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
class RscMapControl;
class RscText;
class RscXSliderH;

class RscDisplayAttributeModule;
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
