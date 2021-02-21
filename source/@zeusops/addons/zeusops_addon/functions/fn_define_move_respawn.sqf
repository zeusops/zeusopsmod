fn_move_respawn = {
	diag_log format ["[fn_move_respawn] params: %1", _this joinString ", "];
	_logic = _this param [0,objNull];

	// Exit if module wasn't created by this instance
	if (!local _logic) exitWith {
		diag_log "[fn_move_respawn] exiting: not local";
	};
	if (!(_this select 2)) then {
		diag_log "[fn_move_respawn] DEBUG NOT ACTIVE: module not active, continuing";
	};
	diag_log "[fn_move_respawn] passed checks";

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
