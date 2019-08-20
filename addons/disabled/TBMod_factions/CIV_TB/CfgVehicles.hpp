/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class C_man_polo_3_F_euro;
class C_man_polo_3_F_euro_OCimport_01 : C_man_polo_3_F_euro { scope = 0; class EventHandlers; };
class C_man_polo_3_F_euro_OCimport_02 : C_man_polo_3_F_euro_OCimport_01 { class EventHandlers; };

class C_Man_casual_3_F_euro;
class C_Man_casual_3_F_euro_OCimport_01 : C_Man_casual_3_F_euro { scope = 0; class EventHandlers; };
class C_Man_casual_3_F_euro_OCimport_02 : C_Man_casual_3_F_euro_OCimport_01 { class EventHandlers; };

class C_man_sport_3_F_euro;
class C_man_sport_3_F_euro_OCimport_01 : C_man_sport_3_F_euro { scope = 0; class EventHandlers; };
class C_man_sport_3_F_euro_OCimport_02 : C_man_sport_3_F_euro_OCimport_01 { class EventHandlers; };

class C_man_p_fugitive_F;
class C_man_p_fugitive_F_OCimport_01 : C_man_p_fugitive_F { scope = 0; class EventHandlers; };
class C_man_p_fugitive_F_OCimport_02 : C_man_p_fugitive_F_OCimport_01 { class EventHandlers; };


class C_TB_Konsument_Heroin_01 : C_man_polo_3_F_euro {
    author = "shukari";
    scope = 2;
    scopeCurator = 2;
    displayName = "Konsument (Heroin)";
    side = 3;
    faction = "CIV_TB";

    identityTypes[] = {"Head_Euro","G_CIVIL_male"};

    uniformClass = "U_C_Poloshirt_stripped";

    linkedItems[] = {"H_Cap_brn_SPECOPS","ItemMap","ItemCompass","ItemWatch"};
    respawnlinkedItems[] = {"H_Cap_brn_SPECOPS","ItemMap","ItemCompass","ItemWatch"};

    weapons[] = {};
    respawnWeapons[] = {};

    magazines[] = {};
    respawnMagazines[] = {};

    ALiVE_orbatCreator_loadout[] = {{},{},{},{"U_C_Poloshirt_stripped",{{"ARP_Objects_smartphone_m",1},{"ARP_Objects_money_m",1},{"ARP_Objects_heroin_m",2},{"ARP_Objects_armacard_m",1},{"ARP_Objects_folder_m",1}}},{},{},"H_Cap_brn_SPECOPS","",{},{"ItemMap","","","ItemCompass","ItemWatch",""}};


    class EventHandlers : EventHandlers {
        class CBA_Extended_EventHandlers : CBA_Extended_EventHandlers_base {};

        class ALiVE_orbatCreator {
            init = "if (local (_this select 0)) then {_onSpawn = {_this = _this select 0;sleep 0.2; _backpack = gettext(configfile >> 'cfgvehicles' >> (typeof _this) >> 'backpack'); waituntil {sleep 0.2; backpack _this == _backpack};if !(_this getVariable ['ALiVE_OverrideLoadout',false]) then {_loadout = getArray(configFile >> 'CfgVehicles' >> (typeOf _this) >> 'ALiVE_orbatCreator_loadout'); _this setunitloadout _loadout;reload _this};};_this spawn _onSpawn;(_this select 0) addMPEventHandler ['MPRespawn', _onSpawn];};";
        };

    };

    // custom attributes (do not delete)
    ALiVE_orbatCreator_owned = 1;

};

class C_TB_Konsument_Heroin_02 : C_Man_casual_3_F_euro {
    author = "shukari";
    scope = 2;
    scopeCurator = 2;
    displayName = "Konsument2 (Heroin)";
    side = 3;
    faction = "CIV_TB";

    identityTypes[] = {"Head_Euro","G_CIVIL_male"};

    uniformClass = "U_C_Man_casual_3_F";

    linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
    respawnlinkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};

    weapons[] = {};
    respawnWeapons[] = {};

    magazines[] = {};
    respawnMagazines[] = {};

    ALiVE_orbatCreator_loadout[] = {{},{},{},{"U_C_Man_casual_3_F",{{"ARP_Objects_heroin_m",3},{"ARP_Objects_passport_m",1},{"ARP_Objects_smartphone_m",1},{"ARP_Objects_waterbottle_m",1},{"ARP_Objects_moneya_m",2},{"ACE_atropine",1}}},{},{},"","",{},{"ItemMap","","","ItemCompass","ItemWatch",""}};


    class EventHandlers : EventHandlers {
        class CBA_Extended_EventHandlers : CBA_Extended_EventHandlers_base {};

        class ALiVE_orbatCreator {
            init = "if (local (_this select 0)) then {_onSpawn = {_this = _this select 0;sleep 0.2; _backpack = gettext(configfile >> 'cfgvehicles' >> (typeof _this) >> 'backpack'); waituntil {sleep 0.2; backpack _this == _backpack};if !(_this getVariable ['ALiVE_OverrideLoadout',false]) then {_loadout = getArray(configFile >> 'CfgVehicles' >> (typeOf _this) >> 'ALiVE_orbatCreator_loadout'); _this setunitloadout _loadout;reload _this};};_this spawn _onSpawn;(_this select 0) addMPEventHandler ['MPRespawn', _onSpawn];};";
        };

    };

    // custom attributes (do not delete)
    ALiVE_orbatCreator_owned = 1;

};

class C_TB_Konsument_Cocain_01 : C_man_sport_3_F_euro {
    author = "shukari";
    scope = 2;
    scopeCurator = 2;
    displayName = "Konsument (Kokain)";
    side = 3;
    faction = "CIV_TB";

    identityTypes[] = {"Head_Euro","G_CIVIL_male"};

    uniformClass = "rds_uniform_Rocker3";

    linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
    respawnlinkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};

    weapons[] = {};
    respawnWeapons[] = {};

    magazines[] = {};
    respawnMagazines[] = {};

    ALiVE_orbatCreator_loadout[] = {{},{},{},{"rds_uniform_Rocker3",{{"ARP_Objects_8ball_m",2},{"ARP_Objects_armacard_m",1},{"ARP_Objects_smartphone_m",1},{"ARP_Objects_moneya_m",1},{"ARP_Objects_newspaperclosed_m",1},{"ACE_epinephrine",1}}},{},{},"","",{},{"ItemMap","","","ItemCompass","ItemWatch",""}};


    class EventHandlers : EventHandlers {
        class CBA_Extended_EventHandlers : CBA_Extended_EventHandlers_base {};

        class ALiVE_orbatCreator {
            init = "if (local (_this select 0)) then {_onSpawn = {_this = _this select 0;sleep 0.2; _backpack = gettext(configfile >> 'cfgvehicles' >> (typeof _this) >> 'backpack'); waituntil {sleep 0.2; backpack _this == _backpack};if !(_this getVariable ['ALiVE_OverrideLoadout',false]) then {_loadout = getArray(configFile >> 'CfgVehicles' >> (typeOf _this) >> 'ALiVE_orbatCreator_loadout'); _this setunitloadout _loadout;reload _this};};_this spawn _onSpawn;(_this select 0) addMPEventHandler ['MPRespawn', _onSpawn];};";
        };

    };

    // custom attributes (do not delete)
    ALiVE_orbatCreator_owned = 1;

};

class C_TB_Konsument_Cocain_02 : C_man_p_fugitive_F {
    author = "shukari";
    scope = 2;
    scopeCurator = 2;
    displayName = "Konsument2 (Kokain)";
    side = 3;
    faction = "CIV_TB";

    identityTypes[] = {"Head_Greek","LanguageGRE_F","G_CIVIL_male"};

    uniformClass = "U_C_Poor_1";

    linkedItems[] = {"H_Cap_tan","ItemMap","ItemCompass","ItemWatch"};
    respawnlinkedItems[] = {"H_Cap_tan","ItemMap","ItemCompass","ItemWatch"};

    weapons[] = {};
    respawnWeapons[] = {};

    magazines[] = {};
    respawnMagazines[] = {};

    ALiVE_orbatCreator_loadout[] = {{},{},{},{"U_C_Poor_1",{{"ARP_Objects_weed_m",1},{"ARP_Objects_8ball_m",2},{"ARP_Objects_smartphone_m",1},{"ARP_Objects_moneya_m",2},{"ARP_Objects_key_m",1},{"ARP_Objects_folder_m",2},{"ARP_Objects_clipboard_m",1}}},{},{},"H_Cap_tan","",{},{"ItemMap","","","ItemCompass","ItemWatch",""}};


    class EventHandlers : EventHandlers {
        class CBA_Extended_EventHandlers : CBA_Extended_EventHandlers_base {};

        class ALiVE_orbatCreator {
            init = "if (local (_this select 0)) then {_onSpawn = {_this = _this select 0;sleep 0.2; _backpack = gettext(configfile >> 'cfgvehicles' >> (typeof _this) >> 'backpack'); waituntil {sleep 0.2; backpack _this == _backpack};if !(_this getVariable ['ALiVE_OverrideLoadout',false]) then {_loadout = getArray(configFile >> 'CfgVehicles' >> (typeOf _this) >> 'ALiVE_orbatCreator_loadout'); _this setunitloadout _loadout;reload _this};};_this spawn _onSpawn;(_this select 0) addMPEventHandler ['MPRespawn', _onSpawn];};";
        };

    };

    // custom attributes (do not delete)
    ALiVE_orbatCreator_owned = 1;

};
