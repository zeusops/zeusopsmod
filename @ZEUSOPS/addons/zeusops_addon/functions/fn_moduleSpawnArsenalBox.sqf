/*
	@file_name: fn_moduleSpawnArsenalBox.sqf
	@file_author: Dyzalonius
*/

_logic = _this param [0,objNull];

_pos = position _logic;

// Find object
_object = _logic call zeusops_fnc_getUnitUnderCursor;

// Spawn arsenal box
if (isNull _object) then {
	// Spawn arsenal box
	[0, _pos] spawn ZO_fnc_gearBox;
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
