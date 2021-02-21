fn_toggle_respawn = {
	diag_log format ["[fn_toggle_respawn] params: %1", _this joinString ", "];
	_logic = _this param [0,objNull];

	// Exit if module wasn't created by this instance
	if (!local _logic) exitWith {
		diag_log "[fn_toggle_respawn] exiting: not local";
	};
	if (!(_this select 2)) then {
		diag_log "[fn_toggle_respawn] DEBUG NOT ACTIVE: module not active, continuing";
	};
	diag_log "[fn_toggle_respawn] passed checks";

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
