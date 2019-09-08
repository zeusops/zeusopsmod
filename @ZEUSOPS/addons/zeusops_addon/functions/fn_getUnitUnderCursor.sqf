/*
	@file_name: fn_getUnitUnderCursor.sqf
	@file_author: Dyzalonius
*/

_curatorMouseOver = zeusops_curatorMouseOver;

_unitUnderCursor = objNull;
if (count _curatorMouseOver == 2) then {
	_unitUnderCursor = (_curatorMouseOver select 1);
};

systemChat format ["%1", _unitUnderCursor]; // DEBUG

_unitUnderCursor;
