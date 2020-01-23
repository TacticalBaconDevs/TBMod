/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Wiki: https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes
*/
#define ADDCLASS(NUM) class GVAR(poppy_##NUM) : GVAR(poppy_01) \
    { \
        displayname = QUOTE(Poppy NUM); \
    }

class CfgVehicles
{
    class O_Survivor_F;
    class GVAR(poppy_01) : O_Survivor_F
    {
        displayname = "Poppy 01";

        editorCategory = "EdCat_TB_MainCat";
        editorSubcategory = "EdSubcat_TB_Poppy";
    };

    ADDCLASS(02);
    ADDCLASS(03);
    ADDCLASS(04);
    ADDCLASS(05);
    ADDCLASS(06);
    ADDCLASS(07);
    ADDCLASS(08);
    ADDCLASS(09);
    ADDCLASS(10);

};
