fn_spawn_rearm = {
	_type = if (isServer) then { "server" } else { format ["player: %1", name player] };
	_logic = _this param [0,objNull];
	[_logic, _type] remoteExec ["fn_log_owner", 2];
	format ["[ZOPS] [fn_spawn_rearm] %1, isNull: %2. clientOwner: %3, params: %4", _type, isNull _logic, clientOwner, _this joinString ", "] remoteExec ["diag_log", 2];

	// Exit if module wasn't created by this instance
	if (!local _logic) exitWith {
		"[ZOPS] [fn_spawn_rearm] exiting: not local" remoteExec ["diag_log", 2];
	};
	if (!(_this select 2)) then {
		"[ZOPS] [fn_spawn_rearm] DEBUG NOT ACTIVE: module not active, continuing" remoteExec ["diag_log", 2];
	};
	"[ZOPS] [fn_spawn_rearm] passed checks" remoteExec ["diag_log", 2];

	_pos = position _logic;

	// Find object
	_object = _logic call zeusops_fnc_getUnitUnderCursor;

	// Spawn rearm box
	if (isNull _object) then {
		// Spawn ammobox
		_object = createVehicle ["B_supplyCrate_F", _pos, [], 0, "CAN_COLLIDE"];
		_object setDir (round random 360);

		// Allow zeuses to move the ammobox
		[(getAssignedCuratorLogic player),[[_object],true]] remoteExec ["addCuratorEditableObjects", allCurators, true];

		[3, _object] spawn ZO_fnc_gearBox;
		"Spawned rearm box" call zeusops_fnc_showCuratorMessage;
	} else {
		// Make existing object an rearm box
		[3, _object] spawn ZO_fnc_gearBox;
		"Made object an rearm box" call zeusops_fnc_showCuratorMessage;
	};

	// Delete module
	if (count objectcurators _logic > 0) then {
		deletevehicle _logic;
	};

	true;
};
