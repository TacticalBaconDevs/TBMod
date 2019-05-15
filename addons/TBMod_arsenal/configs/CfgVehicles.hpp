/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgVehicles
{
    // ###################### Makros ######################
    #define ADD_ROLLE(ROLLEN_NAME) \
        class rolle##ROLLEN_NAME \
        { \
            displayName = ""; \
            modifierFunction = QUOTE([_this, 'ROLLEN_NAME'] call FUNC(modifierRollenname)); \
            statement = QUOTE(['ROLLEN_NAME', getText (configFile >> 'CfgVehicles' >> typeOf _target >> 'arsenalType'), _target] call FUNC(changeRolle); [_target, _player] call ace_arsenal_fnc_openBox;); \
            exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"}; \
        }
    #define ADD_ROLLE_CUSTOM(ROLLEN_NAME) \
        class rolle##ROLLEN_NAME \
        { \
            displayName = ""; \
            condition = QUOTE(!('ROLLEN_NAME' in TB_blacklistRollen_custom)); \
            modifierFunction = QUOTE([_this, 'ROLLEN_NAME'] call FUNC(modifierRollenname)); \
            statement = QUOTE(['ROLLEN_NAME', getText (configFile >> 'CfgVehicles' >> typeOf _target >> 'arsenalType'), _target] call FUNC(changeRolle)); \
            exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"}; \
        }
    #define ADD_ROLLE_THEMEN(ROLLEN_NAME) \
        class rolle##ROLLEN_NAME \
        { \
            displayName = ""; \
            condition = QUOTE(!('ROLLEN_NAME' in TB_blacklistRollen_themen)); \
            modifierFunction = QUOTE([_this, 'ROLLEN_NAME'] call FUNC(modifierRollenname)); \
            statement = QUOTE(['ROLLEN_NAME', getText (configFile >> 'CfgVehicles' >> typeOf _target >> 'arsenalType'), _target] call FUNC(changeRolle); [_target, _player] call ace_arsenal_fnc_openBox;); \
            exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"}; \
        }
    #define MAKE_PUBLIC(D_NAME,A_TYPE) displayName = #D_NAME; \
        arsenalType = #A_TYPE; \
        scope = 2; \
        scopeCurator = 2


    // ###################### ArsenalBoxes ######################
    class C_IDAP_supplyCrate_F;
    class TB_arsenal_base : C_IDAP_supplyCrate_F
    {
        displayName = "BASE";
        author = "shukari";

        arsenalType = "";

        editorCategory = "EdCat_TB_MainCat";
        editorSubcategory = "EdSubcat_TB_Arsenal";

        scope = 1;
        scopeCurator = 1;

        disableInventory = 1;

        ace_cargo_canLoad = 0;
        DLC = "";

        class TransportItems {};
        class TransportMagazines {};
        class TransportWeapons {};
        class TransportBackpacks {};

        class ACE_Actions
        {
            class ACE_MainActions
            {
                displayName = "Interaktionen";
                modifierFunction = "[_this] call FUNC(modifierMainAction)";
                statement = "[_this] call FUNC(actionMain)";
                runOnHover = 1;
                distance = 6;

                class changeArsenalType
                {
                    displayName = "Wechsel zu...";
                    modifierFunction = "[_this, getText (configFile >> 'CfgVehicles' >> typeOf _target >> 'arsenalType')] call FUNC(modifierChangeArsenalType)";
                    statement = "_player setVariable ['TB_arsenalType', getText (configFile >> 'CfgVehicles' >> typeOf _target >> 'arsenalType'), true]; _player setVariable ['TB_rolle', nil, true]; _player setVariable ['TB_arsenalCargo', nil]";
                    condition = "!([_target] call FUNC(isArsenalType))";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    priority = 1;
                };

                class openArsenal
                {
                    displayName = "Öffne Arsenal";
                    statement = "[_target, _player] call ace_arsenal_fnc_openBox";
                    condition = "!isNil {_target getVariable 'ace_arsenal_virtualItems'} && [_target] call FUNC(isArsenalType)";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    priority = 1;
                };

                class rollen
                {
                    displayName = "Rollen";
                    condition = "[_target] call FUNC(isArsenalType)";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    priority = 3;

                    ADD_ROLLE(lead);
                    ADD_ROLLE(grena);
                    ADD_ROLLE(sani);
                    ADD_ROLLE(mg);
                    ADD_ROLLE(spreng);
                    ADD_ROLLE(aaat);
                    ADD_ROLLE(trag);
                    ADD_ROLLE(dmr);
                    ADD_ROLLE(pilot);
                    ADD_ROLLE(sniper);
                    ADD_ROLLE(spotter);
                    ADD_ROLLE(jtac);
                    ADD_ROLLE(arzt);
                    ADD_ROLLE(rifle);
                    ADD_ROLLE(pionier);
                };
            };
        };
    };

    class TB_arsenal_usa : TB_arsenal_base
    {
        MAKE_PUBLIC(USA,USA);
        hiddenSelectionsTextures[] = {"\TBMod_arsenal\pics\Arsenal_USA.paa"};
    };

    class TB_arsenal_vanilla : TB_arsenal_base
    {
        MAKE_PUBLIC(Vanilla,VANILLA);
        hiddenSelectionsTextures[] = {"\TBMod_arsenal\pics\Arsenal_NATO.paa"};
    };

    class TB_arsenal_bw : TB_arsenal_base
    {
        MAKE_PUBLIC(Bundeswehr,BW);
        hiddenSelectionsTextures[] = {"\TBMod_arsenal\pics\Arsenal_Bw.paa"};
    };

    class TB_arsenal_russ : TB_arsenal_base
    {
        MAKE_PUBLIC(Russland,RUSS);
        hiddenSelectionsTextures[] = {"\TBMod_arsenal\pics\Arsenal_Russland.paa"};
    };

    // ###################### SpezialArsenale ######################
    class TB_arsenal_themen : TB_arsenal_base
    {
        MAKE_PUBLIC(Themen,Themen);

        class ACE_Actions : ACE_Actions
        {
            class ACE_MainActions : ACE_MainActions
            {
                class openArsenal : openArsenal {};

                class rollen : rollen
                {
                    ADD_ROLLE_THEMEN(lead);
                    ADD_ROLLE_THEMEN(grena);
                    ADD_ROLLE_THEMEN(sani);
                    ADD_ROLLE_THEMEN(mg);
                    ADD_ROLLE_THEMEN(spreng);
                    ADD_ROLLE_THEMEN(aaat);
                    ADD_ROLLE_THEMEN(trag);
                    ADD_ROLLE_THEMEN(dmr);
                    ADD_ROLLE_THEMEN(pilot);
                    ADD_ROLLE_THEMEN(sniper);
                    ADD_ROLLE_THEMEN(spotter);
                    ADD_ROLLE_THEMEN(jtac);
                    ADD_ROLLE_THEMEN(arzt);
                    ADD_ROLLE_THEMEN(rifle);
                    ADD_ROLLE_THEMEN(pionier);
                };
            };
        };
    };
    class TB_arsenal_predefined_custom : TB_arsenal_base
    {
        MAKE_PUBLIC(Vordefiniert Custom,CUSTOM);

        class ACE_Actions : ACE_Actions
        {
            class ACE_MainActions : ACE_MainActions
            {
                class openArsenal : openArsenal {};

                class rollen : rollen
                {
                    ADD_ROLLE_CUSTOM(lead);
                    ADD_ROLLE_CUSTOM(grena);
                    ADD_ROLLE_CUSTOM(sani);
                    ADD_ROLLE_CUSTOM(mg);
                    ADD_ROLLE_CUSTOM(spreng);
                    ADD_ROLLE_CUSTOM(aaat);
                    ADD_ROLLE_CUSTOM(trag);
                    ADD_ROLLE_CUSTOM(dmr);
                    ADD_ROLLE_CUSTOM(pilot);
                    ADD_ROLLE_CUSTOM(sniper);
                    ADD_ROLLE_CUSTOM(spotter);
                    ADD_ROLLE_CUSTOM(jtac);
                    ADD_ROLLE_CUSTOM(arzt);
                    ADD_ROLLE_CUSTOM(rifle);
                    ADD_ROLLE_CUSTOM(pionier);
                };
            };
        };
    };
};
