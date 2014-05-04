class CfgFunctions
{
	createShortcuts = 1;

	class curatorPresets
	{
		tag = "cpm";
		class init
		{
			file = "\curatorPresets_Module\functions\init";
			class initCPM{preInit = 1;};
			class initCPMEvents{preInit = 1;};
			class initCPMGUI{preInit = 1;};
		};
		class modules
		{
			file = "\curatorPresets_Module\functions\modules";
			class moduleAirFlight{};
			class moduleArtillery{};
			class moduleConfig{};
			class moduleDamageComponent{};
			class moduleFailsafeReload{};
			class moduleSpawnGarrison{};
			class moduleUnitAction{};
			class moduleUnitAnimation{};
			class moduleUnitChat{};
			class moduleUnitRecruitable{};
			class moduleUnitSkills{};
			class moduleUnitSurrender{};
			class moduleUnitTeleport{};
			class moduleVAS{};
			class moduleVehicleDisembark{};
		};
		class common
		{
			file = "\curatorPresets_Module\functions\common";
			class addWaypoint{};
			class drawCWSIcons{};
			class moveGroupThroughBuilding{};
			class moveUnitThroughBuilding{};
			class setupDisplayHandlers{};
			class spawnGarrison{};
			class removeWaypoint{};
		};
		class loaders
		{
			file = "\curatorPresets_Module\functions\loaders";
			class loadDamageComponent{};
			class loadRecruitable{};
			class loadUnitAction{};
			class loadUnitChat{};
			class loadUnitSurrender{};
			class loadVAS{};
		};
		class ui_init
		{
			file = "\curatorPresets_Module\functions\ui\init";
			class initAmmoType{};
			class initAppliesTo{};
			class initCoordinates{};
			class initCoordinateRadius{};
			class initDamageSlider{};
			class initDensitySlider{};
			class initRoundCount{};
			class initTFRSameLR{};
			class initTFRSameSW{};
			class initTFRSpawnLR{};
			class initUnitAction{};
			class initUnitAnimation{};
			class initUnitChatChannel{};
			class initUnitChatText{};
			class initUnitComponent{};
			class initUnitSide{};
			class initUnitSkills{};
			class initUnitSpeed{};
			class initVehicleAltitude{};
			class initVehicleUnits{};
			class initWaypointType{};
		};
		class events
		{
			file = "\curatorPresets_Module\functions\events";
			class onGroupSelectionChanged{};
			class onKeyDown{};
			class onMouseButtonClick{};
			class onWaypointEdited{};
			class onWaypointPlaced{};
			class onWaypointSelectionChanged{};
		};
	};
};
