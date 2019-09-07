/*
	@file_name: fn_moduleBodybagAndRespawnPlayer.sqf
	@file_author: Dyzalonius
*/

_logic = _this param [0,objNull];
_pos = position _logic;

// Delete module
if (count objectcurators _logic > 0) then {
	deletevehicle _logic;
};

// Find player
_player = objNull;
_playerDistance = 2; // bigger than 1
{
	_distance = _pos distance _x;
	if ((_distance < 1) && (_distance < _playerDistance)) then {
		_player = _x;
		_playerDistance = _distance;
	};
} foreach allPlayers;

// Exit if no player
if (isNull _player) exitWith {
	"Module needs to be placed on player" call zeusops_fnc_showCuratorMessage;
};

// Bodybag and respawn player
[objNull, _player] call ace_medical_fnc_actionPlaceInBodyBag;
[] remoteExec ["zeusops_fnc_respawnPlayer", _player];
"Bodybagged and respawned player" call zeusops_fnc_showCuratorMessage;
