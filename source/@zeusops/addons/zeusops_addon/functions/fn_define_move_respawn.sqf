fn_move_respawn = {
	_type = if (isServer) then { "server" } else { format ["player: %1", name player] };
	format ["[ZOPS] [fn_move_respawn] %1, params: %2", _type, _this joinString ", "] remoteExec ["diag_log", 2];
	_logic = _this param [0,objNull];

	// Exit if module wasn't created by this instance
	if (!local _logic) exitWith {
		"[ZOPS] [fn_move_respawn] exiting: not local" remoteExec ["diag_log", 2];
	};
	if (!(_this select 2)) then {
		"[ZOPS] [fn_move_respawn] DEBUG NOT ACTIVE: module not active, continuing" remoteExec ["diag_log", 2];
	};
	"[ZOPS] [fn_move_respawn] passed checks" remoteExec ["diag_log", 2];

	_pos = getPosASL _logic;

	// Find object
	_object = _logic call zeusops_fnc_getUnitUnderCursor;

	if (isNull _object) then {
		// Move spawn
		missionNameSpace setVariable ["RESPAWN_POSITION", _pos, true];
		"Moved Respawn position" call zeusops_fnc_showCuratorMessage;
	} else {
		// Move spawn to object
		missionNameSpace setVariable ["RESPAWN_POSITION", getPosASL _object, true];
		"Moved Respawn position to object" call zeusops_fnc_showCuratorMessage;
	};

	// Delete module
	if (count objectcurators _logic > 0) then {
		deletevehicle _logic;
	};

	true;
};
