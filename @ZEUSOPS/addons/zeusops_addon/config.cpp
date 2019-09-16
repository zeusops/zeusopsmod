class CfgPatches
{
	class zeusops_addon
	{
		requiredVersion=1;
		author="Zeus Operations";
		authorUrl="https://www.zeusops.com/";
		units[]=
		{
			"zeusops_ModuleBodybagAndRespawnPlayer",
			"zeusops_ModuleBodybagPlayer",
			"zeusops_ModuleForceRespawnWave",
			"zeusops_ModuleMoveRespawnPosition",
			"zeusops_ModuleSpawnArsenalBox",
			"zeusops_ModuleSpawnRearmBox",
			"zeusops_ModuleToggleRespawn"
		};
		requiredAddons[]=
		{
			"A3_Modules_F",
			"A3_Modules_F_Curator"
		};
	};
};
class CfgFunctions
{
	class zeusops
	{
		class functions
		{
			file="\zeusops_addon\functions";
			class getUnitUnderCursor;
			class moduleBodybagAndRespawnPlayer;
			class moduleBodybagPlayer;
			class moduleForceRespawnWave;
			class moduleMoveRespawnPosition;
			class moduleSpawnArsenalBox;
			class moduleSpawnRearmBox;
			class moduleToggleRespawn;
			class respawnPlayer;
			class showCuratorMessage;
		};
	};
};
class CfgFactionClasses
{
	class zeusops_modules
	{
		displayName="Zeusops";
	};
};
class CfgVehicles
{
	class Logic;
	class Module_F: Logic {};
	class zeusops_ModuleBase : Module_F
	{
		category="zeusops_modules";
		scope=1; // not visible in editor
		scopeCurator = 2; // visible in zeus
		isGlobal=2; // ran globally
		functionPriority=1;
		isTriggerActivated=0;
		isDisposable=1;
		is3DEN=0;
	};
	class zeusops_ModuleBodybagAndRespawnPlayer: zeusops_ModuleBase
	{
		displayName="Bodybag & respawn player";
		function="zeusops_fnc_moduleBodybagAndRespawnPlayer";
	};
	class zeusops_ModuleBodybagPlayer: zeusops_ModuleBase
	{
		displayName="Bodybag player";
		function="zeusops_fnc_moduleBodybagPlayer";
	};
	class zeusops_ModuleForceRespawnWave: zeusops_ModuleBase
	{
		displayName="Force respawn wave";
		function="zeusops_fnc_moduleForceRespawnWave";
	};
	class zeusops_ModuleMoveRespawnPosition: zeusops_ModuleBase
	{
		displayName="Move respawn position";
		function="zeusops_fnc_moduleMoveRespawnPosition";
	};
	class zeusops_ModuleSpawnArsenalBox: zeusops_ModuleBase
	{
		displayName="Spawn Arsenal Box";
		function="zeusops_fnc_moduleSpawnArsenalBox";
		scope=2; // visible in editor
	};
	class zeusops_ModuleSpawnRearmBox: zeusops_ModuleBase
	{
		displayName="Spawn Rearm Box";
		function="zeusops_fnc_moduleSpawnRearmBox";
		scope=2; // visible in editor
	};
	class zeusops_ModuleToggleRespawn: zeusops_ModuleBase
	{
		displayName="Toggle respawn";
		function="zeusops_fnc_moduleToggleRespawn";
	};
};
