/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgVehicles
{
    class Logic;
    class Module_F : Logic
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

    class GVAR(base) : Module_F
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

    class GVAR(nachschubAbwurf) : GVAR(base)
    {
        scopeCurator = 2;
        displayName = "NachschubAbwurf";
        function = QFUNC(moduleNachschubAbwurf);
    };

    class GVAR(prioSichtbarkeit) : GVAR(base)
    {
        scopeCurator = 2;
        displayName = "PrioSichtbarkeit";
        function = QFUNC(modulePrioSichtbarkeit);
    };

    class GVAR(moduleUnflipVehicle) : GVAR(base)
    {
        scopeCurator = 2;
        displayName = "Unflip Vehicle";
        function = QFUNC(moduleUnflipVehicle);
    };

    class GVAR(adjustAceCargo) : GVAR(base)
    {
        scopeCurator = 2;
        displayName = "Adjust Ace Cargo space Loadout";
        function = QFUNC(moduleAdjustCargoSpace);
    };

    class GVAR(limitDamage) : GVAR(base)
    {
        scopeCurator = 2;
        displayName = "Limit Damage";
        function = QFUNC(moduleLimitDamage);
    };

    class GVAR(switchMove) : GVAR(base)
    {
        scopeCurator = 2;
        displayName = "Animation abbrechen";
        function = QFUNC(moduleSwitchMove);
    };

    class GVAR(defineAmmo) : GVAR(base)
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
    class GVAR(base_ki) : GVAR(base)
    {
        category = "TB_categorie_zeus_ki";
    };

    class GVAR(ki_disablePath) : GVAR(base_ki)
    {
        scopeCurator = 2;
        displayName = "DisablePath 4 Group";
        function = QFUNC(moduleDisablePath);
    };

    class GVAR(ki_handleAsPlayerMedical) : GVAR(base_ki)
    {
        scopeCurator = 2;
        displayName = "HandlePlayerAsMedical";
        function = QFUNC(moduleHandleAsPlayerMedical);
    };

    class GVAR(ki_applyLoadout) : GVAR(base_ki)
    {
        scopeCurator = 2;
        displayName = "Apply Loadout";
        function = QFUNC(moduleApplyLoadout);
    };

    class GVAR(ki_injured) : GVAR(base_ki)
    {
        scopeCurator = 2;
        displayName = "Verletzten";
        function = QEFUNC(eden,moduleInjured);
    };

};
