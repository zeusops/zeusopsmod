/*
	@file_name: fn_moduleForceRespawnWave.sqf
	@file_author: Dyzalonius
*/

_logic = _this param [0,objNull];

// Exit if module wasn't created by this instance, or if it's not activated
if (!local _logic || !(_this select 2)) exitWith {};

// Force respawn wave
missionNameSpace setVariable ["respawnNextWaveTime", 1, true];
"Forced respawn wave" call zeusops_fnc_showCuratorMessage;

// Delete module
if (count objectcurators _logic > 0) then {
	deletevehicle _logic;
};

true;
