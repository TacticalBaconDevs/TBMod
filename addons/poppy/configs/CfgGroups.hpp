/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Wiki: https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes
*/
#define AddUnitToGroup(NUM,UNITTYPE) class Unit##NUM \
    { \
        position[] = {##NUM ,0,0}; \
        rank = "SERGEANT"; \
        side = 1; \
        vehicle = QGVAR(##UNITTYPE); \
    }

#define CreateGroup4(FACTIONSIDE,GROUPNAME,GROUPNAMENICE,UNIT1,UNIT2,UNIT3,UNIT4) class ##GROUPNAME \
    { \
        faction = ##FACTIONSIDE; \
        icon = "\A3\ui_f\data\map\markers\nato\b_inf.paa"; \
        name = ##GROUPNAMENICE; \
        side = 1; \
        AddUnitToGroup(0,##UNIT1); \
        AddUnitToGroup(1,##UNIT2); \
        AddUnitToGroup(2,##UNIT3); \
        AddUnitToGroup(3,##UNIT4); \
    }

#define CreateGroup5(FACTIONSIDE,GROUPNAME,GROUPNAMENICE,UNIT1,UNIT2,UNIT3,UNIT4,UNIT5) class ##GROUPNAME \
    { \
        faction = ##FACTIONSIDE; \
        icon = "\A3\ui_f\data\map\markers\nato\b_inf.paa"; \
        name = ##GROUPNAMENICE; \
        side = 1; \
        AddUnitToGroup(0,##UNIT1); \
        AddUnitToGroup(1,##UNIT2); \
        AddUnitToGroup(2,##UNIT3); \
        AddUnitToGroup(3,##UNIT4); \
        AddUnitToGroup(4,##UNIT5); \
    }

class CfgGroups
{
    class West {
        class ADDON {
            name = "TBMod";
            class COMPONENT {
                name = "Poppy";
                CreateGroup4(BLU_F,Group0,4-1234,blufor_01,blufor_02,blufor_03,blufor_04);
                CreateGroup4(BLU_F,Group1,4-1456,blufor_01,blufor_05,blufor_06,blufor_07);
                CreateGroup4(BLU_F,Group2,4-1237,blufor_01,blufor_02,blufor_03,blufor_07);
            };
        };
    };
    class East {
        class ADDON {
            name = "TBMod";
            class COMPONENT {
                name = "Poppy";
                CreateGroup4(OPF_F,Group0,4-1234,opfor_01,opfor_02,opfor_03,opfor_04);
                CreateGroup4(OPF_F,Group1,4-1456,opfor_01,opfor_05,opfor_06,opfor_07);
                CreateGroup4(OPF_F,Group2,4-1237,opfor_01,opfor_02,opfor_03,opfor_07);
            };
        };
    };
    class Indep {
        class ADDON {
            name = "TBMod";
            class COMPONENT {
                name = "Poppy";
                CreateGroup4(IND_F,Group0,4-1234,ind_01,ind_02,ind_03,ind_04);
                CreateGroup4(IND_F,Group1,4-1456,ind_01,ind_05,ind_06,ind_07);
                CreateGroup4(IND_F,Group2,4-1237,ind_01,ind_02,ind_03,ind_07);
            };
        };
    };
};