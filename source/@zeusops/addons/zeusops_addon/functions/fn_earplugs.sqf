/*
	@file_name: fn_earplugs.sqf
	@file_author: Apples & Dyzalonius
*/

////////////////////////////////////////////////
//               SUB-FUNCTIONS                //
////////////////////////////////////////////////

fn_addEarplugsAction = {
    _statement = {
        _earplugsEnabled = player getVariable ["ZO_EarplugsEnabled", false];

        if (!_earplugsEnabled) then {
            systemChat "Earplugs ON";
            [] spawn fn_putInEarplugs;
        }
        else
        {
            systemChat "Earplugs OFF";
            [] spawn fn_takeOutEarplugs;
        };
    };

    _condition = {
        ((player getVariable ["ZO_EarplugsEnabled", false]) || ("ACE_EarPlugs" in (items player)))
    };

    _action = ["Gearplugs", "Toggle Earplugs", "\zeusops_addon\icons\icon_earplugs.paa", _statement, _condition] call ace_interact_menu_fnc_createAction;
    [(typeOf player), 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToClass;
};

fn_addOnDeathReset = {
    player addEventHandler ["Killed", {
	    params ["_unit", "_killer", "_instigator", "_useEffects"];
        [] spawn fn_takeOutEarplugs;
    }];
};

fn_putInEarplugs = {
	player setVariable ["ZO_EarplugsEnabled", true, false];
    player removeItem "ACE_Earplugs";
    0.5 fadeSound 0.25;
};

fn_takeOutEarplugs = {
    player setVariable ["ZO_EarplugsEnabled", false, false];
    player addItem "ACE_Earplugs";
    0.5 fadeSound 1;
};

////////////////////////////////////////////////
//               FUNCTION LOOP                //
////////////////////////////////////////////////

player setVariable ["ZO_EarplugsEnabled", false, false];

[] spawn fn_addEarplugsAction;
[] spawn fn_addOnDeathReset;
