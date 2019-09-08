/*
	@file_name: fn_onDisplayCuratorLoad.sqf
	@file_author: Dyzalonius
*/

#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

if (isNil "zeusops_curator_init_done") then
{
    private _curatorModule = getassignedcuratorLogic player;
    _curatorModule addEventHandler ["CuratorObjectPlaced", { _this call Achilles_fnc_HandleCuratorObjectPlaced; }];

	zeusops_curator_init_done = true;
};
