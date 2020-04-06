/*
	@file_name: fn_moduleSpawnFortificationBoxLarge.sqf
	@file_author: Dyzalonius
*/

_logic = _this param [0,objNull];

// Exit if module wasn't created by this instance, or if it's not activated
if (!local _logic || !(_this select 2)) exitWith {};

_pos = position _logic;

// Find object
_object = _logic call zeusops_fnc_getUnitUnderCursor;

// Spawn large fortification box
if (isNull _object) then {
	[1, _pos] spawn ZO_fnc_fortificationBox;
	"Spawned large fortification box" call zeusops_fnc_showCuratorMessage;
} else {
	// Make existing object a fortification box
	[3, _object] spawn ZO_fnc_fortificationBox;
	"Made object a small fortification box" call zeusops_fnc_showCuratorMessage;
};

// Delete module
if (count objectcurators _logic > 0) then {
	deletevehicle _logic;
};

true;
