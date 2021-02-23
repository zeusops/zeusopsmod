fn_force_respawn = {
	_type = if (isServer) then { "server" } else { format ["player: %1", name player] };
	format ["[ZOPS] [fn_spawn_arsenal] %1, params: %2", _type, _this joinString ", "] remoteExec ["diag_log", 2];
	_logic = _this param [0,objNull];

	// Exit if module wasn't created by this instance
	if (!local _logic) exitWith {
		"[ZOPS] [fn_force_respawn] exiting: not local" remoteExec ["diag_log", 2];
	};
	if (!(_this select 2)) then {
		"[ZOPS] [fn_force_respawn] DEBUG NOT ACTIVE: module not active, continuing" remoteExec ["diag_log", 2];
	};
	"[ZOPS] [fn_force_respawn] passed checks" remoteExec ["diag_log", 2];

	// Force respawn wave
	missionNameSpace setVariable ["respawnNextWaveTime", 1, true];
	"Forced respawn wave" call zeusops_fnc_showCuratorMessage;

	// Delete module
	if (count objectcurators _logic > 0) then {
		deletevehicle _logic;
	};

	true;
};
