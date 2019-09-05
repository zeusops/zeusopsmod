class CfgPatches
{
	class zeusops_addon
	{
		requiredVersion=1;
		author="Zeus Operations";
		authorUrl="https://www.zeusops.com/";
		units[]=
		{
			"zeusops_ModuleBodybagPlayer",
			"zeusops_ModuleMoveRespawnPosition",
			"zeusops_ModuleSpawnArsenalBox",
			"zeusops_ModuleSpawnRearmBox"
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
			class moduleBodybagPlayer
			{
			};
			class moduleMoveRespawnPosition
			{
			};
			class moduleSpawnArsenalBox
			{
			};
			class moduleSpawnRearmBox
			{
			};
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
	class zeusops_ModuleBodybagPlayer: Module_F
	{
		scope=1;
		scopeCurator = 2;
		displayName="Bodybag player";
		category="zeusops_modules";
		function="zeusops_fnc_moduleBodybagPlayer";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
	};
	class zeusops_ModuleMoveRespawnPosition: Module_F
	{
		scope=1;
		scopeCurator = 2;
		displayName="Move respawn position";
		category="zeusops_modules";
		function="zeusops_fnc_moduleMoveRespawnPosition";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
	};
	class zeusops_ModuleSpawnArsenalBox: Module_F
	{
		scope=2;
		scopeCurator = 2;
		displayName="Spawn Arsenal Box";
		category="zeusops_modules";
		function="zeusops_fnc_moduleSpawnArsenalBox";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
	};
	class zeusops_ModuleSpawnRearmBox: Module_F
	{
		scope=2;
		scopeCurator = 2;
		displayName="Spawn Rearm Box";
		category="zeusops_modules";
		function="zeusops_fnc_moduleSpawnRearmBox";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
	};
};