/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CBA_Extended_EventHandlers;

class CfgVehicles
{
    // ###################### Boards ######################
    #define ADD_RUFNAME_DETAIL(NAME,RUFNAME) class _xx_##RUFNAME \
        { \
            displayName = #NAME; \
            statement = QUOTE(systemChat (RUFNAME + ' wurde als Rufname gesetzt!'); (group ACE_player) setGroupIdGlobal ['RUFNAME']); \
            exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"}; \
            insertChildren = QUOTE([_this, 'RUFNAME'] call FUNC(insertChildrenRufname)); \
        }
    #define ADD_RUFNAME(NAME) ADD_RUFNAME_DETAIL(NAME, NAME)

    class Land_MapBoard_F;
    class TB_spezial_base : Land_MapBoard_F
    {
        author = "shukari";

        scope = 1;
        scopeCurator = 1;

        editorCategory = "EdCat_TB_MainCat";
        editorSubcategory = "EdSubcat_TB_Spezial";
    };

    class TB_flag_rufnamen : TB_spezial_base
    {
        displayName = "Rufnamen";

        scope = 2;
        scopeCurator = 2;

        hiddenSelectionsTextures[] = {PATHTOF(pics\rufnamen.paa)};

        class ACE_Actions
        {
            class ACE_MainActions
            {
                displayName = "TB-Rufnamen";
                distance = 10;
                runOnHover = 1;

                class kommando
                {
                    displayName = "Kommando";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};

                    ADD_RUFNAME(Kommando);
                    ADD_RUFNAME(G1);
                    ADD_RUFNAME(G2);
                    ADD_RUFNAME(G3);
                    ADD_RUFNAME(G4);
                };

                class trupp
                {
                    displayName = "Trupp";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};

                    ADD_RUFNAME(Alpha);
                    ADD_RUFNAME(Bravo);
                    ADD_RUFNAME(Charlie);
                    ADD_RUFNAME(Delta);
                    ADD_RUFNAME(Echo);
                    ADD_RUFNAME(Foxtrott);
                    ADD_RUFNAME(Gamma);
                };

                class special
                {
                    displayName = "Spezial";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};

                    ADD_RUFNAME_DETAIL(Angel (Sanitätseinheit), Angel);
                    ADD_RUFNAME_DETAIL(Phantom (Aufklärer), Phantom);
                    ADD_RUFNAME_DETAIL(Reaper (AngriffsHeli), Reaper);
                    ADD_RUFNAME_DETAIL(Pegasus (TranpsortHeli), Pegasus);
                    ADD_RUFNAME(Ghost);
                    ADD_RUFNAME(NightHawk);
                };

                class alphabet
                {
                    displayName = "Alphabetisch";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};

                    // http://henney.com/chm/callsign.htm
                    ADD_RUFNAME(Arrow);
                    ADD_RUFNAME(Bronco);
                    ADD_RUFNAME(Cobra);
                    ADD_RUFNAME(Dallas);
                    ADD_RUFNAME(Eagle);
                    ADD_RUFNAME(Falcon);
                    ADD_RUFNAME(Gremlin);
                    ADD_RUFNAME(Hound);
                    ADD_RUFNAME(Havoc);
                    ADD_RUFNAME(Inferno);
                    ADD_RUFNAME(Jaguar);
                    ADD_RUFNAME(Karma);
                    ADD_RUFNAME(Wolf);
                    ADD_RUFNAME(Killjoy);
                    ADD_RUFNAME(Lion);
                    ADD_RUFNAME(Monty);
                };

                class reserviert
                {
                    displayName = "Reserviert";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};

                    ADD_RUFNAME_DETAIL(shukari, Atlas);
                    ADD_RUFNAME_DETAIL(Mike, Bazinga);
                    ADD_RUFNAME_DETAIL(Jojo, Foxy);
                    ADD_RUFNAME_DETAIL(Sponst, Badger);
                    ADD_RUFNAME_DETAIL(Darky, Lunar);
                    ADD_RUFNAME_DETAIL(Eron, Manta);
                    ADD_RUFNAME_DETAIL(Pingu, Hammer);
                };
            };
        };
    };

    class TB_flag_teleportBase : TB_spezial_base
    {
        displayName = "TeleportBase";

        scope = 2;
        scopeCurator = 2;

        hiddenSelectionsTextures[] = {PATHTOF(pics\teleport.paa)};

        class ACE_Actions
        {
            class ACE_MainActions
            {
                displayName = "TB-Teleport";
                distance = 10;
                runOnHover = 1;

                class fob
                {
                    displayName = "FOB";
                    condition = "!isNil 'TB_main_fobs' && {(count TB_main_fobs) > 0}";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    insertChildren = QUOTE(_this call FUNC(insertChildrenFOB));
                };

                class truppe
                {
                    displayName = "Trupp";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};

                    class toLeader
                    {
                        displayName = "Truppführer";
                        statement = QUOTE(if (leader ACE_player != ACE_player) then {[leader ACE_player] spawn FUNC(teleport)} else {systemChat 'Du bist Truppführer, deswegen ist das Teleporten nicht zu Dir möglich!'});
                        exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    };

                    class toSpieler
                    {
                        displayName = "Kameraden";
                        statement = QUOTE([] spawn FUNC(actionTeleportKamerad));
                        exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                        insertChildren = QUOTE(_this call FUNC(insertChildrenKameraden));
                    };
                };

                class gruppen
                {
                    displayName = "Truppen";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    insertChildren = QUOTE(_this call FUNC(insertChildrenGruppen));
                };
            };
        };
    };


    // ###################### FOBs ######################
    #define ADD_FOB(NAME, NUMBER) class TB_spezial_fob##NAME : TB_spezial_fobBase \
        { \
            displayName = QUOTE(NAME-FOB); \
            fobNumber = NUMBER; \
            scope = 2; \
            scopeCurator = 2; \
            class ACE_Actions \
            { \
                class ACE_MainActions \
                { \
                    displayName = "TB-FOB"; \
                    distance = 10; \
                    modifierFunction =  QUOTE([_this] call FUNC(modifierFOBs)); \
                    statement = "_action = false"; \
                    runOnHover = 1; \
                }; \
            }; \
        }

    class Box_FIA_Ammo_F;
    class TB_spezial_fobBase : Box_FIA_Ammo_F
    {
        author = "shukari";

        scope = 1;
        scopeCurator = 1;

        disableInventory = 1;

        editorCategory = "EdCat_TB_MainCat";
        editorSubcategory = "EdSubcat_TB_FOBs";
    };

    ADD_FOB(Alpha,0);
    ADD_FOB(Bravo,1);
    ADD_FOB(Charlie,2);
    ADD_FOB(Delta,3);
    ADD_FOB(Echo,4);
    ADD_FOB(Foxtrott,5);
    ADD_FOB(Golf,6);
    ADD_FOB(Hotel,7);
    ADD_FOB(India,8);


    // ###################### Schilder ######################
    #define ADD_SIGN(NAME) class TB_editor_g##NAME: TB_editor_gBriefing \
        { \
            displayName = QUOTE(NAME (groß)); \
            hiddenSelectionsTextures[] = {QPATHTOF(pics\NAME.paa)}; \
        }; \
        class TB_editor_k##NAME: TB_editor_kBriefing \
        { \
            displayName = QUOTE(NAME (klein)); \
            hiddenSelectionsTextures[] = {QPATHTOF(pics\NAME.paa)}; \
        }

    class SignAd_Sponsor_F;
    class Land_Noticeboard_F;
    class TB_editor_gBriefing: SignAd_Sponsor_F // ### große Schilder
    {
        author = "TacticalBacon";
        editorCategory = "EdCat_TB_MainCat";
        editorSubcategory = "EdSubcat_TB_BriefingBereich";

        scope = 2;
        scopeCurator = 2;

        displayName = "Briefing (groß)";
        hiddenSelectionsTextures[] = {QPATHTOF(pics\briefing.paa)};
    };
    class TB_editor_kBriefing: Land_Noticeboard_F // ### kleine Schilder
    {
        author = "TacticalBacon";
        editorCategory = "EdCat_TB_MainCat";
        editorSubcategory = "EdSubcat_TB_BriefingBereich";

        scope = 2;
        scopeCurator = 2;

        displayName = "Briefing (klein)";
        hiddenSelectionsTextures[] = {QPATHTOF(pics\briefing.paa)};
    };
    ADD_SIGN(Logo);
    ADD_SIGN(Sammelplatz);
    ADD_SIGN(Waffenausgabe);
    ADD_SIGN(Alpha);
    ADD_SIGN(Bravo);
    ADD_SIGN(Charlie);
    ADD_SIGN(Delta);
    ADD_SIGN(Echo);
    ADD_SIGN(Foxtrott);
    ADD_SIGN(Gamma);
    ADD_SIGN(Comcenter);
    ADD_SIGN(Logistik);
    ADD_SIGN(Logistiksp);
    ADD_SIGN(OneTeam);
    ADD_SIGN(Rufnamen);
    ADD_SIGN(Trupp);


    // ###################### ACE Defuse ######################
    // class Items_base_F;
    // class ACE_DefuseObject: Items_base_F
    // {
        // class EventHandlers
        // {
            // class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        // };

        // author = "ACE-Team";
        // _generalMacro = "ACE_DefuseObject";
        // displayName = "ACE Defuse Helper";
        // model = "\A3\Weapons_f\dummyweapon.p3d";
        // scope = 1;

        // class ACE_Actions
        // {
            // class ACE_Defuse
            // {
                // distance = 2;
                // displayName = "Entschärfen";
                // condition = "";
                // statement = ";";
                // exceptions[] = {"isNotSwimming"};
                // icon = "";
            // };
        // };
    // };
    // class ACE_DefuseObject_Large: ACE_DefuseObject
    // {
        // class ACE_Actions: ACE_Actions
        // {
            // class ACE_Defuse: ACE_Defuse
            // {
                // distance = 3;
            // };
        // };
    // };


    // ###################### TFAR RADIOS leichter ######################
    #define ADD_OVERRIDE(NAME,PARENT,LOAD,MASSE) class NAME : PARENT \
        { \
            maximumLoad = LOAD; \
            mass = MASSE; \
        }
    class TFAR_Bag_Base;
    ADD_OVERRIDE(TFAR_rt1523g,TFAR_Bag_Base,129,25); // 50, 80 - 5,16 - Russen kleines LR
    ADD_OVERRIDE(tf_rt1523g,TFAR_rt1523g,129,25);
    ADD_OVERRIDE(OPXT_aor1_117,tf_rt1523g,129,25);

    ADD_OVERRIDE(TFAR_rt1523g_big,TFAR_rt1523g,160,30); // 160, 160 - 5,3 - USA großes LR
    ADD_OVERRIDE(tf_rt1523g_big,TFAR_rt1523g_big,160,30);
    ADD_OVERRIDE(OPXT_aor1_1523,tf_rt1523g_big,160,30);

    ADD_OVERRIDE(TFAR_rt1523g_sage,TFAR_rt1523g,160,30); // 100, 120 - 5,3
    ADD_OVERRIDE(tf_rt1523g_sage,TFAR_rt1523g_sage,160,30);

    // OPXT_aor1_210: tf_anarc210 - maximumLoad = 280; mass = 50;
    // OPXT_rf7800m: tf_anarc210 - maximumLoad = 300; mass = 60;


    // ###################### ACE-Minedetector ######################
    // TODO: CUP Abhängigkeit
    /*#define SET_DETECTABLE(PARENT,CLASSES) class CLASSES : PARENT {ace_minedetector_detectable = 1;}

    class Small_items_NoInteractive;
    class Items_base_F;
    class House_Small_F;
    class House;
    class Strategic;

    //SET_DETECTABLE(Small_items_NoInteractive, Explosive);
    SET_DETECTABLE(Items_base_F, Land_MetalBarrel_F);
    SET_DETECTABLE(House_Small_F, Land_MetalBarrel_empty_F);
    SET_DETECTABLE(House, Land_popelnice);
    SET_DETECTABLE(House, Land_Kontejner);
    SET_DETECTABLE(Strategic, Garbage_can);
    SET_DETECTABLE(Strategic, Garbage_container);*/


    // ###################### Rucksäcke ######################
    class Bag_Base;
    class B_AssaultPack_Base : Bag_Base
    {
        maximumLoad = 106;
        mass = 13;
    };


    // ###################### No Uniform ######################
    class Civilian;
    class CAManBase;
    class B_Soldier_diver_base_F;
    class C_man_1;
    class I_G_Soldier_F;
    class I_G_Soldier_lite_F;
    class I_G_Soldier_SL_F;
    class I_G_Soldier_TL_F;
    class I_G_Soldier_AR_F;
    class I_G_medic_F;
    class I_G_engineer_F;
    class I_G_Soldier_exp_F;
    class I_G_Soldier_GL_F;
    class I_G_Soldier_M_F;
    class I_G_Soldier_LAT_F;
    class I_G_Soldier_A_F;
    class I_G_officer_F;
    class I_Soldier_diver_base_F;
    class O_Soldier_diver_base_F;
    class I_G_Sharpshooter_F;
    class B_Soldier_F;
    class I_C_Soldier_Para_2_F;
    class I_G_Soldier_LAT2_F;
    class I_crew_F;

    class Civilian_F: Civilian {
        modelSides[] = {6};
    };
    class SoldierWB: CAManBase {
        modelSides[] = {6};
    };
    class SoldierEB: CAManBase {
        modelSides[] = {6};
    };
    class SoldierGB: CAManBase {
        modelSides[] = {6};
    };
    class B_Soldier_base_F: SoldierWB {
        modelSides[] = {6};
    };
    class B_Soldier_02_f: B_Soldier_base_F {
        modelSides[] = {6};
    };
    class B_Soldier_03_f: B_Soldier_base_F {
        modelSides[] = {6};
    };
    class B_Soldier_04_f: B_Soldier_base_F {
        modelSides[] = {6};
    };
    class B_Soldier_05_f: B_Soldier_base_F {
        modelSides[] = {6};
    };
    class B_RangeMaster_F: B_Soldier_base_F {
        modelSides[] = {6};
    };
    class B_Helipilot_F: B_Soldier_04_f {
        modelSides[] = {6};
    };
    class B_Pilot_F: B_Soldier_05_f {
        modelSides[] = {6};
    };
    class B_helicrew_F: B_Helipilot_F {
        modelSides[] = {6};
    };
    class B_diver_F: B_Soldier_diver_base_F {
        modelSides[] = {6};
    };
    class B_Story_SF_Captain_F: B_Soldier_02_f {
        modelSides[] = {6};
    };
    class B_Story_Protagonist_F: B_Soldier_02_f {
        modelSides[] = {6};
    };
    class b_soldier_survival_F: B_Soldier_base_F {
        modelSides[] = {6};
    };
    class C_man_1_1_F: C_man_1 {
        modelSides[] = {6};
    };
    class C_man_p_fugitive_F: C_man_1 {
        modelSides[] = {6};
    };
    class C_man_p_beggar_F: C_man_p_fugitive_F {
        modelSides[] = {6};
    };
    class C_man_w_worker_F: C_man_1 {
        modelSides[] = {6};
    };
    class C_scientist_F: C_man_w_worker_F {
        modelSides[] = {6};
    };
    class C_man_hunter_1_F: C_man_1 {
        modelSides[] = {6};
    };
    class C_man_pilot_F: C_man_1 {
        modelSides[] = {6};
    };
    class C_journalist_F: C_man_1 {
        modelSides[] = {6};
    };
    class I_G_Soldier_base_F: SoldierGB {
        modelSides[] = {6};
    };
    class B_G_Soldier_F: I_G_Soldier_F {
        modelSides[] = {6};
    };
    class O_G_Soldier_F: I_G_Soldier_F {
        modelSides[] = {6};
    };
    class B_G_Soldier_lite_F: I_G_Soldier_lite_F {
        modelSides[] = {6};
    };
    class O_G_Soldier_lite_F: I_G_Soldier_lite_F {
        modelSides[] = {6};
    };
    class B_G_Soldier_SL_F: I_G_Soldier_SL_F {
        modelSides[] = {6};
    };
    class O_G_Soldier_SL_F: I_G_Soldier_SL_F {
        modelSides[] = {6};
    };
    class B_G_Soldier_TL_F: I_G_Soldier_TL_F {
        modelSides[] = {6};
    };
    class O_G_Soldier_TL_F: I_G_Soldier_TL_F {
        modelSides[] = {6};
    };
    class B_G_Soldier_AR_F: I_G_Soldier_AR_F {
        modelSides[] = {6};
    };
    class O_G_Soldier_AR_F: I_G_Soldier_AR_F {
        modelSides[] = {6};
    };
    class B_G_medic_F: I_G_medic_F {
        modelSides[] = {6};
    };
    class O_G_medic_F: I_G_medic_F {
        modelSides[] = {6};
    };
    class B_G_engineer_F: I_G_engineer_F {
        modelSides[] = {6};
    };
    class O_G_engineer_F: I_G_engineer_F {
        modelSides[] = {6};
    };
    class B_G_Soldier_exp_F: I_G_Soldier_exp_F {
        modelSides[] = {6};
    };
    class O_G_Soldier_exp_F: I_G_Soldier_exp_F {
        modelSides[] = {6};
    };
    class B_G_Soldier_GL_F: I_G_Soldier_GL_F {
        modelSides[] = {6};
    };
    class O_G_Soldier_GL_F: I_G_Soldier_GL_F {
        modelSides[] = {6};
    };
    class B_G_Soldier_M_F: I_G_Soldier_M_F {
        modelSides[] = {6};
    };
    class O_G_Soldier_M_F: I_G_Soldier_M_F {
        modelSides[] = {6};
    };
    class B_G_Soldier_LAT_F: I_G_Soldier_LAT_F {
        modelSides[] = {6};
    };
    class O_G_Soldier_LAT_F: I_G_Soldier_LAT_F {
        modelSides[] = {6};
    };
    class B_G_Soldier_A_F: I_G_Soldier_A_F {
        modelSides[] = {6};
    };
    class O_G_Soldier_A_F: I_G_Soldier_A_F {
        modelSides[] = {6};
    };
    class B_G_officer_F: I_G_officer_F {
        modelSides[] = {6};
    };
    class O_G_officer_F: I_G_officer_F {
        modelSides[] = {6};
    };
    class I_G_Story_SF_Captain_F: B_G_Soldier_F {
        modelSides[] = {6};
    };
    class I_Soldier_base_F: SoldierGB {
        modelSides[] = {6};
    };
    class I_Soldier_03_F: I_Soldier_base_F {
        modelSides[] = {6};
    };
    class I_Soldier_04_F: I_Soldier_base_F {
        modelSides[] = {6};
    };
    class I_officer_F: I_Soldier_base_F {
        modelSides[] = {6};
    };
    class I_diver_F: I_Soldier_diver_base_F {
        modelSides[] = {6};
    };
    class O_Soldier_base_F: SoldierEB {
        modelSides[] = {6};
    };
    class O_Soldier_02_F: O_Soldier_base_F {
        modelSides[] = {6};
    };
    class O_officer_F: O_Soldier_base_F {
        modelSides[] = {6};
    };
    class O_diver_F: O_Soldier_diver_base_F {
        modelSides[] = {6};
    };
    class C_Driver_1_F: C_man_1 {
        modelSides[] = {6};
    };
    class C_Marshal_F: B_RangeMaster_F {
        modelSides[] = {6};
    };
    class B_Soldier_VR_F: B_Soldier_base_F {
        modelSides[] = {6};
    };
    class O_Soldier_VR_F: O_Soldier_base_F {
        modelSides[] = {6};
    };
    class I_Soldier_VR_F: I_Soldier_base_F {
        modelSides[] = {6};
    };
    class C_Soldier_VR_F: C_man_1 {
        modelSides[] = {6};
    };
    class B_Protagonist_VR_F: B_Soldier_base_F {
        modelSides[] = {6};
    };
    class O_Protagonist_VR_F: O_Soldier_base_F {
        modelSides[] = {6};
    };
    class I_Protagonist_VR_F: I_Soldier_base_F {
        modelSides[] = {6};
    };
    class C_Protagonist_VR_F: C_man_1 {
        modelSides[] = {6};
    };
    class B_G_Sharpshooter_F: I_G_Sharpshooter_F {
        modelSides[] = {6};
    };
    class O_G_Sharpshooter_F: I_G_Sharpshooter_F {
        modelSides[] = {6};
    };
    class B_Captain_Pettka_F: B_Soldier_02_f {
        modelSides[] = {6};
    };
    class B_Captain_Jay_F: B_Soldier_02_f {
        modelSides[] = {6};
    };
    class I_Captain_Hladas_F: I_officer_F {
        modelSides[] = {6};
    };
    class Underwear_F: B_Soldier_F {
        modelSides[] = {6};
    };
    class B_G_Captain_Ivan_F: I_C_Soldier_Para_2_F {
        modelSides[] = {6};
    };
    class C_man_sport_1_F: C_man_1 {
        modelSides[] = {6};
    };
    class C_man_sport_2_F: C_man_1 {
        modelSides[] = {6};
    };
    class C_man_sport_3_F: C_man_1 {
        modelSides[] = {6};
    };
    class C_Man_casual_1_F: C_man_1 {
        modelSides[] = {6};
    };
    class C_IDAP_Man_Base_F: Civilian_F {
        modelSides[] = {6};
    };
    class O_A_soldier_base_F: O_officer_F {
        modelSides[] = {6};
    };
    class B_G_Soldier_LAT2_F: I_G_Soldier_LAT2_F {
        modelSides[] = {6};
    };
    class O_G_Soldier_LAT2_F: I_G_Soldier_LAT2_F {
        modelSides[] = {6};
    };
    class I_Story_Crew_F: I_crew_F {
        modelSides[] = {6};
    };
};
