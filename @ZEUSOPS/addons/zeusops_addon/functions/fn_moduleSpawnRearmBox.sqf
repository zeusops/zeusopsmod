/*
	@file_name: fn_moduleSpawnRearmBox.sqf
	@file_author: Dyzalonius
*/

_logic = _this param [0,objNull];
_pos = position _logic;

// Delete module
if (count objectcurators _logic > 0) then {
	deletevehicle _logic;
};

// Find object
_object = objNull;
_objectDistance = 3; // bigger than 2
_objects = (_pos nearEntities 2);
_objects resize (count _objects - 1); // no idea what the last object in the array is, maybe cursor of curator.
{
	_distance = _pos distance _x;
	if (_distance < _objectDistance) then {
		_object = _x;
		_objectDistance = _distance;
	};
} foreach _objects;

systemChat format ["%1 - %2", _objects, _object];

// Spawn rearm box
if (isNull _object) then {
	// Spawn rearm box
	[1, _pos] spawn ZO_fnc_gearBox;
	[objNull, "Spawned Rearm Box"] call bis_fnc_showCuratorFeedbackMessage;
} else {
	// Make existing object a rearm box
	[3, _object] spawn ZO_fnc_gearBox;
	[objNull, "Spawned Rearm Box"] call bis_fnc_showCuratorFeedbackMessage;
};