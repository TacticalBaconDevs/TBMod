/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Wiki: https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes
*/
#define ADDUNITTOGROUP(NUM,UNITTYPE,UNITSIDE) class Unit##NUM { \
        position[] = {NUM,0,0}; \
        rank = "SERGEANT"; \
        side = UNITSIDE; \
        vehicle = QGVAR(UNITTYPE); \
    }

#define CREATEGROUP4(FACTIONSIDE,GROUPNAME,GROUPSIDE,GROUPNAMENICE,UNIT1,UNIT2,UNIT3,UNIT4) class GROUPNAME { \
        faction = #FACTIONSIDE; \
        icon = "\A3\ui_f\data\map\markers\nato\b_inf.paa"; \
        name = #GROUPNAMENICE; \
        side = GROUPSIDE; \
        ADDUNITTOGROUP(0,UNIT1,GROUPSIDE); \
        ADDUNITTOGROUP(1,UNIT2,GROUPSIDE); \
        ADDUNITTOGROUP(2,UNIT3,GROUPSIDE); \
        ADDUNITTOGROUP(3,UNIT4,GROUPSIDE); \
    }

#define CREATEGROUP6(FACTIONSIDE,GROUPNAME,GROUPSIDE,GROUPNAMENICE,UNIT1,UNIT2,UNIT3,UNIT4,UNIT5,UNIT6) class GROUPNAME { \
        faction = #FACTIONSIDE; \
        icon = "\A3\ui_f\data\map\markers\nato\b_inf.paa"; \
        name = #GROUPNAMENICE; \
        side = GROUPSIDE; \
        ADDUNITTOGROUP(0,UNIT1,GROUPSIDE); \
        ADDUNITTOGROUP(1,UNIT2,GROUPSIDE); \
        ADDUNITTOGROUP(2,UNIT3,GROUPSIDE); \
        ADDUNITTOGROUP(3,UNIT4,GROUPSIDE); \
        ADDUNITTOGROUP(4,UNIT5,GROUPSIDE); \
        ADDUNITTOGROUP(5,UNIT6,GROUPSIDE); \
    }

class CfgGroups
{
    class East
    {
        class ADDON
        {
            name = "#TBMod";

            class COMPONENT
            {
                name = "Poppy";

                CREATEGROUP4(OPF_F,Group0,0,4-1234,opfor_01,opfor_02,opfor_03,opfor_04);
                CREATEGROUP4(OPF_F,Group1,0,4-1567,opfor_01,opfor_05,opfor_06,opfor_07);
                CREATEGROUP4(OPF_F,Group2,0,4-1237,opfor_01,opfor_02,opfor_03,opfor_07);

                CREATEGROUP6(OPF_F,Group3,0,6-123456,opfor_01,opfor_02,opfor_03,opfor_04,opfor_05,opfor_06);
            };
        };
    };

    class West
    {
        class ADDON
        {
            name = "#TBMod";

            class COMPONENT
            {
                name = "Poppy";

                CREATEGROUP4(BLU_F,Group0,1,4-1234,blufor_01,blufor_02,blufor_03,blufor_04);
                CREATEGROUP4(BLU_F,Group1,1,4-1567,blufor_01,blufor_05,blufor_06,blufor_07);
                CREATEGROUP4(BLU_F,Group2,1,4-1237,blufor_01,blufor_02,blufor_03,blufor_07);

                CREATEGROUP6(BLU_F,Group3,1,6-123456,blufor_01,blufor_02,blufor_03,blufor_04,blufor_05,blufor_06);
            };
        };
    };

    class Indep
    {
        class ADDON
        {
            name = "#TBMod";

            class COMPONENT
            {
                name = "Poppy";

                CREATEGROUP4(IND_F,Group0,2,4-1234,ind_01,ind_02,ind_03,ind_04);
                CREATEGROUP4(IND_F,Group1,2,4-1567,ind_01,ind_05,ind_06,ind_07);
                CREATEGROUP4(IND_F,Group2,2,4-1237,ind_01,ind_02,ind_03,ind_07);

                CREATEGROUP6(IND_F,Group3,2,6-123456,ind_01,ind_02,ind_03,ind_04,ind_05,ind_06);
            };
        };
    };

    class Civilian
    {
        // nicht in Vanilla, deswegen muss es definiert werden
        name = "Civilian";
        side = 3;

        class ADDON
        {
            name = "#TBMod";

            class COMPONENT
            {
                name = "Poppy";

                CREATEGROUP4(CIV_F,Group0,3,4-1234,civ_01,civ_02,civ_03,civ_04);
                CREATEGROUP4(CIV_F,Group1,3,4-1567,civ_01,civ_05,civ_06,civ_07);
                CREATEGROUP4(CIV_F,Group2,3,4-1237,civ_01,civ_02,civ_03,civ_07);

                CREATEGROUP6(CIV_F,Group3,3,6-123456,civ_01,civ_02,civ_03,civ_04,civ_05,civ_06);
            };
        };
    };

};
