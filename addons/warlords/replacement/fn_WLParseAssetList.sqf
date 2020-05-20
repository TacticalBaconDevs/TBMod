// --- set up purchase menu variables

_target = _this;
_totalArr = [];
{
    _type = _x;
    _entries = [];
    if (typeName _target == typeName sideUnknown) then {
        {
            _entries append (configProperties [configFile >> "CfgWLRequisitionPresets" >> _x >> str _target >> _type]) + (configProperties [missionConfigFile >> "CfgWLRequisitionPresets" >> _x >> str _target >> _type]);
        } forEach BIS_WL_shoppingList;
    } else {
        {
            _entries append (configProperties [configFile >> "CfgWLRequisitionPresets" >> _x >> str (side group _target) >> _type]) + (configProperties [missionConfigFile >> "CfgWLRequisitionPresets" >> _x >> str (side group _target) >> _type]);
        } forEach (_target getVariable "BIS_WL_requisitionPreset");
    };
    _typeArr = [];
    if (_type == "Gear") then {
        if (BIS_WL_arsenalEnabled == 1) then {
            _typeArr pushBack ["Arsenal", BIS_WL_arsenalCost, [], "< " + (localize "STR_A3_Arsenal") + " >", "\A3\Data_F_Warlords\Data\preview_arsenal.jpg", localize "STR_A3_WL_arsenal_open", "Gear"];
        };
        _typeArr pushBack ["LastLoadout", BIS_WL_lastLoadoutCost, [], "< " + (localize "STR_A3_WL_last_loadout") + " >", "\A3\Data_F_Warlords\Data\preview_loadout.jpg", localize "STR_A3_WL_last_loadout_info", "Gear"];
    };
    {
        _entryClass = configName _x;
        _req = getArray (_x >> "requirements");
        if (getNumber (BIS_WL_cfgVehs >> _entryClass >> "scope") != 2) then {["Warning: class '%1' doesn't have public scope!", _entryClass] call BIS_fnc_WLdebug;};
        if (_req findIf {!(_x in BIS_WL_scenarioServices)} == -1) then {
            _arr = [];
            _arr pushBack _entryClass;
            _cost_custom = getNumber (missionConfigFile >> "CfgWLAssetCostOverride" >> _entryClass);
            if (_cost_custom > 0) then {
                _arr pushBack _cost_custom;
            } else {
                _arr pushBack getNumber (_x >> "cost");
            };
            _arr pushBack _req;
            _arr pushBack getText (BIS_WL_cfgVehs >> _entryClass >> "displayName");
            _arr pushBack getText (BIS_WL_cfgVehs >> _entryClass >> "editorPreview");
            _text = "";
            if (_type == "Infantry") then {
                _wpns = getArray (BIS_WL_cfgVehs >> _entryClass >> "weapons");
                _wpnArrPrimary = _wpns select {getNumber (BIS_WL_cfgWpns >> _x >> "type") == 1};
                _wpnArrSecondary = _wpns select {getNumber (BIS_WL_cfgWpns >> _x >> "type") == 4};
                _wpnArrHandgun = _wpns select {getNumber (BIS_WL_cfgWpns >> _x >> "type") == 2};
                _wpn = if (count _wpnArrSecondary > 0) then {
                    _wpnArrSecondary # 0;
                } else {
                    if (count _wpnArrPrimary > 0) then {
                        _wpnArrPrimary # 0;
                    } else {
                        if (count _wpnArrHandgun > 0) then {
                            _wpnArrPrimary # 0;
                        } else {
                            ""
                        };
                    };
                };
                {
                    _text = _text + (getText (BIS_WL_cfgWpns >> _x >> "displayName")) + "<br/>";
                } forEach (_wpnArrPrimary + _wpnArrSecondary + _wpnArrHandgun);
                _text = _text + "<br/>";
                _linked = getArray (BIS_WL_cfgVehs >> _entryClass >> "linkedItems");
                if (count _linked > 0) then {
                    _text = _text + (getText (BIS_WL_cfgWpns >> _linked # 0 >> "displayName")) + "<br/>";
                };
                _backpack = getText (BIS_WL_cfgVehs >> _entryClass >> "backpack");
                if (_backpack != "") then {_text = _text + (getText (BIS_WL_cfgVehs >> _backpack >> "displayName"))};
            };
            if (_type in ["Vehicles", "Defences", "Aircraft", "Naval"]) then {
                _text = getText (BIS_WL_cfgVehs >> _entryClass >> "Library" >> "LibTextDesc");    // --- the texts should just all be here
                if (_text == "") then {_text = getText (BIS_WL_cfgVehs >> _entryClass >> "Armory" >> "description")};    // --- why are some of them here
                if (_text == "") then {    // --- some are not even there
                    _validClassArr = "toLower getText (_x >> 'vehicle') == toLower _entryClass" configClasses BIS_WL_cfgHints;
                    if (count _validClassArr > 0) then {
                        _hintLibClass = ("toLower getText (_x >> 'vehicle') == toLower _entryClass" configClasses BIS_WL_cfgHints) # 0;    // --- who thought of this omg
                        _text = getText (_hintLibClass >> "description");    // --- the fun does not stop here though
                        if (count _text > 0) then {
                            if (((toArray _text) # 0) == 37) then {     // --- yes that can happen
                                _text = localize (((getArray (_hintLibClass >> "arguments")) # 1) # 0);    // --- WHYYYYY???!!!!
                            };
                        };
                    };
                };
            };
            if (_type == "Gear") then {
                _transportWeapons = (BIS_WL_cfgVehs >> _entryClass >> "TransportWeapons");
                _weaponsCnt = (count _transportWeapons);
                for [{_i = 0}, {_i < _weaponsCnt}, {_i = _i + 1}] do {
                    _item = getText ((_transportWeapons select _i) >> "weapon");
                    _text = _text + format ["%3%2x %1", getText (BIS_WL_cfgWpns >> _item >> "displayName"), getNumber ((_transportWeapons select _i) >> "count"), if (_text == "") then {""} else {", "}];
                };
                _transportItems = (BIS_WL_cfgVehs >> _entryClass >> "TransportItems");
                _itemsCnt = (count _transportItems);
                for [{_i = 0}, {_i < _itemsCnt}, {_i = _i + 1}] do {
                    _item = getText ((_transportItems select _i) >> "name");
                    _text = _text + format ["%3%2x %1", getText (BIS_WL_cfgWpns >> _item >> "displayName"), getNumber ((_transportItems select _i) >> "count"), if (_text == "") then {""} else {", "}];
                };
                _transportMags = (BIS_WL_cfgVehs >> _entryClass >> "TransportMagazines");
                _magsCnt = (count _transportMags);
                for [{_i = 0}, {_i < _magsCnt}, {_i = _i + 1}] do {
                    _item = getText ((_transportMags select _i) >> "magazine");
                    _text = _text + format ["%3%2x %1", getText (BIS_WL_cfgMags >> _item >> "displayName"), getNumber ((_transportMags select _i) >> "count"), if (_text == "") then {""} else {", "}];
                };
                _transportBPacks = (BIS_WL_cfgVehs >> _entryClass >> "TransportBackpacks");
                _bPacksCnt = (count _transportBPacks);
                for [{_i = 0}, {_i < _bPacksCnt}, {_i = _i + 1}] do {
                    _item = getText ((_transportBPacks select _i) >> "backpack");
                    _text = _text + format ["%3%2x %1", getText (BIS_WL_cfgVehs >> _item >> "displayName"), getNumber ((_transportMags select _i) >> "count"), if (_text == "") then {""} else {", "}];
                };
            };
            if (_text != "") then {
                _textNew = (_text splitString "$") # 0;
                if (_textNew != _text) then {_text = localize _textNew} else {_text = _textNew};
            };
            _textSize = count _text;
            _textLimit = if (_type in ["Infantry", "Vehicles", "Defences", "Aircraft", "Naval"]) then {500} else {750};
            if (_textSize > _textLimit) then {
                _textArr = toArray _text;
                _textArr deleteRange [_textLimit, _textSize - _textLimit];
                _text = toString _textArr;
                if (_type in ["Infantry", "Vehicles", "Defences", "Aircraft", "Naval"]) then {
                    _text = _text + "...<br/><br/>" + localize "STR_A3_WL_menu_field_manual_tip";
                } else {
                    _text = _text + "..."
                };
            };
            if (_text == "") then {_text = " "};
            _arr pushBack _text;
            _arr pushBack _type;
            if (_type == "Gear_custom") then {
                _arr pushBack getText (_x >> "template");
                _arr pushBack getText (_x >> "displayName");
                _arr pushBack getNumber (_x >> "clear");
                _arr pushBack getArray (_x >> "weapons");
                _arr pushBack getArray (_x >> "magazines");
                _arr pushBack getArray (_x >> "items");
                _arr pushBack getArray (_x >> "backpacks");
            };
            if (_type == "Defences") then {
                _arr pushBack getArray (_x >> "offset");
            };
            _typeArr pushBack _arr;
        };
    } forEach _entries;
    _totalArr pushBack _typeArr;
} forEach ["Infantry", "Vehicles", "Gear", "Defences", "Aircraft", "Naval", "Gear_custom"];
_servicesArr = [];
if (BIS_WL_scanEnabled == 1) then {_servicesArr pushBack ["Scan", BIS_WL_scanCost, [], localize "STR_A3_WL_param4_title", "\A3\Data_F_Warlords\Data\preview_scan.jpg", localize "STR_A3_WL_menu_scan_info", "Services"]};
if (BIS_WL_FTEnabled in [1, 2, 4]) then {_servicesArr pushBack ["FTSeized", BIS_WL_FTCost, [], localize "STR_A3_WL_menu_fasttravel_seized", "\A3\Data_F_Warlords\Data\preview_ft_owned.jpg", localize "STR_A3_WL_menu_fasttravel_info", "Services"]};
if (BIS_WL_FTEnabled in [1, 2]) then {_servicesArr pushBack ["FTConflict", BIS_WL_FTCost, [], localize "STR_A3_WL_menu_fasttravel_conflict", "\A3\Data_F_Warlords\Data\preview_ft_conflict.jpg", localize "STR_A3_WL_menu_fasttravel_info", "Services"]};
_servicesArr pushBack ["FundsTransfer", BIS_WL_transferCost, [], localize "STR_A3_WL_menu_fundstransfer", "\A3\Data_F_Warlords\Data\preview_cp_transfer.jpg", localize "STR_A3_WL_menu_fundstransfer_info", "Services"];
if (BIS_WLVotingResetEnabled == 1) then {_servicesArr pushBack ["VotingReset", BIS_WL_votingResetCost, [], localize "STR_A3_WL_menu_resetvoting", "\A3\Data_F_Warlords\Data\preview_ft_conflict.jpg", localize "STR_A3_WL_menu_resetvoting_info", "Services"]};
//_servicesArr pushBack ["LockVehicles", 0, [], localize "STR_A3_WL_feature_lock_all", "\A3\Data_F_Warlords\Data\preview_empty.jpg", localize "STR_A3_WL_feature_lock_all", "Services"];
//_servicesArr pushBack ["UnlockVehicles", 0, [], localize "STR_A3_WL_feature_unlock_all", "\A3\Data_F_Warlords\Data\preview_empty.jpg", localize "STR_A3_WL_feature_unlock_all", "Services"];
_servicesArr pushBack ["RemoveUnits", 0, [], localize "STR_A3_WL_feature_dismiss_selected", "\A3\Data_F_Warlords\Data\preview_empty.jpg", localize "STR_A3_WL_feature_dismiss_selected", "Services"];
_totalArr pushBack _servicesArr;
if (typeName _target == typeName sideUnknown) then {
    missionNamespace setVariable [format ["BIS_WL_purchasable%1", _target], _totalArr];
} else {
    _target setVariable ["BIS_WL_purchasable", _totalArr];
};