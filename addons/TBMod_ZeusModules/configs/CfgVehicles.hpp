/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
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
            class Edit; // Default edit box (i.e., text input field)
            class Combo; // Default combo box (i.e., drop-down menu)
            class Checkbox; // Default checkbox (returned value is Bool)
            class CheckboxNumber; // Default checkbox (returned value is Number)
            class ModuleDescription; // Module description
            class Units; // Selection of units on which the module is applied
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
        curatorCanAttach = 0;
        
        function = "ace_common_fnc_dummy";
        author = "shukari";
        category = "TB_categorie";
    };
    class TB_zeus_nachschubAbwurf : TB_zeus_base
    {
        scopeCurator = 2;
        displayName = "NachschubAbwurf";
        function = "TB_fnc_moduleNachschubAbwurf";
    };
    class TB_zeus_disablePath : TB_zeus_base
    {
        scopeCurator = 2;
        curatorCanAttach = 1;
        displayName = "DisablePath 4 Group";
        function = "TB_fnc_moduleDisablePath";
    };
    class TB_zeus_prioSichtbarkeit : TB_zeus_base
    {
        scopeCurator = 2;
        displayName = "PrioSichtbarkeit";
        function = "TB_fnc_modulePrioSichtbarkeit";
    };
    class TB_zeus_handleAsPlayerMedical : TB_zeus_base
    {
        scopeCurator = 2;
        curatorCanAttach = 1;
        displayName = "HandlePlayerAsMedical";
        function = "TB_fnc_moduleHandleAsPlayerMedical";
    };
    class TB_zeus_applyLoadout : TB_zeus_base
    {
        curatorCanAttach = 1;
        scopeCurator = 2;
        displayName = "Apply Loadout";
        function = "TB_fnc_moduleApplyLoadout";
    };
};