/*
	@file_name: fn_moduleToggleRespawn.sqf
	@file_author: Dyzalonius
*/

_logic = _this param [0,objNull];

// Exit if it's not activated (purposefully not quitting when not local, so that all zeuses see the message)
if (!(_this select 2)) exitWith {};

// Toggle respawn
if (missionNameSpace getVariable "respawnAllow") then {
    missionNameSpace setVariable ["respawnAllow", false, true];
	[999999] remoteExec ["setPlayerRespawnTime", allPlayers];
    "Respawn disabled" call zeusops_fnc_showCuratorMessage;
} else {
    missionNameSpace setVariable ["respawnAllow", true, true];
	[900] remoteExec ["setPlayerRespawnTime", allPlayers];
    "Respawn enabled" call zeusops_fnc_showCuratorMessage;
};

// Delete module
if (count objectcurators _logic > 0) then {
	deletevehicle _logic;
};

true;
