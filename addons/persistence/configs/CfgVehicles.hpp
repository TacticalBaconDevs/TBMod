/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgVehicles
{
    class EGVAR(zeus,base);
    class TB_zeus_persistence : EGVAR(zeus,base)
    {
        author = "Eric";
        scopeCurator = 2;
        displayName = "Persistence";
        function = QFUNC(modulePersistenceZeus);
    };

    class TB_eden_base;
    class TB_eden_persistence : TB_eden_base {
        scope = 2;
        scopeCurator = 1;
        displayName = "Persistence";
        function = QFUNC(modulePersistenceEDEN);
    };
};
