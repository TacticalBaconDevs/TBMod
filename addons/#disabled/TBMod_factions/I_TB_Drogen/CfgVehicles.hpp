class I_L_Looter_Pistol_F;
class I_L_Looter_Pistol_F_OCimport_01 : I_L_Looter_Pistol_F { scope = 0; class EventHandlers; };
class I_L_Looter_Pistol_F_OCimport_02 : I_L_Looter_Pistol_F_OCimport_01 { class EventHandlers; };

class I_L_Looter_SG_F;
class I_L_Looter_SG_F_OCimport_01 : I_L_Looter_SG_F { scope = 0; class EventHandlers; };
class I_L_Looter_SG_F_OCimport_02 : I_L_Looter_SG_F_OCimport_01 { class EventHandlers; };

class I_L_Criminal_SMG_F;
class I_L_Criminal_SMG_F_OCimport_01 : I_L_Criminal_SMG_F { scope = 0; class EventHandlers; };
class I_L_Criminal_SMG_F_OCimport_02 : I_L_Criminal_SMG_F_OCimport_01 { class EventHandlers; };

class C_Offroad_01_covered_F;
class C_Offroad_01_covered_F_OCimport_01 : C_Offroad_01_covered_F { scope = 0; class EventHandlers; class Turrets; };
class C_Offroad_01_covered_F_OCimport_02 : C_Offroad_01_covered_F_OCimport_01 { 
    class EventHandlers; 
    class Turrets : Turrets {
        class CargoTurret_01;
        class CargoTurret_02;
        class CargoTurret_03;
        class CargoTurret_04;
    };
};

class C_SUV_01_F;
class C_SUV_01_F_OCimport_01 : C_SUV_01_F { scope = 0; class EventHandlers; };
class C_SUV_01_F_OCimport_02 : C_SUV_01_F_OCimport_01 { scope = 0; class EventHandlers; };


class I_ITBDrogen_Drogenheandler_01 : I_L_Looter_Pistol_F_OCimport_02 {
    author = "shukari";
    scope = 2;
    scopeCurator = 2;
    displayName = "Drogenheandler";
    side = 2;
    faction = "I_TB_Drogen";

    identityTypes[] = {"Head_Enoch","LanguagePOL_F","G_GUERIL_default"};

    uniformClass = "U_I_C_Soldier_Bandit_3_F";

    linkedItems[] = {"ItemMap","ItemRadio","ItemCompass","ItemWatch"};
    respawnlinkedItems[] = {"ItemMap","ItemRadio","ItemCompass","ItemWatch"};

    weapons[] = {"rhs_weap_type94_new"};
    respawnWeapons[] = {"rhs_weap_type94_new"};

    magazines[] = {"rhs_mag_6x8mm_mhp","rhs_mag_6x8mm_mhp"};
    respawnMagazines[] = {"rhs_mag_6x8mm_mhp","rhs_mag_6x8mm_mhp"};

    backpack = "B_Messenger_Gray_F";

    ALiVE_orbatCreator_loadout[] = {{},{},{"rhs_weap_type94_new","","","",{"rhs_mag_6x8mm_mhp",6},{},""},{"U_I_C_Soldier_Bandit_3_F",{{"ACE_morphine",2},{"ARP_Objects_waterbottle_m",1},{"ARP_Objects_smartphone_m",1},{"ARP_Objects_moneya_m",5},{"ARP_Objects_mre_m",1},{"ARP_Objects_armacard_m",1},{"ARP_Objects_clipboard_m",1},{"ARP_Objects_folder_m",1},{"ACE_Banana",3},{"ARP_Objects_weed_m",4}}},{},{"B_Messenger_Gray_F",{{"ARP_Objects_cocaine_m",2},{"ARP_Objects_8ball_m",2},{"ARP_Objects_heroin_m",1},{"rhs_mag_6x8mm_mhp",10,6}}},"","",{},{"ItemMap","","ItemRadio","ItemCompass","ItemWatch",""}};


    class EventHandlers : EventHandlers {
        class CBA_Extended_EventHandlers : CBA_Extended_EventHandlers_base {};

        class ALiVE_orbatCreator {
            init = "if (local (_this select 0)) then {_onSpawn = {_this = _this select 0;sleep 0.2; _backpack = gettext(configfile >> 'cfgvehicles' >> (typeof _this) >> 'backpack'); waituntil {sleep 0.2; backpack _this == _backpack};if !(_this getVariable ['ALiVE_OverrideLoadout',false]) then {_loadout = getArray(configFile >> 'CfgVehicles' >> (typeOf _this) >> 'ALiVE_orbatCreator_loadout'); _this setunitloadout _loadout;reload _this};};_this spawn _onSpawn;(_this select 0) addMPEventHandler ['MPRespawn', _onSpawn];};";
        };

    };

    // custom attributes (do not delete)
    ALiVE_orbatCreator_owned = 1;

};

class I_ITBDrogen_Drogenheandler_02 : I_L_Looter_Pistol_F_OCimport_02 {
    author = "shukari";
    scope = 2;
    scopeCurator = 2;
    displayName = "Drogenheandler2";
    side = 2;
    faction = "I_TB_Drogen";

    identityTypes[] = {"Head_Enoch","LanguagePOL_F","G_GUERIL_default"};

    uniformClass = "U_I_C_Soldier_Bandit_2_F";

    linkedItems[] = {"H_Bandanna_camo","ItemMap","ItemRadio","ItemCompass","ItemWatch"};
    respawnlinkedItems[] = {"H_Bandanna_camo","ItemMap","ItemRadio","ItemCompass","ItemWatch"};

    weapons[] = {"rhs_weap_tt33"};
    respawnWeapons[] = {"rhs_weap_tt33"};

    magazines[] = {"rhs_mag_762x25_8","rhs_mag_762x25_8"};
    respawnMagazines[] = {"rhs_mag_762x25_8","rhs_mag_762x25_8"};

    backpack = "B_Messenger_Black_F";

    ALiVE_orbatCreator_loadout[] = {{},{},{"rhs_weap_tt33","","","",{"rhs_mag_762x25_8",8},{},""},{"U_I_C_Soldier_Bandit_2_F",{{"ACE_packingBandage",1},{"ACE_morphine",3},{"ARP_Objects_smartphone_m",2},{"ARP_Objects_newspaperclosed_m",1},{"ARP_Objects_moneya_m",3},{"ARP_Objects_key_m",1},{"ARP_Objects_armacard_m",1},{"ARP_Objects_folder_m",2},{"ARP_Objects_weed_m",6},{"ACE_Banana",1},{"ARP_Objects_clipboard_m",1},{"ARP_Objects_waterbottle_m",1}}},{},{"B_Messenger_Black_F",{{"ARP_Objects_weed_m",11},{"ACE_Banana",3},{"ARP_Objects_armacard_m",1},{"ARP_Objects_8ball_m",4},{"ARP_Objects_heroin_m",4},{"ARP_Objects_key_m",1},{"ARP_Objects_moneya_m",11},{"ARP_Objects_boxmre_m",1},{"rhs_mag_762x25_8",10,8}}},"H_Bandanna_camo","G_Spectacles_Tinted",{},{"ItemMap","","ItemRadio","ItemCompass","ItemWatch",""}};


    class EventHandlers : EventHandlers {
        class CBA_Extended_EventHandlers : CBA_Extended_EventHandlers_base {};

        class ALiVE_orbatCreator {
            init = "if (local (_this select 0)) then {_onSpawn = {_this = _this select 0;sleep 0.2; _backpack = gettext(configfile >> 'cfgvehicles' >> (typeof _this) >> 'backpack'); waituntil {sleep 0.2; backpack _this == _backpack};if !(_this getVariable ['ALiVE_OverrideLoadout',false]) then {_loadout = getArray(configFile >> 'CfgVehicles' >> (typeOf _this) >> 'ALiVE_orbatCreator_loadout'); _this setunitloadout _loadout;reload _this};};_this spawn _onSpawn;(_this select 0) addMPEventHandler ['MPRespawn', _onSpawn];};";
        };

    };

    // custom attributes (do not delete)
    ALiVE_orbatCreator_owned = 1;

};

class I_ITBDrogen_Drogenheandler_03 : I_L_Looter_Pistol_F_OCimport_02 {
    author = "shukari";
    scope = 2;
    scopeCurator = 2;
    displayName = "Drogenheandler3";
    side = 2;
    faction = "I_TB_Drogen";

    identityTypes[] = {"Head_Enoch","LanguagePOL_F","G_GUERIL_default"};

    uniformClass = "U_I_C_Soldier_Bandit_5_F";

    linkedItems[] = {"H_Cap_grn_Syndikat_F","ItemMap","ItemRadio","ItemCompass","ItemWatch"};
    respawnlinkedItems[] = {"H_Cap_grn_Syndikat_F","ItemMap","ItemRadio","ItemCompass","ItemWatch"};

    weapons[] = {"rhs_weap_makarov_pm"};
    respawnWeapons[] = {"rhs_weap_makarov_pm"};

    magazines[] = {"rhs_mag_9x18_8_57N181S","rhs_mag_9x18_8_57N181S"};
    respawnMagazines[] = {"rhs_mag_9x18_8_57N181S","rhs_mag_9x18_8_57N181S"};

    backpack = "B_Messenger_Coyote_F";

    ALiVE_orbatCreator_loadout[] = {{},{},{"rhs_weap_makarov_pm","","","",{"rhs_mag_9x18_8_57N181S",8},{},""},{"U_I_C_Soldier_Bandit_5_F",{{"ACE_morphine",3},{"ACE_Cellphone",1},{"ARP_Objects_moneya_m",6},{"ARP_Objects_mre_m",2},{"ARP_Objects_heroin_m",3},{"ARP_Objects_folder_m",2},{"ARP_Objects_armacard_m",4}}},{},{"B_Messenger_Coyote_F",{{"ARP_Objects_cocaine_m",4},{"ARP_Objects_8ball_m",3},{"rds_car_FirstAidKit",1},{"rhs_mag_9x18_8_57N181S",9,8}}},"H_Cap_grn_Syndikat_F","",{},{"ItemMap","","ItemRadio","ItemCompass","ItemWatch",""}};


    class EventHandlers : EventHandlers {
        class CBA_Extended_EventHandlers : CBA_Extended_EventHandlers_base {};

        class ALiVE_orbatCreator {
            init = "if (local (_this select 0)) then {_onSpawn = {_this = _this select 0;sleep 0.2; _backpack = gettext(configfile >> 'cfgvehicles' >> (typeof _this) >> 'backpack'); waituntil {sleep 0.2; backpack _this == _backpack};if !(_this getVariable ['ALiVE_OverrideLoadout',false]) then {_loadout = getArray(configFile >> 'CfgVehicles' >> (typeOf _this) >> 'ALiVE_orbatCreator_loadout'); _this setunitloadout _loadout;reload _this};};_this spawn _onSpawn;(_this select 0) addMPEventHandler ['MPRespawn', _onSpawn];};";
        };

    };

    // custom attributes (do not delete)
    ALiVE_orbatCreator_owned = 1;

};

class I_ITBDrogen_Drogenheandler_04 : I_L_Looter_Pistol_F_OCimport_02 {
    author = "shukari";
    scope = 2;
    scopeCurator = 2;
    displayName = "Drogenheandler4";
    side = 2;
    faction = "I_TB_Drogen";

    identityTypes[] = {"Head_Enoch","LanguagePOL_F","G_GUERIL_default"};

    uniformClass = "U_I_C_Soldier_Bandit_4_F";

    linkedItems[] = {"H_Bandanna_camo","ItemMap","ItemRadio","ItemCompass","ItemWatch"};
    respawnlinkedItems[] = {"H_Bandanna_camo","ItemMap","ItemRadio","ItemCompass","ItemWatch"};

    weapons[] = {"rhs_weap_6p53"};
    respawnWeapons[] = {"rhs_weap_6p53"};

    magazines[] = {"rhs_18rnd_9x21mm_7N28","rhs_18rnd_9x21mm_7N28"};
    respawnMagazines[] = {"rhs_18rnd_9x21mm_7N28","rhs_18rnd_9x21mm_7N28"};

    backpack = "B_Messenger_Gray_F";

    ALiVE_orbatCreator_loadout[] = {{},{},{"rhs_weap_6p53","","","",{"rhs_18rnd_9x21mm_7N28",18},{},""},{"U_I_C_Soldier_Bandit_4_F",{{"ACE_morphine",4},{"ARP_Objects_newspaperclosed_m",2},{"UMI_Land_MobilePhone_Old_F",1},{"ARP_Objects_moneya_m",6},{"ARP_Objects_heroin_m",2},{"ACE_Flashlight_XL50",1}}},{},{"B_Messenger_Gray_F",{{"UMI_Weed_Bale",1},{"rhs_18rnd_9x21mm_7N28",8,18}}},"H_Bandanna_camo","",{},{"ItemMap","","ItemRadio","ItemCompass","ItemWatch",""}};


    class EventHandlers : EventHandlers {
        class CBA_Extended_EventHandlers : CBA_Extended_EventHandlers_base {};

        class ALiVE_orbatCreator {
            init = "if (local (_this select 0)) then {_onSpawn = {_this = _this select 0;sleep 0.2; _backpack = gettext(configfile >> 'cfgvehicles' >> (typeof _this) >> 'backpack'); waituntil {sleep 0.2; backpack _this == _backpack};if !(_this getVariable ['ALiVE_OverrideLoadout',false]) then {_loadout = getArray(configFile >> 'CfgVehicles' >> (typeOf _this) >> 'ALiVE_orbatCreator_loadout'); _this setunitloadout _loadout;reload _this};};_this spawn _onSpawn;(_this select 0) addMPEventHandler ['MPRespawn', _onSpawn];};";
        };

    };

    // custom attributes (do not delete)
    ALiVE_orbatCreator_owned = 1;

};

class I_ITBDrogen_Drogenboss_01 : I_L_Looter_SG_F_OCimport_02 {
    author = "shukari";
    scope = 2;
    scopeCurator = 2;
    displayName = "Drogenboss";
    side = 2;
    faction = "I_TB_Drogen";

    identityTypes[] = {"Head_Enoch","LanguagePOL_F","G_GUERIL_default"};

    uniformClass = "U_C_Mechanic_01_F";

    linkedItems[] = {"V_Pocketed_coyote_F","H_Booniehat_oli","ItemMap","ItemRadio","ItemCompass","ItemWatch"};
    respawnlinkedItems[] = {"V_Pocketed_coyote_F","H_Booniehat_oli","ItemMap","ItemRadio","ItemCompass","ItemWatch"};

    weapons[] = {"sgun_HunterShotgun_01_sawedoff_F"};
    respawnWeapons[] = {"sgun_HunterShotgun_01_sawedoff_F"};

    magazines[] = {"2Rnd_12Gauge_Pellets","2Rnd_12Gauge_Pellets"};
    respawnMagazines[] = {"2Rnd_12Gauge_Pellets","2Rnd_12Gauge_Pellets"};

    backpack = "rhs_sidor";

    ALiVE_orbatCreator_loadout[] = {{"sgun_HunterShotgun_01_sawedoff_F","","","",{"2Rnd_12Gauge_Pellets",2},{},""},{},{},{"U_C_Mechanic_01_F",{{"ARP_Objects_waterbottle_m",1},{"ARP_Objects_smartphone_m",4},{"ARP_Objects_mre_m",1},{"ARP_Objects_moneya_m",8},{"ARP_Objects_card_black_m",1},{"ARP_Objects_key_m",2},{"ARP_Objects_heroin_m",2},{"ARP_Objects_armacard_m",2},{"ARP_Objects_folder_m",1}}},{"V_Pocketed_coyote_F",{}},{"rhs_sidor",{{"UMI_Briefcase_Money_Open",1},{"ARP_Objects_clipboard_m",1},{"2Rnd_12Gauge_Pellets",13,2}}},"H_Booniehat_oli","",{},{"ItemMap","","ItemRadio","ItemCompass","ItemWatch",""}};


    class EventHandlers : EventHandlers {
        class CBA_Extended_EventHandlers : CBA_Extended_EventHandlers_base {};

        class ALiVE_orbatCreator {
            init = "if (local (_this select 0)) then {_onSpawn = {_this = _this select 0;sleep 0.2; _backpack = gettext(configfile >> 'cfgvehicles' >> (typeof _this) >> 'backpack'); waituntil {sleep 0.2; backpack _this == _backpack};if !(_this getVariable ['ALiVE_OverrideLoadout',false]) then {_loadout = getArray(configFile >> 'CfgVehicles' >> (typeOf _this) >> 'ALiVE_orbatCreator_loadout'); _this setunitloadout _loadout;reload _this};};_this spawn _onSpawn;(_this select 0) addMPEventHandler ['MPRespawn', _onSpawn];};";
        };

    };

    // custom attributes (do not delete)
    ALiVE_orbatCreator_owned = 1;

};

class I_ITBDrogen_Drogenboss_02 : I_L_Criminal_SMG_F_OCimport_02 {
    author = "shukari";
    scope = 2;
    scopeCurator = 2;
    displayName = "Drogenboss2";
    side = 2;
    faction = "I_TB_Drogen";

    identityTypes[] = {"Head_Enoch","LanguagePOL_F","G_GUERIL_default"};

    uniformClass = "U_O_R_Gorka_01_black_F";

    linkedItems[] = {"H_Bandanna_khk","ItemMap","ItemRadio","ItemCompass","ItemWatch"};
    respawnlinkedItems[] = {"H_Bandanna_khk","ItemMap","ItemRadio","ItemCompass","ItemWatch"};

    weapons[] = {"hgun_PDW2000_F"};
    respawnWeapons[] = {"hgun_PDW2000_F"};

    magazines[] = {"30Rnd_9x21_Mag","30Rnd_9x21_Mag"};
    respawnMagazines[] = {"30Rnd_9x21_Mag","30Rnd_9x21_Mag"};

    backpack = "B_Messenger_Black_F";

    ALiVE_orbatCreator_loadout[] = {{"hgun_PDW2000_F","","","",{"30Rnd_9x21_Mag",30},{},""},{},{},{"U_O_R_Gorka_01_black_F",{{"ARP_Objects_weed_m",3},{"ACE_Banana",1},{"rds_car_FirstAidKit",1},{"ARP_Objects_folder_m",2},{"ARP_Objects_armacard_m",5},{"ARP_Objects_heroin_m",1},{"ARP_Objects_key_m",1},{"ARP_Objects_money_m",2},{"ARP_Objects_mre_m",1},{"ARP_Objects_newspaperclosed_m",1},{"ARP_Objects_passport_m",3}}},{},{"B_Messenger_Black_F",{{"ARP_Objects_folder_m",7},{"UMI_Briefcase_Money_Open",1},{"ARP_Objects_cocaine_m",1},{"ARP_Objects_clipboard_m",3},{"16Rnd_9x21_red_Mag",8,17}}},"H_Bandanna_khk","G_Bandanna_aviator",{},{"ItemMap","","ItemRadio","ItemCompass","ItemWatch",""}};


    class EventHandlers : EventHandlers {
        class CBA_Extended_EventHandlers : CBA_Extended_EventHandlers_base {};

        class ALiVE_orbatCreator {
            init = "if (local (_this select 0)) then {_onSpawn = {_this = _this select 0;sleep 0.2; _backpack = gettext(configfile >> 'cfgvehicles' >> (typeof _this) >> 'backpack'); waituntil {sleep 0.2; backpack _this == _backpack};if !(_this getVariable ['ALiVE_OverrideLoadout',false]) then {_loadout = getArray(configFile >> 'CfgVehicles' >> (typeOf _this) >> 'ALiVE_orbatCreator_loadout'); _this setunitloadout _loadout;reload _this};};_this spawn _onSpawn;(_this select 0) addMPEventHandler ['MPRespawn', _onSpawn];};";
        };

    };

    // custom attributes (do not delete)
    ALiVE_orbatCreator_owned = 1;

};

class I_ITBDrogen_OffroadSupport_01 : C_Offroad_01_covered_F_OCimport_02 {
    author = "shukari";
    scope = 2;
    scopeCurator = 2;
    displayName = "OffroadSupport";
    side = 2;
    faction = "I_TB_Drogen";
    crew = "I_ITBDrogen_Drogenheandler_01";

    class Turrets : Turrets {
        class CargoTurret_01 : CargoTurret_01 { gunnerType = "I_ITBDrogen_Drogenheandler_01"; };
        class CargoTurret_02 : CargoTurret_02 { gunnerType = "I_ITBDrogen_Drogenheandler_02"; };
        class CargoTurret_03 : CargoTurret_03 { gunnerType = "I_ITBDrogen_Drogenheandler_04"; };
        class CargoTurret_04 : CargoTurret_04 { gunnerType = "I_ITBDrogen_Drogenheandler_03"; };
    };



    class EventHandlers : EventHandlers {
        class CBA_Extended_EventHandlers : CBA_Extended_EventHandlers_base {};

        class ALiVE_orbatCreator {
            init = "if (local (_this select 0)) then {_onSpawn = {sleep 0.3; _unit = _this select 0;_unit setObjectTextureGlobal [0,'\a3\Soft_F_Enoch\Offroad_01\Data\offroad_01_ext_grn_CO.paa'];_unit setObjectTextureGlobal [1,'\a3\Soft_F_Enoch\Offroad_01\Data\offroad_01_ext_grn_CO.paa'];_unit setObjectTextureGlobal [2,'a3\Soft_F_Enoch\Offroad_01\Data\offroad_01_cover_grn_co.paa'];};_this spawn _onSpawn;(_this select 0) addMPEventHandler ['MPRespawn', _onSpawn];};";
        };

    };

    // custom attributes (do not delete)
    ALiVE_orbatCreator_owned = 1;
    ALiVE_orbatCreator_texture = "Green";

};

class I_ITBDrogen_SuvBoss_01 : C_SUV_01_F_OCimport_02 {
    author = "shukari";
    scope = 2;
    scopeCurator = 2;
    displayName = "SuvBoss";
    side = 2;
    faction = "I_TB_Drogen";
    crew = "I_ITBDrogen_Drogenboss_01";


    class EventHandlers : EventHandlers {
        class CBA_Extended_EventHandlers : CBA_Extended_EventHandlers_base {};

        class ALiVE_orbatCreator {
            init = "if (local (_this select 0)) then {_onSpawn = {sleep 0.3; _unit = _this select 0;_unit setObjectTextureGlobal [0,'\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_04_CO.paa'];};_this spawn _onSpawn;(_this select 0) addMPEventHandler ['MPRespawn', _onSpawn];};";
        };

    };

    // custom attributes (do not delete)
    ALiVE_orbatCreator_owned = 1;
    ALiVE_orbatCreator_texture = "Orange";

};