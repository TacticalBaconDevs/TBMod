class CfgSettings
{
    class CBA
    {
        class Versioning
        {
            // This registers MyMod with the versioning system and looks for version info at CfgPatches -> MyMod_main
            class TBMod
            {
                // Optional: Manually specify the Main Addon for this mod
                main_addon = "TBMod_main"; // Uncomment and specify this to manually define the Main Addon (CfgPatches entry) of the mod

                // Optional: Add a custom handler function triggered upon version mismatch
                //handler = "myMod_fnc_mismatch"; // Adds a custom script function that will be triggered on version mismatch. Make sure this function is compiled at a called preInit, not spawn/execVM

                // Optional: Dependencies
                class Dependencies
                {
                    CBA[] = {"cba_main", {3,10,0}, "(true)"};
                };

                // Optional: Removed addons Upgrade registry
                // Example: myMod_addon1 was removed and it's important the user doesn't still have it loaded
                removed[] = {"TBMod_ausbildung", "TBMod_items"};
            };
        };
    };
};
