class CBA_Extended_EventHandlers;

class CfgVehicles
{
    // ###################### Makros ######################
    #define ADD_RUFNAME(NAME) class _xx_##NAME \
        { \
            displayName = #NAME; \
            statement = "(group ACE_player) setGroupIdGlobal ['NAME']"; \
            exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"}; \
        }
    #define ADD_FOB(NAME, NUMBER) class TB_spezial_fob##NAME : TB_spezial_fobBase \
        { \
            displayName = "NAME-FOB"; \
            fobNumber = NUMBER; \
            scope = 2; \
            scopeCurator = 2; \
            class ACE_Actions \
            { \
                class ACE_MainActions \
                { \
                    displayName = "TB-FOB"; \
                    distance = 10; \
                    modifierFunction = "[_this] call TB_fnc_modifierFOBs"; \
                    statement = "_action = false"; \
                    runOnHover = 1; \
                }; \
            }; \
        }
    #define ADD_SIGN(NAME) class TB_editor_g##NAME: TB_editor_gBriefing \
    { \
        displayName = "NAME (groß)"; \
        hiddenSelectionsTextures[] = {"\TBMod_main\pics\NAME.paa"}; \
    }; \
    class TB_editor_k##NAME: TB_editor_kBriefing \
    { \
        displayName = "NAME (klein)"; \
        hiddenSelectionsTextures[] = {"\TBMod_main\pics\NAME.paa"}; \
    }
    
    // ###################### Boards ######################    
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
        
        hiddenSelectionsTextures[] = {"\TBMod_main\pics\rufnamen.paa"};
        
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
                    
                    ADD_RUFNAME(Angel);
                    ADD_RUFNAME(Phantom);
                    ADD_RUFNAME(Ghost);
                    ADD_RUFNAME(Reaper);
                    ADD_RUFNAME(Pegasus);
                    ADD_RUFNAME(NightHawk);
                    ADD_RUFNAME(Wuestenfuchs);
                    ADD_RUFNAME(Fox);
                    ADD_RUFNAME(Foxy);
                };
                
                class trupp2
                {
                    displayName = "Trupp2";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    
                    ADD_RUFNAME(Alpha2);
                    ADD_RUFNAME(Bravo2);
                    ADD_RUFNAME(Charlie2);
                    ADD_RUFNAME(Delta2);
                    ADD_RUFNAME(Echo2);
                    ADD_RUFNAME(Foxtrott2);
                    ADD_RUFNAME(Gamma2);
                };
                
                class special2
                {
                    displayName = "Spezial2";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    
                    // http://henney.com/chm/callsign.htm
                    ADD_RUFNAME(Atlas);
                    ADD_RUFNAME(Badger);
                    ADD_RUFNAME(Cobra);
                    ADD_RUFNAME(Dallas);
                    ADD_RUFNAME(Eagle);
                    ADD_RUFNAME(Falcon);
                    ADD_RUFNAME(Gremlin);
                    ADD_RUFNAME(Hammer);
                    ADD_RUFNAME(Havoc);
                    ADD_RUFNAME(Inferno);
                    ADD_RUFNAME(Jaguar);
                    ADD_RUFNAME(Karma);
                    ADD_RUFNAME(Wolf);
                    ADD_RUFNAME(Killjoy);
                    ADD_RUFNAME(Lunar);
                    ADD_RUFNAME(Manta);
                };
            };
        };
    };
    
    class TB_flag_teleportBase : TB_spezial_base
    {
        displayName = "TeleportBase";
        
        scope = 2;
        scopeCurator = 2;
        
        hiddenSelectionsTextures[] = {"\TBMod_main\pics\teleport.paa"};
        
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
                    insertChildren = "_this call TB_fnc_insertChildrenFOB";
                };
                
                class truppe
                {
                    displayName = "Trupp";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    
                    class toLeader
                    {
                        displayName = "Truppführer";
                        statement = "if (leader ACE_player != ACE_player) then {[leader ACE_player] spawn TB_fnc_teleport} else {systemChat 'Du bist Truppführer, deswegen ist das Teleporten nicht zu Dir möglich!'}";
                        exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    };
                    
                    class toSpieler
                    {
                        displayName = "Kameraden";
                        statement = "[] spawn TB_fnc_actionTeleportKamerad";
                        exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                        insertChildren = "_this call TB_fnc_insertChildrenKameraden";
                    };
                };
                
                class gruppen
                {
                    displayName = "Truppen";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    insertChildren = "_this call TB_fnc_insertChildrenGruppen";
                };
            };
        };
    };
    
    // ###################### FOBs ######################
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
    
    
    // ###################### Zeus Module ######################
    class Module_F;
    class TB_zeus_base : Module_F
    {
        scope = 1;
        scopeCurator = 1;
        
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        curatorCanAttach = 0;
        
        function = "ace_common_fnc_dummy";
        author = "shukari";
        category = "TB_categorie";
    };
    class TB_zeus_nachschubAbwurf : TB_zeus_base
    {
        scopeCurator = 2;
        displayName = "NachschubAbwurf";
        function = "TB_fnc_moduleNachschubAbwurf";
    };
    class TB_zeus_disablePath : TB_zeus_base
    {
        scope = 2;
        scopeCurator = 2;
        curatorCanAttach = 1;
        displayName = "DisablePath 4 Group";
        function = "TB_fnc_moduleDisablePath";
    };
    class TB_zeus_prioSichtbarkeit : TB_zeus_base
    {
        scopeCurator = 2;
        displayName = "PrioSichtbarkeit";
        function = "TB_fnc_modulePrioSichtbarkeit";
    };
    
    
    // ###################### Schilder ######################
    class SignAd_Sponsor_F;
    class Land_Noticeboard_F;
    class TB_editor_gBriefing: SignAd_Sponsor_F // ### große Schilder
    {
        author = "TacticalBacon";
        editorCategory = "EdCat_TB_MainCat";
        editorSubcategory = "EdSubcat_TB_BriefingBereich";
        
        displayName = "Briefing (groß)";
        hiddenSelectionsTextures[] = {"\TBMod_main\pics\briefing.paa"};
    };
    class TB_editor_kBriefing: Land_Noticeboard_F // ### kleine Schilder
    {
        author = "TacticalBacon";
        editorCategory = "EdCat_TB_MainCat";
        editorSubcategory = "EdSubcat_TB_BriefingBereich";
        
        displayName = "Briefing (klein)";
        hiddenSelectionsTextures[] = {"\TBMod_main\pics\briefing.paa"};
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
    class TFAR_Bag_Base;
    class TFAR_rt1523g: TFAR_Bag_Base
    {
        maximumLoad = 80; // 50
        mass = 15; // 80
    };
    class TFAR_rt1523g_big: TFAR_rt1523g
    {
        maximumLoad = 160; // 160
        mass = 30; // 160
    };
    class TFAR_rt1523g_sage: TFAR_rt1523g
    {
        maximumLoad = 117; // 100
        mass = 22; // 120
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
    class B_G_Sharpshooter_F: I_G_Sharpshooter_F {
        modelSides[] = {6};
    };
    class O_G_Sharpshooter_F: I_G_Sharpshooter_F {
        modelSides[] = {6};
    };
    class Underwear_F: B_Soldier_F {
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
};