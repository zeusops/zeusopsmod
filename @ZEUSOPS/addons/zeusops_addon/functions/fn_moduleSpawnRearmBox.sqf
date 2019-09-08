/*
	@file_name: fn_moduleSpawnRearmBox.sqf
	@file_author: Dyzalonius
*/

_logic = _this param [0,objNull];

_pos = position _logic;

// Find object
_object = _logic call zeusops_fnc_getUnitUnderCursor;

// Spawn rearm box
if (isNull _object) then {
	// Spawn rearm box
	[1, _pos] spawn ZO_fnc_gearBox;
	"Spawned rearm box" call zeusops_fnc_showCuratorMessage;
} else {
	// Make existing object a rearm box
	[3, _object] spawn ZO_fnc_gearBox;
	"Made object a rearm box" call zeusops_fnc_showCuratorMessage;
};

// Delete module
if (count objectcurators _logic > 0) then {
	deletevehicle _logic;
};

true;
