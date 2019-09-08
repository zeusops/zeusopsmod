/*
	@file_name: fn_handleCuratorObjectPlaced.sqf
	@file_author: Dyzalonius
*/

#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

disableSerialization;
params ["_curator","_placedObject"];

// fix module activation bug for copy/paste
if (_placedObject isKindOf "Module_f") then
{
	_placedObject setVariable ["BIS_fnc_initModules_activate", true, true];
};

if (local _placedObject) then
{
	zeusops_curatorMouseOver = curatorMouseOver;
};
