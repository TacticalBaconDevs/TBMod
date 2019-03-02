/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author: Chris 'Taranis'
*/
class CfgWeapons
{
    class CBA_MiscItem;
    class CBA_MiscItem_ItemInfo;

    class TB_liveMonitor_monitor: CBA_MiscItem
    {
        displayName = "LiveMonitor";

        scope = 2;
        scopeCurator = 2;

        descriptionShort = "Dieser Live Monitor zeigt den Plus, Blutdruck und den Blutverlust. Nutze die Pfeiltasten um zwischen den Modis zu wechseln!";

        picture = "\TBMod_liveMonitor\pictures\liveMonitor";
        model = "\TBMod_liveMonitor\models\liveMonitor.p3d";

        class ItemInfo: CBA_MiscItem_ItemInfo
        {
            mass = 5;
        };
    };
};
