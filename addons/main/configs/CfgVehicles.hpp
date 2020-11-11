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
            statement = QUOTE(systemChat ('RUFNAME wurde als Rufname gesetzt!'); (group ACE_player) setGroupIdGlobal ['RUFNAME']); \
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

        hiddenSelectionsTextures[] = {QPATHTOF(pics\rufnamen.paa)};

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
                    // http://udxf.nl/MCL.pdf - neuer
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
                    ADD_RUFNAME_DETAIL(wermut91, Wedge);
                    ADD_RUFNAME_DETAIL(Lugopa, Lynx);
                };
            };
        };
    };

    class TB_flag_teleportBase : TB_spezial_base
    {
        displayName = "TeleportBase";

        scope = 2;
        scopeCurator = 2;

        hiddenSelectionsTextures[] = {QPATHTOF(pics\teleport.paa)};

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
                        statement = QUOTE(if (leader ACE_player != ACE_player) then {[leader ACE_player] call FUNC(teleport)} else {systemChat 'Du bist Truppführer, deswegen ist das Teleporten nicht zu Dir möglich!'});
                        exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    };

                    class toSpieler
                    {
                        displayName = "Kameraden";
                        statement = QUOTE(call FUNC(actionTeleportKamerad));
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
};
