/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Wiki: https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes
*/
#define ADDCLASSVEHICLES(NUM) class GVAR(poppy_##NUM) : GVAR(poppy_01) \
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

    ADDCLASSVEHICLES(02);
    ADDCLASSVEHICLES(03);
    ADDCLASSVEHICLES(04);
    ADDCLASSVEHICLES(05);
    ADDCLASSVEHICLES(06);
    ADDCLASSVEHICLES(07);
    ADDCLASSVEHICLES(08);
    ADDCLASSVEHICLES(09);
    ADDCLASSVEHICLES(10);

};
