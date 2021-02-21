fn_toggle_respawn = {
	format ["[fn_toggle_respawn] params: %1", _this joinString ", "] remoteExec ["diag_log", 2];
	_logic = _this param [0,objNull];

	// Exit if module wasn't created by this instance
	if (!local _logic) exitWith {
		"[fn_toggle_respawn] exiting: not local" remoteExec ["diag_log", 2];
	};
	if (!(_this select 2)) then {
		"[fn_toggle_respawn] DEBUG NOT ACTIVE: module not active, continuing" remoteExec ["diag_log", 2];
	};
	"[fn_toggle_respawn] passed checks" remoteExec ["diag_log", 2];

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
};
