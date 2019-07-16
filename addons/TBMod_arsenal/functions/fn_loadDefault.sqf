﻿#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
private _arsenalType = ACE_player getVariable ["TB_arsenalType", ""];
private _rolle = ACE_player getVariable ["TB_rolle", ""];

if (_arsenalType == "USA") exitWith
{
    private _layout = switch (_rolle) do
    {
        case "lead": {[[],[],[],["rhs_uniform_cu_ocp",[["ACE_Atropine",5],["ACE_MapTools",1],["ACE_CableTie",1],["ACE_tourniquet",4],["ACE_fieldDressing",15]]],["rhsusf_spcs_ocp_squadleader",[["ACE_HuntIR_M203",5,1],["TB_rhs_mag_40mm_HE",5,1],["rhs_mag_m67",2,1],["SmokeShellBlue",1,1],["rhs_mag_mk3a2",1,1]]],["OPXT_scorpion_1523",[["ACE_HuntIR_monitor",1],["SmokeShell",4,1]]],"rhsusf_ach_helmet_ocp","",["Laserdesignator","","","",["Laserbatteries",1],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ACE_Altimeter",""]]};
        case "grena": {[[],[],[],["rhs_uniform_cu_ocp",[["ACE_Atropine",5],["ACE_MapTools",1],["ACE_CableTie",1],["ACE_tourniquet",4],["ACE_fieldDressing",15]]],["rhsusf_spcs_ocp_grenadier",[["TB_rhs_mag_40mm_HE",6,1],["SmokeShellBlue",1,1],["rhs_mag_mk3a2",1,1],["TB_rhs_mag_40mm_HEDP",2,1],["rhs_mag_m67",2,1],["rhs_mag_m713_Red_precise",1,1]]],["rhsusf_assault_eagleaiii_ocp",[["SmokeShell",4,1],["3Rnd_Smoke_Grenade_shell_precise",1,3]]],"rhsusf_ach_helmet_ocp","",[],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ACE_Altimeter",""]]};
        case "sani": {[[],[],[],["rhs_uniform_cu_ocp",[["ACE_surgicalKit",1],["ACE_quikclot",25]]],["rhsusf_spcs_ocp_medic",[["ACE_elasticBandage",40],["ACE_packingBandage",40],["ACE_epinephrine",10],["ACE_atropine",15],["ACE_morphine",10],["ACE_adenosine",15],["ACE_tourniquet",10]]],["B_Kitbag_mcamo",[["ACE_plasmaIV",10],["ACE_plasmaIV_500",10],["ACE_plasmaIV_250",5],["adv_aceCPR_AED",1]]],"","",["m24_bino","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_6","ItemCompass","ACE_Altimeter",""]]};
        case "mg": {[["rhs_weap_m249_pip_L","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15A","rhsusf_acc_ACOG_RMR",["rhsusf_200rnd_556x45_mixed_box",200],[],""],[],[],["rhs_uniform_cu_ocp",[["ACE_fieldDressing",25],["ACE_adenosine",2],["ACE_atropine",9],["ACE_tourniquet",4]]],["rhsusf_spcs_ocp_machinegunner",[["ACE_EntrenchingTool",1],["ACE_MapTools",1],["ACE_Flashlight_KSF1",1],["rhsusf_200rnd_556x45_mixed_box",3,200],["SmokeShell",3,1]]],["rhsusf_assault_eagleaiii_ocp",[["ACE_salineIV",4],["rhsusf_200rnd_556x45_mixed_box",3,200],["SmokeShell",1,1]]],"rhsusf_ach_helmet_ocp","",["m24_bino","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_8","ItemCompass","ACE_Altimeter",""]]};
        case "spreng": {[["rhs_weap_hk416d10","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15A","rhsusf_acc_eotech_552",["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",30],[],"rhsusf_acc_harris_bipod"],[],[],["rhs_uniform_cu_ocp",[["ACE_fieldDressing",25],["ACE_adenosine",2],["ACE_atropine",9],["ACE_tourniquet",4]]],["rhsusf_spcs_ocp_rifleman",[["ACE_M26_Clacker",1],["ACE_Flashlight_KSF1",1],["ACE_MapTools",1],["ACE_CableTie",2],["ACE_DefusalKit",1],["ACE_wirecutter",1],["ACE_EntrenchingTool",1],["DemoCharge_Remote_Mag",4,1]]],["rhsusf_assault_eagleaiii_ocp",[["ACE_salineIV",4],["SmokeShell",4,1],["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",10,30]]],"rhsusf_ach_helmet_ocp","",["m24_bino","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_10","ItemCompass","ACE_Altimeter",""]]};
        case "aaat": {[["rhs_weap_hk416d10","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15A","rhsusf_acc_eotech_552",["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",30],[],"rhsusf_acc_harris_bipod"],["rhs_weap_smaw_green","","","rhs_weap_optic_smaw",["rhs_mag_smaw_HEAA",1],["rhs_mag_smaw_SR",5],""],[],["rhs_uniform_cu_ocp",[["ACE_fieldDressing",25],["ACE_tourniquet",4],["ACE_atropine",9],["ACE_adenosine",2]]],["rhsusf_spcs_ocp_saw",[["ACE_MapTools",1],["ACE_EntrenchingTool",1],["ACE_Flashlight_KSF1",1],["ACE_CableTie",2],["SmokeShell",4,1],["SmokeShellBlue",1,1],["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",10,30]]],["B_Carryall_cbr",[["ACE_salineIV",2],["rhs_mag_smaw_SR",3,5],["rhs_mag_smaw_HEAA",2,1]]],"rhsusf_ach_helmet_ocp","",["m24_bino","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ACE_Altimeter",""]]};
        case "trag": {[["rhs_weap_hk416d10","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15A","rhsusf_acc_eotech_552",["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",30],[],"rhsusf_acc_harris_bipod"],[],[],["rhs_uniform_cu_ocp",[["ACE_fieldDressing",25],["ACE_adenosine",2],["ACE_atropine",9],["ACE_tourniquet",4]]],["rhsusf_spcs_ocp_machinegunner",[["ACE_EntrenchingTool",1],["ACE_MapTools",1],["ACE_CableTie",2],["ACE_Flashlight_KSF1",1],["ACE_salineIV",1],["SmokeShell",4,1],["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",10,30]]],["B_Carryall_cbr",[["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",11,30],["rhsusf_200rnd_556x45_mixed_box",2,200],["rhs_mag_smaw_HEAA",1,1]]],"rhsusf_ach_helmet_ocp","",["m24_bino","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_12","ItemCompass","ACE_Altimeter",""]]};
        case "dmr": {[["rhs_weap_sr25_d","rhsusf_acc_SR25S_d","rhsusf_acc_anpeq15A","rhsusf_acc_ACOG_MDO",["rhsusf_20Rnd_762x51_SR25_m62_Mag",20],[],"rhsusf_acc_harris_bipod"],[],[],["rhs_uniform_cu_ocp",[["ACE_fieldDressing",25],["ACE_adenosine",2],["ACE_atropine",9],["ACE_tourniquet",4]]],["rhsusf_spcs_ocp_rifleman",[["ACE_CableTie",2],["ACE_Kestrel4500",1],["ACE_MapTools",1],["ACE_Flashlight_KSF1",1],["ACE_EntrenchingTool",1],["ACE_RangeCard",1],["rhsusf_20Rnd_762x51_SR25_m62_Mag",7,20]]],["rhsusf_assault_eagleaiii_ocp",[["ACE_EntrenchingTool",1],["ACE_salineIV",4],["rhsusf_20Rnd_762x51_SR25_m62_Mag",5,20],["SmokeShellRed",4,1]]],"rhsusf_ach_helmet_ocp","",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_13","ItemCompass","ACE_Altimeter",""]]};
        case "pilot": {[["rhsusf_weap_MP7A2","","","",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],[],[],["U_B_PilotCoveralls",[["ACE_quikclot",15],["adv_aceCPR_AED",1],["ACE_surgicalKit",1]]],["rhsusf_spcs_ucp",[["ACE_elasticBandage",40],["ACE_packingBandage",60],["ACE_MapTools",1],["ACE_adenosine",10],["ACE_epinephrine",10],["ACE_morphine",10],["ACE_tourniquet",9]]],["OPXT_ogag_1523",[["ACE_atropine",15],["ACE_Flashlight_KSF1",1],["ACE_CableTie",5],["ACE_plasmaIV",10],["ACE_plasmaIV_500",2],["rhsusf_mag_40Rnd_46x30_JHP",3,40]]],"rhsusf_hgu56p_visor_pink","",["m24_bino","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_16","ItemCompass","ACE_Altimeter","rhsusf_ANPVS_14"]]};
        case "sniper": {[["rhs_weap_M107","","","rhsusf_acc_premier",["rhsusf_mag_10Rnd_STD_50BMG_M33",10],[],""],[],["rhsusf_weap_glock17g4","rhsusf_acc_omega9k","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],["U_B_FullGhillie_ard",[["ACE_ATragMX",1],["ACE_RangeCard",1],["ACE_Kestrel4500",1],["ACE_Flashlight_KSF1",1],["ACE_CableTie",2],["ACE_fieldDressing",20],["ACE_salineIV",2],["SmokeShell",1,1],["SmokeShellGreen",1,1]]],["rhsusf_spcs_ocp_sniper",[["ACE_tourniquet",4],["rhsusf_mag_10Rnd_STD_50BMG_M33",4,10],["rhsusf_mag_10Rnd_STD_50BMG_mk211",2,10],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],["OPXT_oga_1523",[["rhsusf_mag_10Rnd_STD_50BMG_M33",4,10],["rhsusf_mag_10Rnd_STD_50BMG_mk211",2,10]]],"rhsusf_ach_helmet_ucp","",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ACE_Altimeter",""]]};
        case "spotter": {[["rhs_weap_m16a4_carryhandle_M203","rhsusf_acc_nt4_black","","rhsusf_acc_ACOG_RMR",["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",30],[],""],[],["rhsusf_weap_glock17g4","rhsusf_acc_omega9k","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],["U_B_FullGhillie_ard",[["ACE_fieldDressing",25],["ACE_ATragMX",1],["ACE_RangeCard",1],["ACE_HuntIR_monitor",1],["ACE_CableTie",2],["ACE_tourniquet",4],["ACE_Flashlight_KSF1",1],["ACE_MapTools",1],["ACE_Kestrel4500",1]]],["rhsusf_spcs_ocp_sniper",[["ACE_EntrenchingTool",1],["ACE_SpottingScope",1],["ACE_salineIV",5],["ACE_adenosine",3],["ACE_atropine",9],["Laserbatteries",4,1]]],["OPXT_ogag_1523",[["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",5,30],["rhs_mag_m715_Green_precise",2,1],["APERSMine_Range_Mag",8,1]]],"rhsusf_ach_bare","",["Laserdesignator","","","",["Laserbatteries",1],[],""],["ItemMap","ItemGPS","TFAR_anprc152_18","ItemCompass","ACE_Altimeter",""]]};
        case "jtac": {[["rhs_weap_hk416d10","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15A","rhsusf_acc_eotech_552",["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",30],[],"rhsusf_acc_harris_bipod"],[],[],["rhs_uniform_cu_ocp",[["ACE_fieldDressing",25],["ACE_tourniquet",4],["ACE_adenosine",2],["ACE_atropine",9]]],["rhsusf_mbav_rifleman",[["ACE_UAVBattery",4],["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",5,30],["Laserbatteries",2,1]]],["B_UAV_01_backpack_F",[]],"rhsusf_ach_helmet_ocp","",["Laserdesignator","","","",["Laserbatteries",1],[],""],["ItemMap","B_UavTerminal","TFAR_anprc152_19","ItemCompass","ACE_Altimeter",""]]};
        case "arzt": {[[],[],[],["rhs_uniform_g3_tan",[["ACE_surgicalKit",1],["ACE_quikclot",25]]],["rhsusf_spcs_ocp_medic",[["ACE_elasticBandage",40],["ACE_packingBandage",40],["ACE_epinephrine",10],["ACE_atropine",15],["ACE_morphine",10],["ACE_adenosine",15],["ACE_tourniquet",10]]],["B_Kitbag_mcamo",[["adv_aceCPR_AED",1],["ACE_bloodIV",5],["ACE_bloodIV_500",10],["ACE_personalAidKit",1],["ACE_bloodIV_250",10]]],"","",["m24_bino","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_14","ItemCompass","ACE_Altimeter",""]]};
        case "rifle" : {[["rhs_weap_hk416d10","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15A","rhsusf_acc_eotech_552",["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",30],[],"rhsusf_acc_harris_bipod"],[],[],["rhs_uniform_cu_ocp",[["ACE_tourniquet",4],["ACE_fieldDressing",25],["ACE_adenosine",2],["ACE_atropine",9]]],["rhsusf_spcs_ocp_rifleman",[["ACE_MapTools",1],["ACE_Flashlight_KSF1",1],["ACE_CableTie",2],["ACE_EntrenchingTool",1],["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",10,30],["SmokeShell",4,1]]],["B_Kitbag_sgg",[["ACE_salineIV",4],["rhs_mag_m67",5,1]]],"rhsusf_ach_helmet_ocp","",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_21","ItemCompass","ACE_Altimeter",""]]};
        case "pionier" : {[["rhs_weap_hk416d10","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15A","rhsusf_acc_eotech_552",["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",30],[],"rhsusf_acc_harris_bipod"],[],[],["rhs_uniform_g3_blk",[["ACE_fieldDressing",25],["ACE_adenosine",2],["ACE_atropine",9],["ACE_tourniquet",4]]],["rhsusf_spcs_ucp_rifleman",[["ACE_EntrenchingTool",1],["ACE_wirecutter",1],["ACE_DefusalKit",1],["ACE_CableTie",2],["ACE_MapTools",1],["ACE_Flashlight_KSF1",1],["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",10,30]]],["B_Kitbag_cbr",[["ACE_salineIV",4],["ToolKit",1]]],"rhsusf_ach_helmet_ocp","",["m24_bino","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_24","ItemCompass","ACE_Altimeter",""]]};
        default {[]};
    };

    ACE_player setUnitLoadout [_layout, true];
};

if (_arsenalType == "BW") exitWith
{
    ACE_player setUnitLoadout [[[],[],[],["BWA3_Uniform2_Fleck",[["ACE_fieldDressing",25],["ACE_adenosine",2],["ACE_atropine",9],["ACE_tourniquet",4]]],["BWA3_Vest_JPC_Rifleman_Fleck",[["ACE_MapTools",1],["ACE_Flashlight_KSF1",1],["ACE_CableTie",2],["ACE_salineIV",4],["ACE_EntrenchingTool",1],["Laserbatteries",1,1],["SmokeShell",2,1]]],[],"BWA3_OpsCore_Tropen_Camera","",["Binocular","","","",[],[],""],["ItemMap","BWA3_ItemNaviPad","TFAR_anprc152_8","ItemCompass","ACE_Altimeter",""]], true];
};

if (_arsenalType == "VANILLA") exitWith
{
    private _layout = switch (_rolle) do
    {
        case "lead": {[["arifle_MX_GL_Black_F","","ACE_acc_pointer_green","optic_ERCO_blk_F",["30Rnd_65x39_caseless_mag_Tracer",30],["ACE_HuntIR_M203",1],""],[],["hgun_Pistol_heavy_01_F","muzzle_snds_acp","","optic_MRD",["11Rnd_45ACP_Mag",11],[],""],["U_B_CTRG_1",[["ACE_fieldDressing",25],["ACE_atropine",9],["ACE_adenosine",2],["ACE_tourniquet",4]]],["V_PlateCarrier2_blk",[["ACE_MapTools",1],["ACE_Flashlight_KSF1",1],["ACE_EntrenchingTool",1],["ACE_CableTie",2],["ACE_HuntIR_monitor",1],["30Rnd_65x39_caseless_mag_Tracer",10,30],["Laserbatteries",1,1]]],["OPXT_blk_1523",[["1Rnd_Smoke_Grenade_shell",6,1],["1Rnd_SmokePurple_Grenade_shell",2,1],["ACE_HuntIR_M203",5,1]]],"H_HelmetSpecB","G_Bandanna_beast",["Laserdesignator","","","",["Laserbatteries",1],[],""],["ItemMap","ItemGPS","TFAR_anprc152_27","ItemCompass","ACE_Altimeter",""]]};
        case "grena": {[["arifle_MX_GL_Black_F","","ACE_acc_pointer_green","optic_ERCO_blk_F",["30Rnd_65x39_caseless_mag_Tracer",30],["1Rnd_Smoke_Grenade_shell",1],""],[],["hgun_Pistol_heavy_01_F","muzzle_snds_acp","","optic_MRD",["11Rnd_45ACP_Mag",11],[],""],["U_B_CTRG_1",[["ACE_fieldDressing",25],["ACE_adenosine",2],["ACE_atropine",9],["ACE_tourniquet",4]]],["V_PlateCarrier2_blk",[["ACE_CableTie",2],["ACE_MapTools",1],["ACE_Flashlight_KSF1",1],["ACE_EntrenchingTool",1],["ACE_HuntIR_monitor",1],["30Rnd_65x39_caseless_mag_Tracer",10,30]]],["B_Kitbag_rgr",[["ACE_salineIV",4],["3Rnd_Smoke_Grenade_shell",6,3],["3Rnd_HE_Grenade_shell",6,3]]],"H_HelmetSpecB","G_Bandanna_beast",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_28","ItemCompass","ACE_Altimeter",""]]};
        case "arzt": {[[],[],["hgun_Pistol_heavy_01_F","muzzle_snds_acp","","optic_MRD",["11Rnd_45ACP_Mag",11],[],""],["U_B_CTRG_1",[["ACE_surgicalKit",1],["ACE_quikclot",25]]],["V_PlateCarrier2_blk",[["ACE_tourniquet",6],["ACE_elasticBandage",35],["ACE_packingBandage",50],["ACE_morphine",10],["ACE_atropine",15],["ACE_epinephrine",10],["ACE_adenosine",10],["ACE_MapTools",1],["ACE_Flashlight_KSF1",1],["ACE_CableTie",2]]],["B_Kitbag_sgg",[["ACE_bloodIV",10],["ACE_bloodIV_500",5],["adv_aceCPR_AED",1],["ACE_EntrenchingTool",1],["ACE_personalAidKit",1],["SmokeShellRed",8,1]]],"H_HelmetSpecB","G_Bandanna_beast",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ACE_Altimeter",""]]};
        case "sani": {[["arifle_MX_Black_F","muzzle_snds_H","ACE_acc_pointer_green","optic_ERCO_blk_F",["30Rnd_65x39_caseless_mag_Tracer",30],[],"bipod_01_F_blk"],[],["hgun_Pistol_heavy_01_F","muzzle_snds_acp","","optic_MRD",["11Rnd_45ACP_Mag",11],[],""],["U_B_CTRG_1",[["ACE_surgicalKit",1],["ACE_quikclot",25]]],["V_PlateCarrier2_blk",[["ACE_elasticBandage",35],["ACE_packingBandage",50],["ACE_epinephrine",10],["ACE_morphine",10],["ACE_adenosine",10],["ACE_atropine",15],["ACE_tourniquet",6],["ACE_CableTie",4]]],["B_Kitbag_rgr",[["ACE_plasmaIV",10],["ACE_plasmaIV_500",5],["adv_aceCPR_AED",1],["30Rnd_65x39_caseless_mag_Tracer",10,30],["11Rnd_45ACP_Mag",3,11]]],"H_HelmetSpecB_sand","G_Bandanna_beast",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_33","ItemCompass","ACE_Altimeter",""]]};
        case "mg": {[["LMG_03_F","","ACE_acc_pointer_green_IR","optic_ERCO_blk_F",["200Rnd_556x45_Box_F",200],[],""],[],["hgun_Pistol_heavy_01_F","muzzle_snds_acp","","optic_MRD",["11Rnd_45ACP_Mag",11],[],""],["U_B_CTRG_3",[["ACE_fieldDressing",25],["ACE_atropine",9],["ACE_adenosine",2],["ACE_tourniquet",4]]],["V_PlateCarrier2_blk",[["ACE_MapTools",1],["ACE_Flashlight_KSF1",1],["ACE_EntrenchingTool",1],["ACE_salineIV",4],["200Rnd_556x45_Box_Tracer_F",2,200]]],["B_Kitbag_rgr",[["200Rnd_556x45_Box_Tracer_F",3,200],["11Rnd_45ACP_Mag",2,11],["SmokeShell",4,1]]],"H_HelmetSpecB","G_Bandanna_beast",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_30","ItemCompass","ACE_Altimeter",""]]};
        case "spreng": {[["arifle_MX_Black_F","","ACE_acc_pointer_green","optic_ERCO_blk_F",["30Rnd_65x39_caseless_mag",30],[],"bipod_01_F_blk"],[],["ACE_VMM3","","","",[],[],""],["U_B_CTRG_1",[["ACE_fieldDressing",25],["ACE_adenosine",2],["ACE_atropine",9],["ACE_tourniquet",4]]],["V_PlateCarrierGL_blk",[["ACE_Flashlight_KSF1",1],["ACE_M26_Clacker",1],["MineDetector",1],["ACE_wirecutter",1],["ACE_DefusalKit",1],["ACE_EntrenchingTool",1],["30Rnd_65x39_caseless_mag_Tracer",7,30]]],["B_Kitbag_rgr",[["DemoCharge_Remote_Mag",6,1]]],"H_HelmetSpecB_sand","G_Bandanna_beast",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_31","ItemCompass","ACE_Altimeter",""]]} ;
        case "aaat": {[["arifle_MX_Black_F","","ACE_acc_pointer_green","optic_ERCO_blk_F",["30Rnd_65x39_caseless_mag_Tracer",30],[],"bipod_01_F_blk"],["launch_MRAWS_sand_F","","","",["MRAWS_HEAT_F",1],[],""],[],["U_B_CTRG_1",[["ACE_fieldDressing",25],["ACE_adenosine",2],["ACE_atropine",9],["ACE_tourniquet",4]]],["V_PlateCarrier2_blk",[["ACE_CableTie",2],["ACE_MapTools",1],["ACE_Flashlight_KSF1",1],["ACE_EntrenchingTool",1],["ACE_salineIV",4],["30Rnd_65x39_caseless_mag_Tracer",8,30]]],["B_Kitbag_rgr",[["MRAWS_HEAT_F",4,1],["SmokeShell",5,1]]],"H_HelmetSpecB","G_Bandanna_beast",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_36","ItemCompass","ACE_Altimeter",""]]};
        case "trag": {[["arifle_MX_Black_F","","ACE_acc_pointer_green","optic_ERCO_blk_F",["30Rnd_65x39_caseless_mag_Tracer",30],[],"bipod_02_F_blk"],[],["hgun_Pistol_heavy_01_F","muzzle_snds_acp","","optic_MRD",["11Rnd_45ACP_Mag",11],[],""],["U_B_CTRG_1",[["ACE_fieldDressing",25],["ACE_adenosine",2],["ACE_atropine",9],["ACE_tourniquet",4]]],["V_PlateCarrier2_blk",[["ACE_salineIV",4],["30Rnd_65x39_caseless_mag_Tracer",10,30]]],["B_Carryall_cbr",[["MRAWS_HEAT_F",2,1],["20Rnd_762x51_Mag",5,20],["30Rnd_65x39_caseless_mag_Tracer",10,30],["200Rnd_556x45_Box_Tracer_Red_F",1,200]]],"H_HelmetSpecB_sand","G_Bandanna_beast",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_37","ItemCompass","ACE_Altimeter",""]]} ;
        case "dmr": {[["srifle_EBR_F","","ACE_acc_pointer_green","optic_DMS",["20Rnd_762x51_Mag",20],[],"bipod_01_F_snd"],[],["hgun_Pistol_heavy_01_F","muzzle_snds_acp","","optic_MRD",["11Rnd_45ACP_Mag",11],[],""],["U_B_CTRG_1",[["ACE_fieldDressing",25],["ACE_adenosine",2],["ACE_atropine",9],["ACE_tourniquet",4]]],["V_PlateCarrier2_blk",[["ACE_CableTie",4],["ACE_MapTools",1],["ACE_Flashlight_KSF1",1],["ACE_EntrenchingTool",1],["ACE_salineIV",4],["20Rnd_762x51_Mag",7,20]]],["B_Kitbag_rgr",[["20Rnd_762x51_Mag",5,20],["11Rnd_45ACP_Mag",3,11],["SmokeShell",4,1]]],"H_HelmetSpecB_sand","G_Bandanna_beast",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_35","ItemCompass","ACE_Altimeter",""]]};
        case "pilot": {[["SMG_01_F","","","optic_ACO_grn_smg",["30Rnd_45ACP_Mag_SMG_01",25],[],""],[],["hgun_Pistol_heavy_01_F","muzzle_snds_acp","","optic_MRD",["11Rnd_45ACP_Mag",11],[],""],["U_B_HeliPilotCoveralls",[["ACE_surgicalKit",1],["ACE_quikclot",25]]],["V_DeckCrew_white_F",[["adv_aceCPR_AED",1],["30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",2,25]]],["OPXT_wht_1523",[["ACE_plasmaIV",5],["ACE_elasticBandage",30],["ACE_packingBandage",35],["ACE_epinephrine",10],["ACE_adenosine",10],["ACE_morphine",10],["ACE_atropine",15]]],"H_CrewHelmetHeli_B","G_Bandanna_beast",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_39","ItemCompass","ACE_Altimeter",""]]};
        case "sniper": {[["srifle_LRR_F","","","optic_LRPS",["7Rnd_408_Mag",7],[],""],[],["hgun_Pistol_heavy_01_F","muzzle_snds_acp","","optic_MRD",["11Rnd_45ACP_Mag",11],[],""],["U_B_FullGhillie_ard",[["ACE_fieldDressing",25],["ACE_tourniquet",4],["ACE_adenosine",3],["ACE_atropine",11],["ACE_EntrenchingTool",1],["ACE_ATragMX",1],["ACE_Kestrel4500",1],["ACE_Flashlight_KSF1",1],["ACE_MapTools",1],["ACE_RangeCard",1]]],["V_PlateCarrier2_blk",[["ACE_Tripod",1],["ACE_HuntIR_monitor",1],["7Rnd_408_Mag",5,7],["11Rnd_45ACP_Mag",1,11]]],["OPXT_blk_1523",[["ACE_wirecutter",1],["optic_KHS_blk",1],["optic_AMS",1],["7Rnd_408_Mag",6,7],["SmokeShellPurple",4,1],["Laserbatteries",1,1]]],"H_HelmetSpecB","G_Bandanna_beast",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_44","ItemCompass","ACE_Altimeter",""]]};
        case "spotter": {[["arifle_MX_GL_F","","","optic_ERCO_snd_F",["30Rnd_65x39_caseless_mag_Tracer",30],["ACE_HuntIR_M203",1],""],[],["hgun_Pistol_heavy_01_F","muzzle_snds_acp","","optic_MRD",["11Rnd_45ACP_Mag",11],[],""],["U_B_FullGhillie_ard",[["ACE_fieldDressing",25],["ACE_adenosine",2],["ACE_atropine",10],["ACE_EntrenchingTool",1],["ACE_Flashlight_KSF1",1],["ACE_tourniquet",4],["ACE_RangeCard",1],["ACE_ATragMX",1],["ACE_Kestrel4500",1],["ACE_MapTools",1],["ACE_CableTie",1]]],["V_PlateCarrier2_blk",[["ACE_SpottingScope",1],["ACE_HuntIR_monitor",1],["ACE_wirecutter",1],["30Rnd_65x39_caseless_mag_Tracer",5,30]]],["OPXT_blk_1523",[["ACE_salineIV",3],["3Rnd_Smoke_Grenade_shell",5,3],["3Rnd_HE_Grenade_shell",2,3],["ACE_HuntIR_M203",5,1],["Laserbatteries",1,1],["30Rnd_65x39_caseless_mag_Tracer",2,30]]],"H_HelmetSpecB_sand","G_Bandanna_beast",["Laserdesignator","","","",["Laserbatteries",1],[],""],["ItemMap","ItemGPS","TFAR_anprc152_45","ItemCompass","ACE_Altimeter",""]]};
        case "jtac": {[["arifle_MX_GL_Black_F","","","optic_ERCO_blk_F",["30Rnd_65x39_caseless_mag_Tracer",30],[],""],[],["hgun_Pistol_heavy_01_F","muzzle_snds_acp","","optic_MRD",["11Rnd_45ACP_Mag",11],[],""],["U_B_CTRG_1",[["ACE_fieldDressing",25],["ACE_adenosine",2],["ACE_atropine",9],["ACE_tourniquet",4]]],["V_PlateCarrier2_blk",[["ACE_MapTools",1],["ACE_Flashlight_KSF1",1],["ACE_UAVBattery",4],["ACE_HuntIR_monitor",1],["Laserbatteries",2,1],["30Rnd_65x39_caseless_mag_Tracer",2,30]]],["B_UAV_01_backpack_F",[]],"H_HelmetSpecB","G_Bandanna_beast",["Laserdesignator","","","",["Laserbatteries",1],[],""],["ItemMap","B_UavTerminal","TFAR_anprc152_4","ItemCompass","ACE_Altimeter",""]]};
        case "rifle" : {[["arifle_MX_F","","ACE_acc_pointer_green","optic_ERCO_snd_F",["30Rnd_65x39_caseless_mag_Tracer",30],[],"bipod_01_F_snd"],[],["hgun_Pistol_heavy_01_F","muzzle_snds_acp","","optic_MRD",["11Rnd_45ACP_Mag",11],[],""],["U_B_CTRG_1",[["ACE_fieldDressing",25],["ACE_adenosine",2],["ACE_tourniquet",4],["ACE_atropine",9]]],["V_PlateCarrier2_blk",[["ACE_MapTools",1],["ACE_Flashlight_KSF1",1],["ACE_EntrenchingTool",1],["ACE_wirecutter",1],["ACE_CableTie",2],["ACE_salineIV",4],["ACE_fieldDressing",20]]],["B_Kitbag_sgg",[["30Rnd_65x39_caseless_mag",10,30],["11Rnd_45ACP_Mag",5,11],["HandGrenade",5,1],["SmokeShell",5,1],["AMP_Breaching_Charge_Mag",5,1]]],"H_HelmetSpecB","G_Bandanna_oli",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_5","ItemCompass","ACE_Altimeter",""]]};
        case "pionier" : {[["arifle_MX_F","","ACE_acc_pointer_green_IR","optic_ERCO_snd_F",["30Rnd_65x39_caseless_mag_Tracer",30],[],"bipod_01_F_snd"],[],["hgun_Pistol_heavy_01_F","muzzle_snds_acp","","optic_MRD",["11Rnd_45ACP_Mag",11],[],""],["U_B_CTRG_1",[["ACE_tourniquet",4],["ACE_atropine",9],["ACE_fieldDressing",25],["ACE_adenosine",2]]],["V_PlateCarrierGL_blk",[["ACE_wirecutter",1],["ACE_DefusalKit",1],["ACE_EntrenchingTool",1],["MineDetector",1],["ACE_CableTie",2],["ACE_MapTools",1],["ACE_Flashlight_KSF1",1],["SmokeShellBlue",2,1],["SmokeShellYellow",2,1],["SmokeShell",2,1],["30Rnd_65x39_caseless_mag_Tracer",5,30]]],["OPXT_blk_1523",[["ToolKit",1],["ACE_salineIV",4],["ACE_HuntIR_monitor",1]]],"H_HelmetSpecB","",[],["","","","","",""]]};
        default {[]};
    };

    ACE_player setUnitLoadout [_layout, true];
};

if (_arsenalType == "RUSS") exitWith
{
    ACE_player setUnitLoadout [[[],[],[],["rhs_uniform_emr_patchless",[["ACE_quikclot",15],["ACE_tourniquet",4],["ACE_Atropine",5],["ACE_MapTools",1],["ACE_CableTie",2],["ACE_EntrenchingTool",1]]],[],[],"rhs_fieldcap_digi","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_fadak","ItemCompass","ACE_Altimeter",""]], true];
};

if (_arsenalType == "Themen") exitWith
{
    private _patches = configfile >> "CfgPatches";
    private _side = side ACE_player;

    if (isClass (_patches >> "uns_main")) exitWith
    {
        ACE_player setUnitLoadout [[[],[],[],["UNS_ARMY_BDU_101stAB65pv1",[["ACE_quikclot",15],["ACE_tourniquet",2],["ACE_Atropine",3],["ACE_EntrenchingTool",1]]],["UNS_M1956_A12",[]],[],"UNS_M1_3A","",[],["ItemMap","","","ItemCompass","ItemWatch",""]], true];
    };

    if (_side == blufor) exitWith
    {
        if (worldName in ["gm_weferlingen_summer", "gm_weferlingen_winter"]) then
        {
            // BRD
            private _layout = switch (_rolle) do
            {
                case "lead": {[["gm_g3a3_grn","","","",["gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk",20],[],""],[],["gm_p1_blk","","","",["gm_8Rnd_9x19mm_B_DM51_p1_blk",8],[],""],["gm_ge_army_uniform_soldier_parka_80_ols",[["ACE_fieldDressing",25],["ACE_tourniquet",4],["ACE_atropine",9],["ACE_adenosine",2]]],["gm_dk_army_vest_54_rifleman",[["ACE_MapTools",1],["ACE_CableTie",2],["ACE_Flashlight_KSF1",1],["ACE_EntrenchingTool",1],["AMP_Breaching_Charge_Mag",2,1]]],["OPXT_ogao_210",[["ACE_salineIV",2],["gm_smokeshell_wht_dm25",5,1],["gm_20Rnd_762x51mm_AP_DM151_g3_blk",5,20],["gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk",5,20],["gm_8Rnd_9x19mm_B_DM11_p1_blk",5,8]]],"gm_ge_headgear_beret_crew_red_opcom","",["gm_df7x40_blk","","","",[],[],""],["ItemMap","","TFAR_anprc152","gm_ge_army_conat2","gm_watch_kosei_80",""]]};
                case "grena": {[["gm_g3a3_oli","","","",["gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk",20],[],""],[],["gm_p1_blk","","","",["gm_8Rnd_9x19mm_B_DM11_p1_blk",8],[],""],["gm_ge_army_uniform_soldier_80_oli",[["ACE_fieldDressing",25],["ACE_tourniquet",4],["ACE_atropine",9],["ACE_adenosine",2]]],["gm_dk_army_vest_54_rifleman",[["ACE_MapTools",1],["ACE_CableTie",2],["ACE_Flashlight_KSF1",1],["ACE_EntrenchingTool",1],["ACE_wirecutter",1],["AMP_Breaching_Charge_Mag",2,1]]],["gm_ge_army_backpack_80_oli",[["ACE_salineIV",2],["gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk",5,20],["gm_20Rnd_762x51mm_AP_DM151_g3_blk",5,20],["gm_8Rnd_9x19mm_B_DM11_p1_blk",5,8],["gm_1rnd_67mm_heat_dm22a1_g3",5,1],["gm_smokeshell_wht_dm25",4,1]]],"gm_dk_headgear_m52_net_oli","",["gm_df7x40_blk","","","",[],[],""],["ItemMap","","TFAR_anprc152","gm_ge_army_conat2","gm_watch_kosei_80",""]]};
                case "arzt": {[["gm_g3a3_oli","","","",["gm_20Rnd_762x51mm_B_T_DM21_g3_blk",20],[],""],[],[],["gm_ge_army_uniform_soldier_parka_80_oli",[["ACE_fieldDressing",25],["ACE_tourniquet",4],["ACE_atropine",9],["ACE_adenosine",2]]],["gm_ge_pol_vest_80_wht",[["ACE_elasticBandage",25],["ACE_packingBandage",50],["ACE_epinephrine",10],["ACE_adenosine",10],["ACE_morphine",10],["ACE_surgicalKit",1],["adv_aceCPR_AED",1]]],["gm_ge_backpack_satchel_80_san",[["ACE_atropine",10],["ACE_personalAidKit",1],["ACE_bloodIV",5],["ACE_bloodIV_500",7],["gm_20Rnd_762x51mm_AP_DM151_g3_blk",5,20]]],"gm_dk_headgear_m52_net_win","",["gm_df7x40_blk","","","",[],[],""],["ItemMap","","TFAR_anprc152","gm_ge_army_conat2","gm_watch_kosei_80",""]]};
                case "mg": {[["gm_mg3_blk","","","",["gm_120Rnd_762x51mm_B_T_DM21A1_mg3_grn",120],[],""],[],["gm_p1_blk","","","",["gm_8Rnd_9x19mm_B_DM11_p1_blk",8],[],""],["gm_ge_army_uniform_soldier_80_oli",[["ACE_fieldDressing",25],["ACE_tourniquet",4],["ACE_atropine",9],["ACE_adenosine",2]]],["gm_dk_army_vest_54_machinegunner",[["ACE_MapTools",1],["ACE_CableTie",2],["ACE_Flashlight_KSF1",1],["ACE_salineIV",2],["ACE_EntrenchingTool",1],["ACE_wirecutter",1]]],["gm_dk_army_backpack_73_oli",[["gm_120Rnd_762x51mm_B_T_DM21A1_mg3_grn",10,120],["gm_8Rnd_9x19mm_B_DM11_p1_blk",5,8],["gm_smokeshell_wht_dm25",5,1]]],"gm_dk_headgear_m52_net_oli","",["gm_df7x40_blk","","","",[],[],""],["ItemMap","","TFAR_anprc152","gm_ge_army_conat2","gm_watch_kosei_80",""]]};
                case "aaat": {[["gm_g3a3_grn","","","",["gm_20Rnd_762x51mm_B_T_DM21_g3_blk",20],[],""],["gm_pzf44_2_oli","","","",["gm_1Rnd_44x537mm_heat_dm32_pzf44_2",1],[],""],["gm_p1_blk","","","",["gm_8Rnd_9x19mm_B_DM11_p1_blk",8],[],""],["gm_ge_army_uniform_soldier_80_oli",[["ACE_fieldDressing",25],["ACE_tourniquet",4],["ACE_atropine",9],["ACE_adenosine",2]]],["gm_dk_army_vest_54_rifleman",[["ACE_MapTools",1],["ACE_CableTie",2],["ACE_Flashlight_KSF1",1],["ACE_EntrenchingTool",1],["ACE_wirecutter",1],["gm_smokeshell_wht_dm25",5,1],["gm_8Rnd_9x19mm_B_DM11_p1_blk",5,8]]],["gm_ge_army_backpack_80_oli",[["gm_1Rnd_44x537mm_heat_dm32_pzf44_2",3,1],["gm_20Rnd_762x51mm_AP_DM151_g3_blk",8,20]]],"gm_dk_headgear_m52_net_oli","",["gm_df7x40_blk","","","",[],[],""],["ItemMap","","TFAR_anprc152","gm_gc_compass_f73","gm_watch_kosei_80",""]]};
                case "trag": {[["gm_g3a3_oli","","","",["gm_20Rnd_762x51mm_B_T_DM21_g3_blk",20],[],""],[],["gm_p1_blk","","","",["gm_8Rnd_9x19mm_B_DM11_p1_blk",8],[],""],["gm_ge_army_uniform_soldier_80_oli",[["ACE_fieldDressing",25],["ACE_tourniquet",4],["ACE_atropine",9],["ACE_adenosine",2]]],["gm_dk_army_vest_54_rifleman",[["ACE_MapTools",1],["ACE_CableTie",2],["ACE_Flashlight_KSF1",1],["ACE_EntrenchingTool",1],["gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk",10,20],["gm_8Rnd_9x19mm_B_DM51_p1_blk",2,8]]],["gm_dk_army_backpack_73_oli",[["gm_120Rnd_762x51mm_B_T_DM21A1_mg3_grn",2,120],["gm_1Rnd_44x537mm_heat_dm32_pzf44_2",1,1],["gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk",12,20],["gm_8Rnd_9x19mm_B_DM11_p1_blk",5,8]]],"gm_dk_headgear_m52_net_oli","",["gm_df7x40_blk","","","",[],[],""],["ItemMap","","TFAR_anprc152","gm_ge_army_conat2","gm_watch_kosei_80",""]]};
                case "pionier" : {[["gm_g3a3_oli","","","",["gm_20Rnd_762x51mm_B_T_DM21_g3_blk",20],[],""],[],["ACE_VMM3","","","",[],[],""],["gm_ge_army_uniform_soldier_80_ols",[["ACE_fieldDressing",25],["ACE_tourniquet",4],["ACE_atropine",9],["ACE_adenosine",2]]],["gm_dk_army_vest_54_rifleman",[["ACE_MapTools",1],["ACE_CableTie",2],["ACE_Flashlight_KSF1",1],["gm_20Rnd_762x51mm_AP_DM151_g3_blk",5,20],["gm_20Rnd_762x51mm_B_T_DM21_g3_blk",5,20]]],["gm_ge_army_backpack_80_oli",[["gm_repairkit_01",1],["ACE_M26_Clacker",1],["ACE_wirecutter",1],["ACE_DefusalKit",1],["gm_explosive_petn_charge",4,1],["AMP_Breaching_Charge_Mag",2,1]]],"gm_ge_bgs_headgear_m35_53_net_blk","",["gm_df7x40_blk","","","",[],[],""],["ItemMap","","TFAR_anprc152","gm_ge_army_conat2","gm_watch_kosei_80",""]]};
                default {[]};
            };
            
            ACE_player setUnitLoadout [_layout, true];
        }
        else
        {
            // Vanilla-COP
            ACE_player setUnitLoadout [[[],[],["TB_weap_taser","","acc_flashlight_pistol","optic_MRD",["TB_mag_taser",3],[],""],["TB_Uniform_Kommissar_U",[["ACE_quikclot",25],["ACE_Atropine",5],["ACE_tourniquet",4],["ACE_CableTie",5]]],["V_TacVest_blk_POLICE",[["AMP_Breaching_Charge_Mag",1,1],["TB_mag_taser",1,3]]],[],"H_Cap_police","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ACE_Altimeter",""]], true];
        };
    };

    if (_side == opfor) exitWith
    {
        // RussSimple
        ACE_player setUnitLoadout [[[],[],[],["rhs_uniform_flora_patchless",[["ACE_fieldDressing",10],["ACE_quikclot",10],["ACE_tourniquet",4],["ACE_Atropine",5],["ACE_MapTools",1],["ACE_CableTie",1]]],[],[],"rhs_beret_milp","",[],["ItemMap","ItemGPS","TFAR_fadak","ItemCompass","ACE_Altimeter",""]], true];
    };
};

if (_arsenalType == "CUSTOM") exitWith
{
    if (isNil "TB_fnc_customLayout") then
    {
        TB_fnc_customLayout = {//Not changed for backward comp.
            params ["_rolle"];

            switch (_rolle) do
            {
                case "lead": {[]};
                case "grena": {[]};
                case "sani": {[]};
                case "mg": {[]};
                case "spreng": {[]};
                case "aaat": {[]};
                case "trag": {[]};
                case "dmr": {[]};
                case "pilot": {[]};
                case "sniper": {[]};
                case "spotter": {[]};
                case "jtac": {[]};
                case "arzt": {[]};
                case "rifle" : {[]};
                case "pionier" : {[]};
                default {[]};
            };
        };
    };

    private _layout = [_rolle] call TB_fnc_customLayout;

    ACE_player setUnitLoadout [_layout, true];
};
