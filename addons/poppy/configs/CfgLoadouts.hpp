/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Created by https://github.com/BaerMitUmlaut/Poppy
    Changed by http://tacticalbacon.de

    Wiki: https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes
*/
#define ADDCLASSLOADOUT(TYPE,NUM) class GVAR(##TYPE_##NUM): All##TYPE {}

class CfgLoadouts
{
    class All
    {
        uniform[] = {"U_C_Protagonist_VR"};
        backpack[] = {};
        vest[] = {};
        headgear[] = {};
        goggles[] = {};
        nvgs[] = {};
        primary[] = {};
        secondary[] = {};
        magazines[] = {
            {"SmokeShellGreen", 1}
        };
        items[] = {
            {"ACE_fieldDressing", 4},
            {"ACE_packingBandage", 4},
            {"ACE_elasticBandage", 4},
            {"ACE_quikclot", 4},
            {"ACE_morphine", 1}
        };
    };

    class Allopfor : All {
        uniform[] = {"U_O_Protagonist_VR"};
    };

    class Allblufor : All {
        uniform[] = {"U_B_Protagonist_VR"};
    };
    
    class Allind : All {
        uniform[] = {"U_I_Protagonist_VR"};
    };

    ADDCLASSLOADOUT(opfor,01);
    ADDCLASSLOADOUT(opfor,02);
    ADDCLASSLOADOUT(opfor,03);
    ADDCLASSLOADOUT(opfor,04);
    ADDCLASSLOADOUT(opfor,05);
    ADDCLASSLOADOUT(opfor,06);
    ADDCLASSLOADOUT(opfor,07);
    ADDCLASSLOADOUT(opfor,08);
    ADDCLASSLOADOUT(opfor,09);
    ADDCLASSLOADOUT(opfor,10);

    ADDCLASSLOADOUT(blufor,01);
    ADDCLASSLOADOUT(blufor,02);
    ADDCLASSLOADOUT(blufor,03);
    ADDCLASSLOADOUT(blufor,04);
    ADDCLASSLOADOUT(blufor,05);
    ADDCLASSLOADOUT(blufor,06);
    ADDCLASSLOADOUT(blufor,07);
    ADDCLASSLOADOUT(blufor,08);
    ADDCLASSLOADOUT(blufor,09);
    ADDCLASSLOADOUT(blufor,10);

    ADDCLASSLOADOUT(ind,01);
    ADDCLASSLOADOUT(ind,02);
    ADDCLASSLOADOUT(ind,03);
    ADDCLASSLOADOUT(ind,04);
    ADDCLASSLOADOUT(ind,05);
    ADDCLASSLOADOUT(ind,06);
    ADDCLASSLOADOUT(ind,07);
    ADDCLASSLOADOUT(ind,08);
    ADDCLASSLOADOUT(ind,09);
    ADDCLASSLOADOUT(ind,10);

};
