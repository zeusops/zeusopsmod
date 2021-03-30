fn_bodybag_player = {
	_type = if (isServer) then { "server" } else { format ["player: %1", name player] };
	_logic = _this param [0,objNull];
	[_logic, _type] remoteExec ["fn_log_owner", 2];
	format ["[ZOPS] [fn_bodybag_player] %1, isNull: %2. clientOwner: %3, params: %4", _type, isNull _logic, clientOwner, _this joinString ", "] remoteExec ["diag_log", 2];

	// Exit if module wasn't created by this instance
	if (!local _logic) exitWith {
		"[ZOPS] [fn_bodybag_player] exiting: not local" remoteExec ["diag_log", 2];
	};
	if (!(_this select 2)) then {
		"[ZOPS] [fn_bodybag_player] DEBUG NOT ACTIVE: module not active, continuing" remoteExec ["diag_log", 2];
	};
	"[ZOPS] [fn_bodybag_player] passed checks" remoteExec ["diag_log", 2];

	// Find player
	_player = objNull;
	_object = _logic call zeusops_fnc_getUnitUnderCursor;
	if (_object in allPlayers) then {
		_player = _object;
	};

	// Bodybag if player is found
	if (!(isNull _player)) then {
		_player setDamage 1;
		// Wait a bit for the death to register before bagging
		sleep 0.1;
		[objNull, _player] call ace_medical_treatment_fnc_placeInBodyBag;
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
