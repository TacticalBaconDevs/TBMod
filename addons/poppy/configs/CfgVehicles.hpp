/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Wiki: https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes
*/
#define ADDCLASSVEHICLES(TYPE,NUM) class GVAR(##TYPE_##NUM) : GVAR(##TYPE_01) \
    { \
        displayname = QUOTE(Poppy NUM); \
    }

class CfgVehicles
{
    class O_Survivor_F;
    class B_Survivor_F;
    class I_Survivor_F;
    class GVAR(opfor_01) : O_Survivor_F
    {
        displayname = "Poppy 01";

        editorCategory = "EdCat_TB_MainCat";
        editorSubcategory = "EdSubcat_TB_Poppy";
    };

    class GVAR(blufor_01) : B_Survivor_F
    {
        displayname = "Poppy 01";

        editorCategory = "EdCat_TB_MainCat";
        editorSubcategory = "EdSubcat_TB_Poppy";
    };

    class GVAR(ind_01) : I_Survivor_F
    {
        displayname = "Poppy 01";

        editorCategory = "EdCat_TB_MainCat";
        editorSubcategory = "EdSubcat_TB_Poppy";
    };

    ADDCLASSVEHICLES(opfor,02);
    ADDCLASSVEHICLES(opfor,03);
    ADDCLASSVEHICLES(opfor,04);
    ADDCLASSVEHICLES(opfor,05);
    ADDCLASSVEHICLES(opfor,06);
    ADDCLASSVEHICLES(opfor,07);
    ADDCLASSVEHICLES(opfor,08);
    ADDCLASSVEHICLES(opfor,09);
    ADDCLASSVEHICLES(opfor,10);

    ADDCLASSVEHICLES(blufor,02);
    ADDCLASSVEHICLES(blufor,03);
    ADDCLASSVEHICLES(blufor,04);
    ADDCLASSVEHICLES(blufor,05);
    ADDCLASSVEHICLES(blufor,06);
    ADDCLASSVEHICLES(blufor,07);
    ADDCLASSVEHICLES(blufor,08);
    ADDCLASSVEHICLES(blufor,09);
    ADDCLASSVEHICLES(blufor,10);

    ADDCLASSVEHICLES(ind,02);
    ADDCLASSVEHICLES(ind,03);
    ADDCLASSVEHICLES(ind,04);
    ADDCLASSVEHICLES(ind,05);
    ADDCLASSVEHICLES(ind,06);
    ADDCLASSVEHICLES(ind,07);
    ADDCLASSVEHICLES(ind,08);
    ADDCLASSVEHICLES(ind,09);
    ADDCLASSVEHICLES(ind,10);

};
