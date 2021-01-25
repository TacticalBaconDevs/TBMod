/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgVehicles
{
    class Logic;
    class Module_F: Logic
    {
        class AttributesBase
        {
            class Default;
            class Edit;
            class Combo;
            class Checkbox;
            class CheckboxNumber;
            class ModuleDescription;
            class Units;
        };
        class ModuleDescription
        {
            class AnyBrain;
        };
    };
    class TB_zeus_base : Module_F
    {
        scope = 1;
        scopeCurator = 1;

        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        curatorCanAttach = 1;

        function = "ace_common_fnc_dummy";
        author = "shukari";
        category = "TB_categorie_zeus_allgemein";
    };
    class GVAR(base) : TB_zeus_base {};

    class TB_zeus_nachschubAbwurf : TB_zeus_base
    {
        scopeCurator = 2;
        displayName = "NachschubAbwurf";
        function = QFUNC(moduleNachschubAbwurf);
    };

    class TB_zeus_prioSichtbarkeit : TB_zeus_base
    {
        scopeCurator = 2;
        displayName = "PrioSichtbarkeit";
        function = QFUNC(modulePrioSichtbarkeit);
    };

    class TB_zeus_moduleUnflipVehicle : TB_zeus_base
    {
        scopeCurator = 2;
        displayName = "Unflip Vehicle";
        function = QFUNC(moduleUnflipVehicle);
    };

    class TB_zeus_adjustAceCargo : TB_zeus_base
    {
        scopeCurator = 2;
        displayName = "Adjust Ace Cargo space Loadout";
        function = QFUNC(moduleAdjustCargoSpace);
    };

    class TB_zeus_limitDamage : TB_zeus_base
    {
        scopeCurator = 2;
        displayName = "Limit Damage";
        function = QFUNC(moduleLimitDamage);
    };

    class TB_zeus_switchMove : TB_zeus_base
    {
        scopeCurator = 2;
        displayName = "Animation abbrechen";
        function = QFUNC(moduleSwitchMove);
    };

    class TB_zeus_defineAmmo : TB_zeus_base
    {
        scopeCurator = 2;
        displayName = "Define Ammo";
        function = QFUNC(moduleDefineAmmo);
    };

    class GVAR(createTransmitter) : GVAR(base)
    {
        scopeCurator = 2;
        displayName = "Erstelle Transmitter";
        function = QFUNC(moduleCreateTransmitter);
    };

    class GVAR(setViewDistance) : GVAR(base)
    {
        scopeCurator = 2;
        displayName = "Setze Viewdistance";
        function = QFUNC(moduleSetViewDistance);
    };


    // ### Zeus KI
    class TB_zeus_disablePath : TB_zeus_base
    {
        scopeCurator = 2;
        displayName = "DisablePath 4 Group";
        function = QFUNC(moduleDisablePath);
        category = "TB_categorie_zeus_ki";
    };

    class TB_zeus_handleAsPlayerMedical : TB_zeus_base
    {
        //scopeCurator = 2; // TODO: erstmal deaktiviert!!!
        displayName = "HandlePlayerAsMedical";
        function = QFUNC(moduleHandleAsPlayerMedical);
        category = "TB_categorie_zeus_ki";
    };

    class TB_zeus_applyLoadout : TB_zeus_base
    {
        scopeCurator = 2;
        displayName = "Apply Loadout";
        function = QFUNC(moduleApplyLoadout);
        category = "TB_categorie_zeus_ki";
    };

};
