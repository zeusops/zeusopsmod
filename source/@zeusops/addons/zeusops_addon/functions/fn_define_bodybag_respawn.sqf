fn_bodybag_respawn = {
	diag_log format ["[fn_bodybag_respawn] params: %1", _this joinString ", "];
	_logic = _this param [0,objNull];

	// Exit if module wasn't created by this instance
	if (!local _logic) exitWith {
		diag_log "[fn_bodybag_respawn] exiting: not local";
	};
	if (!(_this select 2)) then {
		diag_log "[fn_bodybag_respawn] DEBUG NOT ACTIVE: module not active, continuing";
	};
	diag_log "[fn_bodybag_respawn] passed checks";

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
		[objNull, _player] call ace_medical_fnc_actionPlaceInBodyBag;
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
