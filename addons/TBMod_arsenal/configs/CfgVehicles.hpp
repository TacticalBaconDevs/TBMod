class CfgVehicles
{
    // ###################### Makros ######################
    #define ADD_ROLLE(ROLLEN_NAME) \
        class rolle##ROLLEN_NAME \
        { \
            displayName = ""; \
            modifierFunction = "[_this, 'ROLLEN_NAME'] call TB_fnc_modifierRollenname"; \
            statement = "['ROLLEN_NAME', getText (configFile >> 'CfgVehicles' >> typeOf _target >> 'arsenalType'), _target] call TB_fnc_changeRolle"; \
            exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"}; \
        }
    #define ADD_ROLLE_CUSTOM(ROLLEN_NAME) \
        class rolle##ROLLEN_NAME \
        { \
            displayName = ""; \
            condition = "!('ROLLEN_NAME' in TB_blacklistRollen)"; \
            modifierFunction = "[_this, 'ROLLEN_NAME'] call TB_fnc_modifierRollenname"; \
            statement = "['ROLLEN_NAME', getText (configFile >> 'CfgVehicles' >> typeOf _target >> 'arsenalType'), _target] call TB_fnc_changeRolle"; \
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
                modifierFunction = "[_this] call TB_fnc_modifierMainAction";
                statement = "[_this] call TB_fnc_actionMain";
                runOnHover = 1;
                distance = 6;
                
                class changeArsenalType
                {
                    displayName = "Wechsel zu...";
                    modifierFunction = "[_this, getText (configFile >> 'CfgVehicles' >> typeOf _target >> 'arsenalType')] call TB_fnc_modifierChangeArsenalType";
                    statement = "_player setVariable ['TB_arsenalType', getText (configFile >> 'CfgVehicles' >> typeOf _target >> 'arsenalType'), true]; _player setVariable ['TB_rolle', nil, true]; _player setVariable ['TB_arsenalCargo', nil]";
                    condition = "!([_target] call TB_fnc_isArsenalType)";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    priority = 1;
                };
                
                class openArsenal
                {
                    displayName = "Öffne Arsenal";
                    statement = "[_target, _player] call ace_arsenal_fnc_openBox";
                    condition = "!isNil {_target getVariable 'ace_arsenal_virtualItems'} && [_target] call TB_fnc_isArsenalType";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    priority = 1;
                };
                
                class rollen
                {
                    displayName = "Rollen";
                    condition = "[_target] call TB_fnc_isArsenalType";
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
        
        // hiddenSelectionsTextures[] = {"\a3\Supplies_F_Orange\Ammoboxes\Data\supplydrop_idap_co.paa"};
        // a3\weapons_f\ammoboxes\data\supplydrop_co.paa
    };
    
    class TB_arsenal_vanilla : TB_arsenal_base
    {
        MAKE_PUBLIC(Vanilla,VANILLA-BLUE);
        
        // hiddenSelectionsTextures[] = {"\a3\Supplies_F_Orange\Ammoboxes\Data\supplydrop_idap_co.paa"};
    };
    
    class TB_arsenal_bw : TB_arsenal_base
    {
        MAKE_PUBLIC(Bundeswehr,BW);
        
        // hiddenSelectionsTextures[] = {"\a3\Supplies_F_Orange\Ammoboxes\Data\supplydrop_idap_co.paa"};
    };
    
    class TB_arsenal_russ : TB_arsenal_base
    {
        MAKE_PUBLIC(Russland,RUSS);
        
        // hiddenSelectionsTextures[] = {"\a3\Supplies_F_Orange\Ammoboxes\Data\supplydrop_idap_co.paa"};
    };
    
    
    // ###################### SpezialKisten ######################
    class TB_arsenal_predefined_custom : C_IDAP_supplyCrate_F
    {
        displayName = "Vordefiniert Custom";
        author = "shukari";
        
        arsenalType = "CUSTOM";
        
        editorCategory = "EdCat_TB_MainCat";
        editorSubcategory = "EdSubcat_TB_Arsenal";
        
        scope = 2;
        scopeCurator = 2;

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
                modifierFunction = "[_this] call TB_fnc_modifierMainAction";
                statement = "_this call TB_fnc_actionMain";
                runOnHover = 1;
                distance = 6;
                
                class changeArsenalType
                {
                    displayName = "Wechsel zu...";
                    modifierFunction = "[_this, getText (configFile >> 'CfgVehicles' >> typeOf _target >> 'arsenalType')] call TB_fnc_modifierChangeArsenalType";
                    statement = "_player setVariable ['TB_arsenalType', getText (configFile >> 'CfgVehicles' >> typeOf _target >> 'arsenalType'), true]; _player setVariable ['TB_rolle', nil, true]; _player setVariable ['TB_arsenalCargo', nil]";
                    condition = "!([_target] call TB_fnc_isArsenalType)";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    priority = 1;
                };
                
                class rollen
                {
                    displayName = "Rollen";
                    condition = "[_target] call TB_fnc_isArsenalType";
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    priority = 3;
                    
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