/*
	@file_name: fn_moduleMoveRespawnPosition.sqf
	@file_author: Dyzalonius
*/

_logic = _this param [0,objNull];
_pos = position _logic;

// Delete module
if (count objectcurators _logic > 0) then {
	deletevehicle _logic;
};

// Move spawn
missionNameSpace setVariable ["RESPAWN_POSITION", _pos, true];
[objNull, "Moved Respawn position"] call bis_fnc_showCuratorFeedbackMessage;