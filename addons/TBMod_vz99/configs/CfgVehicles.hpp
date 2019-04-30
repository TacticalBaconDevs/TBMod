/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Original by https://github.com/BourbonWarfare/POTATO
    Modified by http://tacticalbacon.de
*/
class CfgVehicles
{
    #define MACRO_ADDMAGAZINE(MAGAZINE,COUNT) class _xx_##MAGAZINE { \
            magazine = #MAGAZINE; \
            count = COUNT; \
        }
    #define MACRO_ADDWEAPON(WEAPON,COUNT) class _xx_##WEAPON { \
            weapon = #WEAPON; \
            count = COUNT; \
        }

    class Box_NATO_WpsLaunch_F;
    class TB_vz99_box : Box_NATO_WpsLaunch_F
    {
        displayName = "vz99 60mm Mortar Weapon And Ammo";
        author = "PabstMirror";

        class TransportItems {};
        class TransportBackpacks {};
        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(TB_vz99_HE,8);
            MACRO_ADDMAGAZINE(TB_vz99_HE_multi,8);
            MACRO_ADDMAGAZINE(TB_vz99_smokeWhite,8);
            MACRO_ADDMAGAZINE(TB_vz99_smokeRed,8);
            MACRO_ADDMAGAZINE(TB_vz99_flare,8);
        };
        class TransportWeapons
        {
            MACRO_ADDWEAPON(TB_vz99_carryWeapon,1);
        };
    };

    // ACE: Add Player Deploy Action
    class Man;
    class CAManBase: Man
    {
        class ACE_SelfActions
        {
            class TB_vz99_deploy
            {
                displayName = "Bau vz99 auf";
                condition = "_this call TB_fnc_canDeployWeapon";
                statement = "_this call TB_fnc_doDeployWeapon";
                exceptions[] = {};
                icon = "\TBMod_vz99\UI\action_mortar_ca.paa";
            };
        };
    };

    // Define Weapon Vehicle:
    class LandVehicle;
    class StaticWeapon: LandVehicle
    {
        class Turrets
        {
            class MainTurret;
        };
        class ACE_SelfActions;
        class ACE_Actions
        {
            class ACE_MainActions;
        };
    };
    class StaticMortar: StaticWeapon
    {
        class Turrets: Turrets
        {
            class MainTurret: MainTurret
            {
                class ViewOptics;
            };
        };
    };

    class TB_vz99_mortar : StaticMortar
    {
        // ACE Compat:
        ace_dragging_canCarry = 0;
        ace_dragging_canDrag = 0;
        ace_cargo_hasCargo = 0;
        ace_cargo_canLoad = 0;

        class ACE_Actions: ACE_Actions
        {
            class ACE_MainActions: ACE_MainActions
            {
                selection = "bubble start";
            };
            class TB_vz99_pickup
            {
                displayName = "Pickup Weapon";
                selection = "Konec hlavne";
                distance = 3;
                condition = "_this call TB_fnc_canPickupWeapon";
                statement = "_this call TB_fnc_doPickupWeapon";
            };
        };
        class ACE_SelfActions: ACE_SelfActions
        {
            class TB_vz99_load_HE
            {
                displayName = "Lade HE-Impact";
                condition = "(['TB_vz99_HE'] call TB_fnc_canSelectNextMagazine || {['TB_vz99_HE_multi'] call TB_fnc_canSelectNextMagazine})";
                statement = "['TB_vz99_HE_charge0'] call TB_fnc_doSelectNextMagazine";
                exceptions[] = {};
                icon = "\TBMod_vz99\UI\action_shell_ca.paa";

                class TB_vz99_load_HE_charge0
                {
                    displayName = "Charge 0";
                    statement = "['TB_vz99_HE_charge0'] call TB_fnc_doSelectNextMagazine";
                    icon = "\TBMod_vz99\UI\action_shell_ca.paa";
                };

                class TB_vz99_load_HE_charge1
                {
                    displayName = "Charge 1";
                    statement = "['TB_vz99_HE'] call TB_fnc_doSelectNextMagazine";
                    icon = "\TBMod_vz99\UI\action_shell_ca.paa";
                };
            };

            class TB_vz99_load_HE_PRX
            {
                displayName = "Lade HE-Proximity";
                condition = "['TB_vz99_HE_PRX'] call TB_fnc_canSelectNextMagazine";
                statement = "['TB_vz99_HE_PRX_charge0'] call TB_fnc_doSelectNextMagazine";
                exceptions[] = {};
                icon = "\TBMod_vz99\UI\action_shell_ca.paa";

                class TB_vz99_load_HE_charge0
                {
                    displayName = "Charge 0";
                    statement = "['TB_vz99_HE_PRX_charge0'] call TB_fnc_doSelectNextMagazine";
                    icon = "\TBMod_vz99\UI\action_shell_ca.paa'";
                };

                class TB_vz99_load_HE_charge1
                {
                    displayName = "Charge 1";
                    statement = "['TB_vz99_HE_PRX'] call TB_fnc_doSelectNextMagazine";
                    icon = "\TBMod_vz99\UI\action_shell_ca.paa'";
                };
            };

            class TB_vz99_load_smokeWhite
            {
                displayName = "Load Smoke(White) @ Charge 1";
                condition = "['TB_vz99_smokeWhite'] call TB_fnc_canSelectNextMagazine";
                statement = "['TB_vz99_smokeWhite_charge0'] call TB_fnc_doSelectNextMagazine";
                exceptions[] = {};
                icon = "\TBMod_vz99\UI\action_shell_ca.paa";

                class TB_vz99_load_smokeWhite_charge0
                {
                    displayName = "Charge 0";
                    statement = "['TB_vz99_smokeWhite_charge0'] call TB_fnc_doSelectNextMagazine";
                    icon = "\TBMod_vz99\UI\action_shell_ca.paa";
                };

                class TB_vz99_load_smokeWhite_charge1
                {
                    displayName = "Charge 1";
                    statement = "['TB_vz99_smokeWhite'] call TB_fnc_doSelectNextMagazine";
                    icon = "\TBMod_vz99\UI\action_shell_ca.paa";
                };
            };

            class TB_vz99_load_smokeRed
            {
                displayName = "Load Smoke(Red) @ Charge 1";
                condition = "['TB_vz99_smokeRed'] call TB_fnc_canSelectNextMagazine";
                statement = "['TB_vz99_smokeRed_charge0'] call TB_fnc_doSelectNextMagazine";
                exceptions[] = {};
                icon = "\TBMod_vz99\UI\action_shell_ca.paa";

                class TB_vz99_load_smokeRed_charge0
                {
                    displayName = "Charge 0";
                    statement = "['TB_vz99_smokeRed_charge0'] call TB_fnc_doSelectNextMagazine";
                    icon = "\TBMod_vz99\UI\action_shell_ca.paa";
                };

                class TB_vz99_load_smokeRed_charge1
                {
                    displayName = "Charge 1";
                    statement = "['TB_vz99_smokeRed'] call TB_fnc_doSelectNextMagazine";
                    icon = "\TBMod_vz99\UI\action_shell_ca.paa";
                };
            };

            class TB_vz99_load_flare
            {
                displayName = "Load Flare @ Charge 1";
                condition = "['TB_vz99_flare'] call TB_fnc_canSelectNextMagazine";
                statement = "['TB_vz99_flare_charge0'] call TB_fnc_doSelectNextMagazine";
                exceptions[] = {};
                icon = "\TBMod_vz99\UI\action_shell_ca.paa";

                class TB_vz99_load_flare_charge0
                {
                    displayName = "Charge 0";
                    statement = "['TB_vz99_flare_charge0'] call TB_fnc_doSelectNextMagazine";
                    icon = "\TBMod_vz99\UI\action_shell_ca.paa";
                };

                class TB_vz99_load_flare_charge1
                {
                    displayName = "Charge 1";
                    statement = "['TB_vz99_flare'] call TB_fnc_doSelectNextMagazine";
                    icon = "\TBMod_vz99\UI\action_shell_ca.paa";
                };
            };
        };

        model = "\TBMod_vz99\data\vz99_vehicle";
        class AnimationSources
        {
            class Level
            {
                source = "user";    //The controller is defined as a user animation.
                animPeriod = 0.5;   //The animation period used for this controller.
                initPhase = 0;      //Initial phase when object is created.
            };
            class DirFix
            {
                source = "user";    //The controller is defined as a user animation.
                animPeriod = 0.5;   //The animation period used for this controller.
                initPhase = 0;      //Initial phase when object is created.
            };
        };

        features = "";
        author = "PabstMirror";
        scope = 2;
        side = 1;
        faction = "BLU_F";
        crew = "B_Soldier_F";
        availableForSupportTypes[] = {"Artillery"};
        displayname = "vz99 60mm Mortar";
        transportSoldier = 0;
        cargoAction[] = {"Mortar_Gunner"};
        getInAction = "GetInMortar";
        getOutAction = "GetOutLow";
        editorSubcategory = "EdSubcat_Turrets";
        picture = "\A3\Static_f\Mortar_01\data\UI\Mortar_01_ca.paa";
        icon = "\A3\Static_f\Mortar_01\data\UI\map_Mortar_01_CA.paa";
        cost = 200000;
        accuracy = 0.25;
        threat[] = {1,0.3,0.1};
        htMin = 1;
        htMax = 480;
        afMax = 0;
        mfMax = 0;
        mFact = 1;
        tBody = 100;

        class DestructionEffects
        {
            class Smoke
            {
                simulation = "particles";
                type = "WeaponWreckSmoke";
                position = "destructionEffect";
                intensity = 1;
                interval = 1;
                lifeTime = 5;
            };
        };
        artilleryScanner = 0;
        laserScanner = 0;

        class Turrets: Turrets
        {
            class MainTurret: MainTurret
            {
                gunnerForceOptics = 1;

                cameraDir = "Sight";
                animationSourceBody = "mainTurret";
                animationSourceCamElev = "camElev";
                animationSourceGun = "mainGun";

                maxVerticalRotSpeed = 50;
                maxHorizontalRotSpeed = 50;

                memoryPointsGetInGunner = "pos gunner";
                memoryPointsGetInGunnerDir = "pos gunner dir";

                gunnerAction = "Mortar_Gunner";
                gunnergetInAction = "";
                gunnergetOutAction = "";

                elevationMode = 0;
                stabilizedInAxes = 0;

                initCamElev = 0;
                minCamElev = -35;
                maxCamElev = 35;

                minTurn = -180;
                maxTurn = 180;
                initTurn = 0;

                discreteDistance[] = {};
                discreteDistanceInitIndex = 0;

                discreteDistanceCameraPoint[] = {};

                // discreteDistance[] = {100,200,300,400,500,600,700,800,900,1000,1100,1200,1300,1400,1500,1600,1700,1800,1900};
                // discreteDistanceInitIndex = 5;

                // turretInfoType = "RscWeaponRangeArtillery";
                turretInfoType = "RscOptics_Offroad_01";

                memoryPointGunnerOptics = "eye";
                // gunnerOpticsModel = "\A3\Weapons_F\acc\reticle_Mortar_01_F.p3d";
                gunnerOpticsModel = "\A3\Weapons_F\empty.p3d";

                class ViewOptics: ViewOptics
                {
                    initAngleX = 0;
                    minAngleX = -30;
                    maxAngleX = 30;
                    initAngleY = 0;
                    minAngleY = -100;
                    maxAngleY = 100;
                    initFov = 0.75;
                    minFov = 0.75;
                    maxFov = 0.75;
                    visionMode[] = {"Normal", "NVG"};
                };

                initElev = -25;
                minelev = -45;
                maxelev = -5;

                magazines[] = {};
                weapons[] = {"TB_vz99_mortar60mm"};
            };
        };
    };
};
