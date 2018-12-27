class CfgVehicles
{
    
    class TB_zeus_base;
    class TB_zeus_persistence : TB_zeus_base
    {
        author = "Eric";
        scopeCurator = 2;
        displayName = "Persistence";
        function = "TB_fnc_modulepersistencezeus";
    };

    class TB_eden_base;
    class TB_eden_persistence : TB_eden_base {
        scope = 2;
        scopeCurator = 1;
        displayName = "Persistence";
        function = "TB_fnc_modulepersistenceEDEN";
    };
};