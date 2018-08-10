// class Extended_PreInit_EventHandlers
// {
//     class TBMod_arsenal
//     {
//         init = "call compile preProcessFileLineNumbers '\TBMod_arsenal\XEH_preInit.sqf'";
//     };
// };

class Extended_PostInit_EventHandlers
{
    class TBMod_arsenal
    {
        clientInit = "call compile preprocessFileLineNumbers '\TBMod_arsenal\XEH_postClientInit.sqf'";
    };
};
