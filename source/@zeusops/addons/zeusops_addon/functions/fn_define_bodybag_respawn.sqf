fn_bodybag_respawn = {
	_type = if (isServer) then { "server" } else { format ["player: %1", name player] };
	format ["[ZOPS] [fn_bodybag_respawn] %1, params: %2", _type, _this joinString ", "] remoteExec ["diag_log", 2];
	_logic = _this param [0,objNull];

	// Exit if module wasn't created by this instance
	if (!local _logic) exitWith {
		"[ZOPS] [fn_bodybag_respawn] exiting: not local" remoteExec ["diag_log", 2];
	};
	if (!(_this select 2)) then {
		"[ZOPS] [fn_bodybag_respawn] DEBUG NOT ACTIVE: module not active, continuing" remoteExec ["diag_log", 2];
	};
	"[ZOPS] [fn_bodybag_respawn] passed checks" remoteExec ["diag_log", 2];

	_pos = position _logic;

	// Find player
	_player = objNull;
	_object = _logic call zeusops_fnc_getUnitUnderCursor;
	if (_object in allPlayers) then {
		_player = _object;
	};

	// Bodybag and respawn if player found
	if (!(isNull _player)) then {
		_player setDamage 1;
		// Wait a bit for the death to register before bagging
		sleep 0.1;
		[objNull, _player] call ace_medical_treatment_fnc_placeInBodyBag;
		[] remoteExec ["zeusops_fnc_respawnPlayer", _player];
		"Bodybagged and respawned player" call zeusops_fnc_showCuratorMessage;
	} else {
		"Module needs to be placed on player" call zeusops_fnc_showCuratorMessage;
	};

	// Delete module
	if (count objectcurators _logic > 0) then {
		deletevehicle _logic;
	};

	true;
};
