class CfgFunctions
{
	createShortcuts = 1;

	class cws_injury
	{
		tag = "cws";
		class init
		{
			file = "\cws_injury\functions\init";
			class initCWS{preInit = 1;};
			class initCWSGUI{preInit = 1;};
		};
		class modules
		{
			file = "\cws_injury\functions\modules";
			class moduleCWSLoad{};
			class moduleFailsafeReload{};
			class moduleRevive{};
		};
		class loaders
		{
			file = "\cws_injury\functions\loaders";
			class loadCWS{};
			class loadUnitChat{};
		};
		class ui_init
		{
			file = "\cws_injury\functions\ui\init";
			class initAppliesTo{};
			class initConfigCheckboxes{};
			class initConfigSliders{};
			class initEnableDebugging{};
		};
		class cws
		{
			file = "\cws_injury\functions\cws";
			class handleDamage{};
			class keyUnbind{};
			class firstAid{};
			class isHealable{};
			class progressBar{};
			class isMedic{};
			class drag{};
			class carry{};
			class drop{};
			class injuredEffects{};
			class progressBarInit{};
			class sendAIHealer{};
			class delbody{};
			class quote{};
			class deadcam{};
			class lookingForWoundedMates{};
			class checklauncher{};
			class setUnitDamage{};
			class getUnitDamage{};
			class cleanUpActions{};
			class handleHeal{};
			class handleKeys{};
			class setupActions{};
			class setupUnitVariables{};
			class setHealer{};
			class reviveUnit{};
			class canHeal{};
			class setHealingProgress{};
		};
	};
};
