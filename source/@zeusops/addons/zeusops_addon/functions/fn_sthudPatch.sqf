STHud_IsMedic = {
    params ["_unit"];
    (_unit getVariable ["Ace_medical_medicClass", 0]) >= 1;
};

STHud_IsEngineer = {
    params ["_unit"];
    _isEngineer = _unit getVariable ["Ace_IsEngineer", 0];
    if (_isEngineer isEqualType false) then {
        _isEngineer = [0, 1] select _isEngineer;
    };

    _isEngineer >= 1;
};

STHud_IsAT = {
    params ["_type"];
    _has_at = getText(configFile >> "CfgWeapons" >> _type >>
        "UIPicture") == "\a3\weapons_f\data\ui\icon_at_ca.paa";
    if (_has_at) exitWith {
        _has_rhs =
        if (getNumber(configfile >> "CfgWeapons" >> _type >>
                "rhs_disposable") == 1) exitWith {
            false;
        };
        if (!isNil {
                (configfile >> "CfgWeapons" >> _type >> "UK3CB_used_launcher")
                call BIS_fnc_getCfgData;}) exitWith {
            false;
        };
        if (!isNil {(configfile >> "CfgWeapons" >> _type >> "EventHandlers"
                >> "fired") call BIS_fnc_getCfgData;}) exitWith {
            false;
        };
        // Has a reloadable AT launcher
        true;
    };
    // No AT launcher
    false;
};

STHud_IsMarksman = {
    params ["_unit"];
    scopeClassname = (primaryWeaponItems _unit) select 2;
    if (scopeClassname == "") exitWith { false; };

    // Fetch scope magnifications
    magnifications = [];
    for "_i" from 0 to count (configFile >> "CfgWeapons" >> scopeClassname
            >> "ItemInfo" >> "OpticsModes") -1 do {
        scope = (configFile >> "CfgWeapons" >> scopeClassname
            >> "ItemInfo" >> "OpticsModes") select _i;
        magnification = getNumber(scope >> "opticsZoomMin");
        magnifications pushBack magnification;
    };

    (selectMin magnifications) < 0.066;
};

STHud_IsGrenadier = {
    params ["_unit"];
    muzzleCount = count getArray(configfile >> "CfgWeapons" >>
        (primaryWeapon _unit) >> "muzzles");
    muzzleCount > 1;
};

STHud_Icon_Real = STHud_Icon;

STHud_Icon = {
    params [
        "_unit",
        ["_disableVehicleIcons", true]
    ];

    _icon = [_unit, _disableVehicleIcons] call STHud_Icon_Real;
    if (_icon == STHud_BGIcon) exitWith {
        if (_unit call STHud_IsEngineer) exitWith {
            "\A3\ui_f\data\map\vehicleicons\iconManEngineer_ca.paa";
        };
        if (_unit call STHud_IsMarksman) exitWith {
            "\zeusops_addon\icons\iconManMarksman_ca.paa";
        };
        if (_unit call STHud_IsGrenadier) exitWith {
            "\A3\ui_f\data\map\vehicleicons\iconmanexplosive_ca.paa";
        };
        _icon;
    };
    _icon;
};
