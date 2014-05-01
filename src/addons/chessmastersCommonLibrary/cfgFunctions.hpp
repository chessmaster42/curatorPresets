class CfgFunctions
{
	createShortcuts = 1;

	class chessmastersCommonLibrary
	{
		tag = "ccl";
		class modules
		{
			file = "\chessmastersCommonLibrary\functions\modules";
			class moduleDummy{};
			class moduleEmpty{};
		};
		class common
		{
			file = "\chessmastersCommonLibrary\functions\common";
			class distance{};
			class getGroupUnderCursor{};
			class getTimestamp{};
			class getUnitUnderCursor{};
			class globalExec{};
			class isZeusCurator{};
			class monitorCuratorDisplay{};
			class showMessage{};
			class waitForCuratorLoad{};
		};
		class ui_init
		{
			file = "\chessmastersCommonLibrary\functions\ui\init";
			class initListBox{};
		};
		class events
		{
			file = "\chessmastersCommonLibrary\functions\events";
			class onModuleTreeLoad{};
		};
	};
};
