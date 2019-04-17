/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgVehicles
{
    // ###################### Zeus Module ######################
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

    class TB_zeus_nachschubAbwurf : TB_zeus_base
    {
        scopeCurator = 2;
        displayName = "NachschubAbwurf";
        function = "TB_fnc_moduleNachschubAbwurf";
    };

    class TB_zeus_prioSichtbarkeit : TB_zeus_base
    {
        scopeCurator = 2;
        displayName = "PrioSichtbarkeit";
        function = "TB_fnc_modulePrioSichtbarkeit";
    };

    class TB_zeus_moduleUnflipVehicle : TB_zeus_base
    {
        scopeCurator = 2;
        displayName = "Unflip Vehicle";
        function = "TB_fnc_moduleUnflipVehicle";
    };

    class TB_zeus_disablePath : TB_zeus_base
    {
        scopeCurator = 2;
        displayName = "DisablePath 4 Group";
        function = "TB_fnc_moduleDisablePath";
        category = "TB_categorie_zeus_ki";
    };

    class TB_zeus_handleAsPlayerMedical : TB_zeus_base
    {
        scopeCurator = 2;
        displayName = "HandlePlayerAsMedical";
        function = "TB_fnc_moduleHandleAsPlayerMedical";
        category = "TB_categorie_zeus_ki";
    };

    class TB_zeus_applyLoadout : TB_zeus_base
    {
        scopeCurator = 2;
        displayName = "Apply Loadout";
        function = "TB_fnc_moduleApplyLoadout";
        category = "TB_categorie_zeus_ki";
    };
};
