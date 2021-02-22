#include "initSettings.sqf"

// Define functions here early before Athena has a chance to define them
fnc_gatherGroups     = compileFinal preprocessFileLineNumbers "\zeusops_addon\athena\gatherGroups.sqf";
fnc_gatherUnits      = compileFinal preprocessFileLineNumbers "\zeusops_addon\athena\gatherUnits.sqf";
fnc_gatherVehicles   = compileFinal preprocessFileLineNumbers "\zeusops_addon\athena\gatherVehicles.sqf";

[] call zeusops_fnc_define_bodybag_player;
[] call zeusops_fnc_define_bodybag_respawn;
[] call zeusops_fnc_define_force_respawn;
[] call zeusops_fnc_define_move_respawn;
[] call zeusops_fnc_define_spawn_arsenal;
[] call zeusops_fnc_define_spawn_rearm;
[] call zeusops_fnc_define_toggle_respawn;
