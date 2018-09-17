
class CfgVehicles
{
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
    class TB_zusatz_Module : Module_F {
        scope = 1;
        scopeCurator = 1;
        displayName = "Default TB modulename";
        category = "TB_categorie";
        function = "";
        functionPriority = 1;
        icon = "\A3\ui_f\data\igui\cfg\simpleTasks\types\intel_ca.paa";
        isGlobal = 0;
        isTriggerActivated = 1;
        isDisposable = 0;
        is3DEN = 1;
    };
    
    // #include "LV\CfgVehicles.hpp"
    #include "eos\CfgVehicles.hpp"
};