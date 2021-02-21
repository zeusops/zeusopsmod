/*
	@file_name: fn_getUnitUnderCursor.sqf
	@file_author: Dyzalonius
*/

params ["_logic"];

if !(local _logic) exitWith {
	diag_log "[fn_getUnitUnderCursor] exiting: not local";
};

private _unit = attachedTo _logic;

_unit;
