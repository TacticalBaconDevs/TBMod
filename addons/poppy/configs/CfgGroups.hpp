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

#define CreateGroup4(GROUPNAME,GROUPNAMENICE,UNIT1,UNIT2,UNIT3,UNIT4) class ##GROUPNAME \
    { \
		faction = "BLU_F"; \
		icon = "\A3\ui_f\data\map\markers\nato\b_inf.paa"; \
		name = ##GROUPNAMENICE; \
		side = 1; \
		AddUnitToGroup(0,##UNIT1); \
		AddUnitToGroup(1,##UNIT2); \
		AddUnitToGroup(2,##UNIT3); \
		AddUnitToGroup(3,##UNIT4); \
    }

class CfgGroups
{
	class West {
		class ADDON {
			name = "TBMod";
			class COMPONENT {
				name = "Poppy";
				CreateGroup4(Group0,4-1234,blufor_01,blufor_02,blufor_03,blufor_04);
				CreateGroup4(Group1,4-1456,blufor_01,blufor_05,blufor_06,blufor_07);
				CreateGroup4(Group2,4-1237,blufor_01,blufor_02,blufor_03,blufor_07);
			};
		};
	};
};