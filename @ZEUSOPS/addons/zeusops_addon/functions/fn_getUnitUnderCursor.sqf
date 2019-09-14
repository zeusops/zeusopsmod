/*
	@file_name: fn_getUnitUnderCursor.sqf
	@file_author: Dyzalonius
*/

_curatorMouseOver = Ares_CuratorObjectPlaced_UnitUnderCursor;

_unitUnderCursor = objNull;
if (count _curatorMouseOver == 2) then {
	_unitUnderCursor = (_curatorMouseOver select 1);
};

_unitUnderCursor;
