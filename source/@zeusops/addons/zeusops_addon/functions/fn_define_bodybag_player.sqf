fn_bodybag_player = {
	_type = if (isServer) then { "server" } else { format ["player: %1", name player] };
	format ["[fn_spawn_arsenal] %1, params: %2", _type, _this joinString ", "] remoteExec ["diag_log", 2];
	_logic = _this param [0,objNull];

	// Exit if module wasn't created by this instance
	if (!local _logic) exitWith {
		"[fn_bodybag_player] exiting: not local" remoteExec ["diag_log", 2];
	};
	if (!(_this select 2)) then {
		"[fn_bodybag_player] DEBUG NOT ACTIVE: module not active, continuing" remoteExec ["diag_log", 2];
	};
	"[fn_bodybag_player] passed checks" remoteExec ["diag_log", 2];

	// Find player
	_player = objNull;
	_object = _logic call zeusops_fnc_getUnitUnderCursor;
	if (_object in allPlayers) then {
		_player = _object;
	};

	// Bodybag if player is found
	if (!(isNull _player)) then {
		_player setDamage 1;
		[objNull, _player] call ace_medical_fnc_actionPlaceInBodyBag;
		"Bodybagged player" call zeusops_fnc_showCuratorMessage;
	} else {
		"Module needs to be placed on player" call zeusops_fnc_showCuratorMessage;
	};

	// Delete module
	if (count objectcurators _logic > 0) then {
		deletevehicle _logic;
	};

	true;
};
