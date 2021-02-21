fn_spawn_arsenal = {
	_type = if (isServer) then { "server" } else { format ["player: %1", name player] };
	format ["[fn_spawn_arsenal] %1, params: %2", _type, _this joinString ", "] remoteExec ["diag_log", 2];
	_logic = _this param [0,objNull];

	// Exit if module wasn't created by this instance
	if (!local _logic) exitWith {
		"[fn_spawn_arsenal] exiting: not local" remoteExec ["diag_log", 2];
	};
	if (!(_this select 2)) then {
		"[fn_spawn_arsenal] DEBUG NOT ACTIVE: module not active, continuing" remoteExec ["diag_log", 2];
	};
	"[fn_spawn_arsenal] passed checks" remoteExec ["diag_log", 2];

	_pos = position _logic;

	// Find object
	_object = _logic call zeusops_fnc_getUnitUnderCursor;

	// Spawn arsenal box
	if (isNull _object) then {
		// Spawn ammobox
		_object = createVehicle ["B_supplyCrate_F", _pos, [], 0, "CAN_COLLIDE"];
		_object setDir (round random 360);

		// Allow zeuses to move the ammobox
		[(getAssignedCuratorLogic player),[[_object],true]] remoteExec ["addCuratorEditableObjects", allCurators, true];

		[2, _object] spawn ZO_fnc_gearBox;
		"Spawned arsenal box" call zeusops_fnc_showCuratorMessage;
	} else {
		// Make existing object an arsenal box
		[2, _object] spawn ZO_fnc_gearBox;
		"Made object an arsenal box" call zeusops_fnc_showCuratorMessage;
	};

	// Delete module
	if (count objectcurators _logic > 0) then {
		deletevehicle _logic;
	};

	true;
};
