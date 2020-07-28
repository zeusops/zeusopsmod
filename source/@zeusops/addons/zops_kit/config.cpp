class CfgPatches
{
    class ZOPS_Uniform
    {
        version = "1.1.3";
        units[] = {};
        weapons[] = {};
        requiredVersion = "1.1.3";
        requiredAddons[] = {};
    };
};

class CfgVehicles
{
    class B_Soldier_base_F;

    class ZOPS_01_F: B_Soldier_base_F
    {
        scope = 1;
        author = "Jakx2210 (Caboose)";
        dlc = "ZOPS_KIT";
        model="\rhsafrf\addons\rhs_infantry2\rhs_gorka_1_base.p3d";
        hiddenSelections[] = {"Camo1","insignia"};
        hiddenSelectionsTextures[] = {"\ZOPS_Kit\data\gorka_winter.paa"};

    };
};

class cfgWeapons
{
    //********************************************************************************************************************************************************************************************
    //*****            Uniforms              *****************************************************************************************************************************************************
    //********************************************************************************************************************************************************************************************
    class UniformItem;
    class Uniform_Base;
        
    class Uniform_M93_ZOPS: Uniform_Base
    {
        scope = 2;
        author = "Jakx2210 (Caboose)";
        dlc = "ZOPS_KIT";
        displayName = "[Winter] Uniform (Gorka)";
        picture = "\ZOPS_Kit\ui\uniform_test.paa";
        model = "\A3\Characters_F\Common\Suitpacks\suitpack_original_F";
        class ItemInfo: UniformItem
        {
            uniformModel = "-";
            uniformClass = "ZOPS_01_F";
            containerClass = "Supply50";
            mass = 50;
            allowedSlots[] = {"701","801","901"};
            armor = 0;
        };
    };
    
    //************************************************************************************************************************************************************************************************
    //*****             Vests                *********************************************************************************************************************************************************
    //************************************************************************************************************************************************************************************************
    class ItemCore; 
    class VestItem; 
    class Vest_Base: ItemCore 
    { 
        class ItemInfo; 
    }; 
     
     
    class vest_6b23_ZOPS: Vest_Base
    { 
        scope = 2; 
        author = "Jakx2210 (Caboose)";
        displayName = "[Winter] Vest (6B23)"; 
        picture = "\ZOPS_Kit\ui\vest_test.paa"; 
        model="rhsafrf\addons\rhs_infantry\gear\vests\rhs_6b23_sniper";
        hiddenSelections[] = {"camo1","camo2"}; 
        hiddenSelectionsTextures[] = {"ZOPS_Kit\Data\6b23_winter.paa","rhsafrf\addons\rhs_infantry\data\gearpack1_6sh92_co.paa"}; 
        class ItemInfo: VestItem 
        { 
            uniformModel = "rhsafrf\addons\rhs_infantry\gear\vests\rhs_6b23_sniper";
            containerClass = "Supply120"; 
            mass = 100; 
            allowedSlots[] = {"901"};
            hiddenSelections[] = {"camo1","camo2"};

            class HitpointsProtectionInfo
            {
                class Chest
                {
                    HitpointName="HitChest";
                    armor=25;
                    PassThrough=0.2;
                };
                class Diaphragm
                {
                    HitpointName="HitDiaphragm";
                    armor=25;
                    PassThrough=0.2;
                };
                class Abdomen
                {
                    hitpointName="HitAbdomen";
                    armor=25;
                    passThrough=0.2;
                };
                class Body
                {
                    hitpointName="HitBody";
                    passThrough=0.2;    
                };
            };  
        };
    };

    class vest_alice_ZOPS: Vest_Base
    { 
        scope = 2; 
        dlc = "RHS_GREF";
        author = "Jakx2210 (Caboose)";
        displayName = "Alice Webbing"; 
        picture = "\ZOPS_Kit\ui\vest_test.paa"; 
        model = "rhsgref\addons\rhsgref_infantry\gear_cdf\vests\rhs_alice_webbing";
        hiddenSelections[] = {};
        hiddenSelectionsTextures[] = {};
        class ItemInfo: VestItem 
        { 
            uniformModel = "rhsgref\addons\rhsgref_infantry\gear_cdf\vests\rhs_alice_webbing";
            containerClass = "Supply120"; 
            mass = 100; 
            allowedSlots[] = {"901"};

            class HitpointsProtectionInfo
            {
                class Chest
                {
                    HitpointName="HitChest";
                    armor=25;
                    PassThrough=0.2;
                };
                class Diaphragm
                {
                    HitpointName="HitDiaphragm";
                    armor=25;
                    PassThrough=0.2;
                };
                class Abdomen
                {
                    hitpointName="HitAbdomen";
                    armor=25;
                    passThrough=0.2;
                };
                class Body
                {
                    hitpointName="HitBody";
                    passThrough=0.2;    
                };
            };  
        };
    };
};
