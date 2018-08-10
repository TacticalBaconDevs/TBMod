params ["_target", "_type", "_spawn"];

private _action = ["autoGarage", ["Flugzeug", "Fahrzeuggarage"] select (_type == "auto"), "", {
        (_this select 2) params ["_target", "_type", "_spawn"];
        BIS_fnc_garage_center = _spawn;
        
        private _vehiclesOnPoint = nearestObjects [_spawn, ["Car", "Tank", "Air", "Ship"], 10];
        
        if (count _vehiclesOnPoint > 0) then {
            private _veh = _vehiclesOnPoint select 0;
            diag_log format ["### DEBUG11: veh#0 -> %1", typeOf _veh];
            missionnamespace setvariable ["BIS_fnc_garage_center", _veh];
            missionnamespace setvariable ["bis_fnc_garage_centerType", typeOf _veh];
            missionnamespace setvariable ["BIS_fnc_arsenal_center", _veh];
        };
        
        // if (count _vehiclesOnPoint > 1) then {
            // {deleteVehicle _x} forEach _vehiclesOnPoint;
        // };
        
        BIS_fnc_garage_data = (if (_type == "auto") then {
            uiNamespace setVariable ["bis_fnc_garage_defaultClass", "rhsusf_m1025_w_m2"];
            [
                //CAR
                [
                    "\rhsusf\addons\rhsusf_hmmwv\rhsusf_m1025_m2",[configFile >> "cfgVehicles" >> "rhsusf_m1025_w_m2"],
                    "\rhsusf\addons\rhsusf_hmmwv\rhsusf_m1025",[configFile >> "cfgVehicles" >> "rhsusf_m1025_w"],
                    "\rhsusf\addons\rhsusf_hmmwv\rhsusf_m998_2dr",[configFile >> "cfgVehicles" >> "rhsusf_m998_w_2dr_fulltop"],
                    "\rhsusf\addons\rhsusf_hmmwv\rhsusf_m998_4dr",[configFile >> "cfgVehicles" >> "rhsusf_m998_w_4dr_fulltop"],
                    "\rhsusf\addons\rhsusf_fmtv\m1078a1p2",[configFile >> "cfgVehicles" >> "rhsusf_M1078A1P2_WD_fmtv_usarmy"],
                    "\rhsusf\addons\rhsusf_fmtv\m1078a1p2_b_m2",[configFile >> "cfgVehicles" >> "rhsusf_M1078A1P2_B_M2_WD_fmtv_usarmy"],
                    "\rhsusf\addons\rhsusf_caiman\m1220_m153_m2",[configFile >> "cfgVehicles" >> "rhsusf_M1220_M153_M2_usarmy_wd"],
                    "\rhsusf\addons\rhsusf_rg33l\m1232_m2",[configFile >> "cfgVehicles" >> "rhsusf_M1232_M2_usarmy_wd"]
                ],
                //ARMOR
                [
                    "\rhsusf\addons\rhsusf_a2port_armor\m2a2_bradley\m2a3_era2",[configFile >> "cfgVehicles" >> "RHS_M2A3_BUSKIII_wd"],
                    "\rhsusf\addons\rhsusf_m113\m113a3_m2",[configFile >> "cfgVehicles" >> "rhsusf_m113_usarmy"],
                    "\rhsusf\addons\rhsusf_m113\m113a3_unarmed",[configFile >> "cfgVehicles" >> "rhsusf_m113_usarmy_unarmed"]
                ],
                [],        //HELIS
                [],        //PLANES
                [],        //NAVAL
                []        //STATICS
            ]
        } else {
            uiNamespace setVariable ["bis_fnc_garage_defaultClass", "RHS_MELB_MH6M"];
            [
                [],        //CAR
                [],        //ARMOR
                //HELIS
                [
                    "\rhsusf\addons\rhsusf_a2port_air\ah64\ah64d",[configFile >> "cfgVehicles" >> "RHS_AH64D_wd"],
                    "\rhsusf\addons\rhsusf_a2port_air\ch47\ch_47f",[configFile >> "cfgVehicles" >> "RHS_CH_47F"],
                    "\rhsusf\addons\rhsusf_a2port_air\uh60m\uh60m.p3d",[configFile >> "cfgVehicles" >> "RHS_UH60M"],
                    "\rhsusf\addons\rhsusf_a2port_air\uh60m\uh60m_mev.p3d",[configFile >> "cfgVehicles" >> "RHS_UH60M_MEV2"],
                    "rhsusf\addons\rhsusf_melb\melb.p3d:RHS_MELB_AH6M",[configFile >> "cfgVehicles" >> "RHS_MELB_AH6M"],
                    "rhsusf\addons\rhsusf_melb\melb.p3d:RHS_MELB_MH6M",[configFile >> "cfgVehicles" >> "RHS_MELB_MH6M"],
                    "rhsusf\addons\rhsusf_melb\melb.p3d",[configFile >> "cfgVehicles" >> "RHS_MELB_H6M"]
                ],
                [],        //PLANES
                [],        //NAVAL
                []
            ]
        });
        
        missionnamespace setvariable ["BIS_fnc_garage_data",BIS_fnc_garage_data];
        missionnamespace setvariable ["BIS_fnc_garage_center",BIS_fnc_garage_center];
        missionnamespace setvariable ["BIS_fnc_arsenal_fullGarage",true];
        
        ["Open", [true, _spawn]] call TB_fnc_garage;
    }, {true}, nil, _this, nil, 10] call ace_interact_menu_fnc_createAction;
[_target, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
