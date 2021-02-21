fn_force_respawn = {
	diag_log format ["[fn_force_respawn] params: %1", _this joinString ", "];
	_logic = _this param [0,objNull];

	// Exit if module wasn't created by this instance
	if (!local _logic) exitWith {
		diag_log "[fn_force_respawn] exiting: not local";
	};
	if (!(_this select 2)) then {
		diag_log "[fn_force_respawn] DEBUG NOT ACTIVE: module not active, continuing";
	};
	diag_log "[fn_force_respawn] passed checks";

	// Force respawn wave
	missionNameSpace setVariable ["respawnNextWaveTime", 1, true];
	"Forced respawn wave" call zeusops_fnc_showCuratorMessage;

	// Delete module
	if (count objectcurators _logic > 0) then {
		deletevehicle _logic;
	};

	true;
};
