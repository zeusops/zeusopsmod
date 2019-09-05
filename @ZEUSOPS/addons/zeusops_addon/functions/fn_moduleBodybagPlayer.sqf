/*
	@file_name: fn_moduleBodyBagPlayer.sqf
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
	[objNull, "Module needs to be placed on player"] call bis_fnc_showCuratorFeedbackMessage;
};

// Bodybag player
[objNull, _player] call ace_medical_fnc_actionPlaceInBodyBag;
[objNull, "Bodybagged Player"] call bis_fnc_showCuratorFeedbackMessage;