/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgMods
{
    class Mod_Base;
    class TBMod : Mod_Base
    {
        author = "TBMod-DevTeam";
        authors[] = {"shukari", "Eric Ruhland", "Eron", "IDarky", "mordl", "BenZockt"};

        picture = QPATHTOF(pics\logo.paa);
        logo = QPATHTOF(pics\logo.paa);
        logoOver = QPATHTOF(pics\logo.paa);
        logoSmall = QPATHTOF(pics\logo.paa);

        dlcColor[] = {0,0,0,1};
        fieldManualTopicAndHint[] = {};

        hidePicture = 0;
        hideName = 0;

        tooltip = "TBMod";
        tooltipOwned = "TBMod";
        name = "TacticalBacon Mod";
        overview = "Mod of the Group of Tacticalbacon.de";

        dir = "TBMod";

        actionName = "Website";
        action = "http://tacticalbacon.de/";
        description = "TacticalBacon Mod";
    };
};
