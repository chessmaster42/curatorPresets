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
class chessmastersCommonLibrary_ModuleBase: Module_F
{
	mapSize = 1;
	author = "Chessmaster42";
	vehicleClass = "Modules";
	category = "ChessmastersCommonLibrary";
	subCategory = "Common";
	side = 7;

	scope = 1;
	scopeCurator = 1;

	displayName = "CCL Module Base";
	icon = "\chessmastersCommonLibrary\data\icon_ca.paa";
	picture = "\chessmastersCommonLibrary\data\icon_ca.paa";
	portrait = "\chessmastersCommonLibrary\data\icon_ca.paa";

	function = "";
	functionPriority = 1;
	isGlobal = 2;
	isTriggerActivated = 0;
	isDisposable = 0;

	class Arguments{};
	class ModuleDescription: ModuleDescription
	{
		description = "CCL Module Base";
	};
};
class chessmastersCommonLibrary_ModuleEmpty: chessmastersCommonLibrary_ModuleBase
{
	mapSize = 0;
	category = "Curator";
	subCategory = "";
	icon = "";

	displayName = "";
	function = "ccl_fnc_ModuleEmpty";
	scopeCurator = 1;
};
