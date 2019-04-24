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
        case "lead": {[[],[],[],["rhs_uniform_cu_ocp",[["ACE_Atropine",5],["ACE_MapTools",1],["ACE_CableTie",1],["ACE_tourniquet",4],["ACE_fieldDressing",15]]],["rhsusf_spcs_ocp_squadleader",[["ACE_HuntIR_M203",5,1],["rhs_mag_M441_HE",5,1],["rhs_mag_m67",2,1],["SmokeShellBlue",1,1],["rhs_mag_mk3a2",1,1]]],["OPXT_scorpion_1523",[["ACE_HuntIR_monitor",1],["SmokeShell",4,1]]],"rhsusf_ach_helmet_ocp","",["Laserdesignator","","","",["Laserbatteries",1],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ACE_Altimeter",""]]};
        case "grena": {[[],[],[],["rhs_uniform_cu_ocp",[["ACE_Atropine",5],["ACE_MapTools",1],["ACE_CableTie",1],["ACE_tourniquet",4],["ACE_fieldDressing",15]]],["rhsusf_spcs_ocp_grenadier",[["rhs_mag_M441_HE",6,1],["SmokeShellBlue",1,1],["rhs_mag_mk3a2",1,1],["rhs_mag_M433_HEDP",2,1],["rhs_mag_m67",2,1],["rhs_mag_m713_Red_precise",1,1]]],["rhsusf_assault_eagleaiii_ocp",[["SmokeShell",4,1],["3Rnd_Smoke_Grenade_shell_precise",1,3]]],"rhsusf_ach_helmet_ocp","",[],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ACE_Altimeter",""]]};
        case "sani": {[[],[],[],["rhs_uniform_cu_ocp",[["ACE_surgicalKit",1],["ACE_quikclot",25]]],["rhsusf_spcs_ocp_medic",[["ACE_elasticBandage",40],["ACE_packingBandage",40],["ACE_epinephrine",10],["ACE_atropine",15],["ACE_morphine",10],["ACE_adenosine",15],["ACE_tourniquet",10]]],["B_Kitbag_mcamo",[["ACE_plasmaIV",10],["ACE_plasmaIV_500",10],["ACE_plasmaIV_250",5],["adv_aceCPR_AED",1]]],"","",["m24_bino","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_6","ItemCompass","ACE_Altimeter",""]]};
        case "mg": {[["rhs_weap_m249_pip_L","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15A","rhsusf_acc_ACOG_RMR",["rhsusf_200rnd_556x45_mixed_box",200],[],""],[],[],["rhs_uniform_cu_ocp",[["ACE_fieldDressing",25],["ACE_adenosine",2],["ACE_atropine",9],["ACE_tourniquet",4]]],["rhsusf_spcs_ocp_machinegunner",[["ACE_EntrenchingTool",1],["ACE_MapTools",1],["ACE_Flashlight_KSF1",1],["rhsusf_200rnd_556x45_mixed_box",3,200],["SmokeShell",3,1]]],["rhsusf_assault_eagleaiii_ocp",[["ACE_salineIV",4],["rhsusf_200rnd_556x45_mixed_box",3,200],["SmokeShell",1,1]]],"rhsusf_ach_helmet_ocp","",["m24_bino","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_8","ItemCompass","ACE_Altimeter",""]]};
        case "spreng": {[["rhs_weap_hk416d10","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15A","rhsusf_acc_eotech_552",["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",30],[],"rhsusf_acc_harris_bipod"],[],[],["rhs_uniform_cu_ocp",[["ACE_fieldDressing",25],["ACE_adenosine",2],["ACE_atropine",9],["ACE_tourniquet",4]]],["rhsusf_spcs_ocp_rifleman",[["ACE_M26_Clacker",1],["ACE_Flashlight_KSF1",1],["ACE_MapTools",1],["ACE_CableTie",2],["ACE_DefusalKit",1],["ACE_wirecutter",1],["ACE_EntrenchingTool",1],["DemoCharge_Remote_Mag",4,1]]],["rhsusf_assault_eagleaiii_ocp",[["ACE_salineIV",4],["SmokeShell",4,1],["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",10,30]]],"rhsusf_ach_helmet_ocp","",["m24_bino","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_10","ItemCompass","ACE_Altimeter",""]]};
        case "aaat": {[["rhs_weap_hk416d10","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15A","rhsusf_acc_eotech_552",["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",30],[],"rhsusf_acc_harris_bipod"],["rhs_weap_smaw_green","","","rhs_weap_optic_smaw",["rhs_mag_smaw_HEAA",1],["rhs_mag_smaw_SR",5],""],[],["rhs_uniform_cu_ocp",[["ACE_fieldDressing",25],["ACE_tourniquet",4],["ACE_atropine",9],["ACE_adenosine",2]]],["rhsusf_spcs_ocp_saw",[["ACE_MapTools",1],["ACE_EntrenchingTool",1],["ACE_Flashlight_KSF1",1],["ACE_CableTie",2],["SmokeShell",4,1],["SmokeShellBlue",1,1],["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",10,30]]],["B_Carryall_cbr",[["ACE_salineIV",2],["rhs_mag_smaw_SR",3,5],["rhs_mag_smaw_HEAA",2,1]]],"rhsusf_ach_helmet_ocp","",["m24_bino","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ACE_Altimeter",""]]};
        case "trag": {[["rhs_weap_hk416d10","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15A","rhsusf_acc_eotech_552",["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",30],[],"rhsusf_acc_harris_bipod"],[],[],["rhs_uniform_cu_ocp",[["ACE_fieldDressing",25],["ACE_adenosine",2],["ACE_atropine",9],["ACE_tourniquet",4]]],["rhsusf_spcs_ocp_machinegunner",[["ACE_EntrenchingTool",1],["ACE_MapTools",1],["ACE_CableTie",2],["ACE_Flashlight_KSF1",1],["ACE_salineIV",1],["SmokeShell",4,1],["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",10,30]]],["B_Carryall_cbr",[["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",11,30],["rhsusf_200rnd_556x45_mixed_box",2,200],["rhs_mag_smaw_HEAA",1,1]]],"rhsusf_ach_helmet_ocp","",["m24_bino","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_12","ItemCompass","ACE_Altimeter",""]]};
        case "dmr": {[["rhs_weap_sr25_d","rhsusf_acc_SR25S_d","rhsusf_acc_anpeq15A","rhsusf_acc_ACOG_MDO",["rhsusf_20Rnd_762x51_SR25_m62_Mag",20],[],"rhsusf_acc_harris_bipod"],[],[],["rhs_uniform_cu_ocp",[["ACE_fieldDressing",25],["ACE_adenosine",2],["ACE_atropine",9],["ACE_tourniquet",4]]],["rhsusf_spcs_ocp_rifleman",[["ACE_CableTie",2],["ACE_Kestrel4500",1],["ACE_MapTools",1],["ACE_Flashlight_KSF1",1],["ACE_EntrenchingTool",1],["ACE_RangeCard",1],["rhsusf_20Rnd_762x51_SR25_m62_Mag",7,20]]],["rhsusf_assault_eagleaiii_ocp",[["ACE_EntrenchingTool",1],["ACE_salineIV",4],["rhsusf_20Rnd_762x51_SR25_m62_Mag",5,20],["SmokeShellRed",4,1]]],"rhsusf_ach_helmet_ocp","",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_13","ItemCompass","ACE_Altimeter",""]]};
        case "pilot": {[["rhsusf_weap_MP7A2","","","",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],[],[],["U_B_PilotCoveralls",[["ACE_quikclot",15],["adv_aceCPR_AED",1],["ACE_surgicalKit",1]]],["rhsusf_spcs_ucp",[["ACE_elasticBandage",40],["ACE_packingBandage",60],["ACE_MapTools",1],["ACE_adenosine",10],["ACE_epinephrine",10],["ACE_morphine",10],["ACE_tourniquet",9]]],["OPXT_ogag_1523",[["ACE_atropine",15],["ACE_Flashlight_KSF1",1],["ACE_CableTie",5],["ACE_plasmaIV",10],["ACE_plasmaIV_500",2],["rhsusf_mag_40Rnd_46x30_JHP",3,40]]],"rhsusf_hgu56p_visor_pink","",["m24_bino","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_16","ItemCompass","ACE_Altimeter","rhsusf_ANPVS_14"]]};
        case "sniper": {[["rhs_weap_XM2010","rhsusf_acc_M2010S_wd","","rhsusf_acc_premier",["rhsusf_5Rnd_300winmag_xm2010",5],[],"rhsusf_acc_harris_bipod"],[],["rhsusf_weap_glock17g4","rhsusf_acc_omega9k","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],["U_B_FullGhillie_ard",[["ACE_atropine",10],["ACE_fieldDressing",25],["ACE_adenosine",2],["ACE_tourniquet",4],["ACE_EntrenchingTool",1],["ACE_Flashlight_KSF1",1],["ACE_MapTools",1],["ACE_RangeCard",1],["ACE_Kestrel4500",1],["ACE_ATragMX",1],["ACE_CableTie",2]]],["rhsusf_spcs_ocp_sniper",[["ACE_Tripod",1],["ACE_SpottingScope",1],["rhsusf_5Rnd_300winmag_xm2010",19,5],["SmokeShellBlue",5,1]]],["OPXT_oga_1523",[["ACE_salineIV",6]]],"rhsusf_ach_helmet_ucp","rhsusf_shemagh2_tan",["Laserdesignator","","","",["Laserbatteries",1],[],""],["ItemMap","ItemGPS","TFAR_anprc152_17","ItemCompass","ACE_Altimeter",""]]};
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
    ACE_player setUnitLoadout [[[],[],[],["BWA3_Uniform2_Fleck",[["ACE_fieldDressing",25],["ACE_Atropine",5],["ACE_tourniquet",4],["ACE_CableTie",3],["ACE_Flashlight_KSF1",1],["ACE_MapTools",1]]],["BWA3_Vest_Fleck",[["ACE_EntrenchingTool",1],["SmokeShell",5,1],["BWA3_DM51A1",5,1]]],[],"BWA3_OpsCore_Tropen_Camera","",["Binocular","","","",[],[],""],["ItemMap","BWA3_ItemNaviPad","TFAR_anprc152","ItemCompass","ACE_Altimeter",""]], true];
};

if (_arsenalType == "VANILLA") exitWith
{
    private _layout = switch (_rolle) do
    {
        case "lead";
        case "grena": {[["arifle_MX_GL_F","ACE_muzzle_mzls_H","ACE_acc_pointer_green","optic_ERCO_snd_F",["30Rnd_65x39_caseless_mag",30],["1Rnd_HE_Grenade_shell",1],""],[],["hgun_Pistol_heavy_01_F","muzzle_snds_acp","","optic_MRD",["11Rnd_45ACP_Mag",11],[],""],["U_B_CombatUniform_mcam",[["ACE_elasticBandage",13],["ACE_quikclot",13],["ACE_Atropine",5],["ACE_MapTools",1],["ACE_EarPlugs",2],["ACE_tourniquet",3],["ACE_CableTie",3]]],["V_PlateCarrierSpec_mtp",[["ACE_HuntIR_monitor",1],["ACE_EntrenchingTool",1],["ACE_SpraypaintBlack",1],["SmokeShell",4,1],["SmokeShellRed",2,1],["SmokeShellGreen",2,1],["HandGrenade",2,1],["MiniGrenade",1,1]]],["B_AssaultPack_cbr",[["ACE_HuntIR_M203",3,1],["30Rnd_65x39_caseless_mag",8,30],["1Rnd_HE_Grenade_shell",5,1],["1Rnd_Smoke_Grenade_shell",2,1],["1Rnd_SmokeRed_Grenade_shell",2,1],["1Rnd_SmokeGreen_Grenade_shell",2,1],["11Rnd_45ACP_Mag",3,11]]],"H_HelmetSpecB_sand","G_Bandanna_beast",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ACE_Altimeter",""]]};
        case "arzt": {[[],[],[],["U_B_CTRG_Soldier_urb_1_F",[["ACE_surgicalKit",1],["ACE_quikclot",25]]],["V_PlateCarrierSpec_blk",[["ACE_elasticBandage",40],["ACE_packingBandage",40],["ACE_epinephrine",10],["ACE_atropine",10]]],["B_Kitbag_sgg",[["adv_aceCPR_AED",1],["ACE_bloodIV",5],["ACE_bloodIV_500",10],["ACE_personalAidKit",1],["ACE_bloodIV_250",10]]],"","",["m24_bino","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_14","ItemCompass","ACE_Altimeter",""]]};
        case "sani": {[[],[],[],["U_B_CTRG_3",[["ACE_surgicalKit",1],["ACE_quikclot",25]]],["V_PlateCarrier2_rgr_noflag_F",[["ACE_elasticBandage",40],["ACE_packingBandage",40],["ACE_epinephrine",10],["ACE_atropine",15],["ACE_morphine",10],["ACE_adenosine",15],["ACE_tourniquet",10]]],["B_Kitbag_mcamo",[["ACE_plasmaIV",10],["ACE_plasmaIV_500",10],["ACE_plasmaIV_250",5],["adv_aceCPR_AED",1]]],"","",["m24_bino","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152_14","ItemCompass","ACE_Altimeter",""]]};
        case "mg": {[["arifle_MX_SW_F","ACE_muzzle_mzls_H","ACE_acc_pointer_green","optic_ERCO_snd_F",["100Rnd_65x39_caseless_mag",100],[],"bipod_01_F_snd"],[],["hgun_Pistol_heavy_01_F","muzzle_snds_acp","","optic_MRD",["11Rnd_45ACP_Mag",11],[],""],["U_B_CombatUniform_mcam",[["ACE_elasticBandage",13],["ACE_CableTie",3],["ACE_MapTools",1],["ACE_Atropine",5],["ACE_quikclot",13],["ACE_tourniquet",3],["ACE_EarPlugs",2]]],["V_PlateCarrierSpec_mtp",[["SmokeShell",3,1],["100Rnd_65x39_caseless_mag",2,100],["11Rnd_45ACP_Mag",2,11],["HandGrenade",1,1],["MiniGrenade",2,1]]],["B_AssaultPack_cbr",[["100Rnd_65x39_caseless_mag",6,100]]],"H_HelmetSpecB_sand","G_Bandanna_beast",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ACE_Altimeter",""]]};
        case "spreng": {[["arifle_MX_F","ACE_muzzle_mzls_H","ACE_acc_pointer_green","optic_ERCO_snd_F",["30Rnd_65x39_caseless_mag",30],[],"bipod_01_F_snd"],[],["hgun_Pistol_heavy_01_F","muzzle_snds_acp","","optic_MRD",["11Rnd_45ACP_Mag",11],[],""],["U_B_CombatUniform_mcam",[["ACE_elasticBandage",12],["ACE_CableTie",3],["ACE_MapTools",1],["ACE_quikclot",11],["ACE_EarPlugs",2],["ACE_tourniquet",3],["ACE_DefusalKit",1],["ACE_M26_Clacker",1]]],["V_PlateCarrierGL_mtp",[["ACE_wirecutter",1],["ACE_EntrenchingTool",1],["ACE_SpraypaintBlack",1],["ACE_DeadManSwitch",1],["SmokeShell",4,1],["11Rnd_45ACP_Mag",2,11],["APERSBoundingMine_Range_Mag",1,1],["SLAMDirectionalMine_Wire_Mag",1,1],["30Rnd_65x39_caseless_mag",2,30]]],["B_AssaultPack_cbr",[["DemoCharge_Remote_Mag",5,1],["30Rnd_65x39_caseless_mag",6,30]]],"H_HelmetSpecB_sand","G_Bandanna_beast",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ACE_Altimeter",""]]};
        case "aaat": {[["arifle_MX_F","ACE_muzzle_mzls_H","ACE_acc_pointer_green","optic_ERCO_snd_F",["30Rnd_65x39_caseless_mag",30],[],"bipod_01_F_snd"],["launch_B_Titan_short_F","","","",["Titan_AT",1],[],""],[],["U_B_CombatUniform_mcam",[["ACE_elasticBandage",13],["ACE_CableTie",3],["ACE_MapTools",1],["ACE_Atropine",5],["ACE_quikclot",13],["ACE_tourniquet",3],["ACE_EarPlugs",2]]],["V_PlateCarrierSpec_mtp",[["30Rnd_65x39_caseless_mag",8,30]]],["B_Kitbag_sgg",[["Titan_AT",1,1],["Titan_AP",1,1]]],"H_HelmetSpecB_sand","G_Bandanna_beast",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ACE_Altimeter",""]]};
        case "trag": {[["arifle_MX_F","ACE_muzzle_mzls_H","ACE_acc_pointer_green","optic_ERCO_snd_F",["30Rnd_65x39_caseless_mag",30],[],"bipod_01_F_snd"],[],["hgun_Pistol_heavy_01_F","muzzle_snds_acp","","optic_MRD",["11Rnd_45ACP_Mag",11],[],""],["U_B_CombatUniform_mcam",[["ACE_elasticBandage",13],["ACE_CableTie",3],["ACE_MapTools",1],["ACE_Atropine",5],["ACE_quikclot",13],["ACE_EarPlugs",2],["ACE_tourniquet",3]]],["V_PlateCarrierSpec_mtp",[["30Rnd_65x39_caseless_mag",5,30],["11Rnd_45ACP_Mag",4,11],["SmokeShell",5,1]]],["B_Kitbag_sgg",[["SmokeShell",10,1],["30Rnd_65x39_caseless_mag",20,30],["11Rnd_45ACP_Mag",4,11]]],"H_HelmetSpecB_sand","G_Bandanna_beast",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ACE_Altimeter",""]]};
        case "dmr": {[["arifle_MXM_F","ACE_muzzle_mzls_H","ACE_acc_pointer_green","optic_DMS",["30Rnd_65x39_caseless_mag",30],[],"bipod_01_F_snd"],[],["hgun_Pistol_heavy_01_F","muzzle_snds_acp","","optic_MRD",["11Rnd_45ACP_Mag",11],[],""],["U_B_CombatUniform_mcam",[["ACE_elasticBandage",13],["ACE_CableTie",3],["ACE_MapTools",1],["ACE_Atropine",5],["ACE_quikclot",13],["ACE_EarPlugs",2],["ACE_tourniquet",3]]],["V_PlateCarrierSpec_mtp",[["11Rnd_45ACP_Mag",2,11],["SmokeShell",5,1],["HandGrenade",2,1],["MiniGrenade",1,1],["30Rnd_65x39_caseless_mag",4,30]]],["B_AssaultPack_cbr",[["30Rnd_65x39_caseless_mag",4,30]]],"H_HelmetSpecB_sand","G_Bandanna_beast",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ACE_Altimeter",""]]};
        case "pilot": {[["SMG_02_F","ACE_muzzle_mzls_smg_02","ACE_acc_pointer_green","optic_ACO_grn_smg",["30Rnd_9x21_Mag_SMG_02",30],[],""],[],["hgun_Pistol_heavy_01_F","muzzle_snds_acp","","optic_MRD",["11Rnd_45ACP_Mag",11],[],""],["U_B_HeliPilotCoveralls",[["ACE_elasticBandage",12],["ACE_quikclot",12],["ACE_Atropine",5],["ACE_EarPlugs",2],["ACE_tourniquet",5],["ACE_MapTools",1],["ACE_CableTie",3]]],["V_HarnessO_gry",[["ACE_personalAidKit",1],["ACE_surgicalKit",1],["ACE_bloodIV_250",5],["ACE_elasticBandage",20],["ACE_epinephrine",5],["ACE_Atropine",7],["ACE_quikclot",20],["ACE_atropine",2],["30Rnd_9x21_Mag_SMG_02",3,30],["11Rnd_45ACP_Mag",2,11],["SmokeShell",2,1],["SmokeShellRed",2,1],["SmokeShellGreen",2,1]]],["B_Parachute",[]],"H_HelmetCrew_I","G_Aviator",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ACE_Altimeter",""]]};
        case "sniper": {[["srifle_GM6_camo_F","","","optic_LRPS",["5Rnd_127x108_Mag",5],[],""],[],["hgun_Pistol_heavy_01_F","muzzle_snds_acp","","optic_MRD",["11Rnd_45ACP_Mag",11],[],""],["U_B_FullGhillie_ard",[["ACE_elasticBandage",10],["ACE_RangeCard",1],["ACE_CableTie",3],["ACE_MapTools",1],["ACE_Kestrel4500",1],["ACE_Atropine",3],["ACE_quikclot",10],["ACE_EarPlugs",2],["ACE_ATragMX",1],["ACE_tourniquet",3],["ACE_EntrenchingTool",1],["SmokeShell",1,1],["11Rnd_45ACP_Mag",1,11]]],["V_HarnessO_brn",[["11Rnd_45ACP_Mag",1,11],["SmokeShell",2,1],["SmokeShellRed",2,1],["SmokeShellGreen",2,1],["5Rnd_127x108_APDS_Mag",2,5],["5Rnd_127x108_Mag",4,5],["Laserbatteries",1,1]]],[],"H_HelmetSpecB_sand","G_Bandanna_beast",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ACE_Altimeter",""]]};
        case "spotter": {[["arifle_MX_GL_F","","","",["30Rnd_65x39_caseless_mag",30],["ACE_HuntIR_M203",1],""],[],["hgun_Pistol_heavy_01_F","muzzle_snds_acp","","optic_MRD",["11Rnd_45ACP_Mag",11],[],""],["U_B_FullGhillie_ard",[["ACE_elasticBandage",10],["ACE_ATragMX",1],["ACE_RangeCard",1],["ACE_CableTie",3],["ACE_MapTools",1],["ACE_Kestrel4500",1],["ACE_Atropine",3],["ACE_quikclot",10],["ACE_EarPlugs",2],["ACE_EntrenchingTool",1],["ACE_tourniquet",3],["11Rnd_45ACP_Mag",1,11],["SmokeShell",1,1]]],["V_HarnessO_brn",[["ACE_wirecutter",1],["ACE_HuntIR_monitor",1],["ACE_Tripod",1],["SmokeShell",2,1],["11Rnd_45ACP_Mag",1,11],["30Rnd_65x39_caseless_mag",6,30]]],["B_AssaultPack_cbr",[["30Rnd_65x39_caseless_mag",2,30],["Laserbatteries",1,1],["ACE_HuntIR_M203",2,1],["5Rnd_127x108_APDS_Mag",1,5],["5Rnd_127x108_Mag",2,5],[["Laserdesignator","","","",[],[],""],1]]],"H_HelmetSpecB_sand","G_Bandanna_beast",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ACE_Altimeter",""]]};
        case "jtac": {[]};
        case "rifle" : {[]};
        case "pionier" : {[]};
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
    if (isClass (_patches >> "uns_main")) exitWith
    {
        ACE_player setUnitLoadout [[[],[],[],["UNS_ARMY_BDU_101stAB65pv1",[["ACE_quikclot",15],["ACE_tourniquet",2],["ACE_Atropine",3],["ACE_EntrenchingTool",1]]],["UNS_M1956_A12",[]],[],"UNS_M1_3A","",[],["ItemMap","","","ItemCompass","ItemWatch",""]], true];
    };
    if (isClass (_patches >> "SWOP_Main")) exitWith
    {
        ACE_player setUnitLoadout [[[],[],[],["SWOP_Clonetrooper_501_F_CombatUniform",[["ACE_tourniquet",4],["ACE_EntrenchingTool",1],["ACE_Atropine",5],["ACE_CableTie",2],["ACE_quikclot",15]]],["SWOP_Clonetrooper_501_armor",[]],["SWOP_InvisBag",[]],"SWOP_Cloneofficer_capM","",["ElectroBinocularsW_F","","","",["Laserbatteries",1],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""]], true];
    };

    private _side = side ACE_player;
    if (_side == blufor) exitWith
    {
        // Vanilla-COP
        ACE_player setUnitLoadout [[[],[],["TB_weap_taser","","acc_flashlight_pistol","optic_MRD",["TB_mag_taser",3],[],""],["TB_Uniform_Kommissar_U",[["ACE_quikclot",25],["ACE_Atropine",5],["ACE_tourniquet",4],["ACE_CableTie",5]]],["V_TacVest_blk_POLICE",[["AMP_Breaching_Charge_Mag",1,1],["TB_mag_taser",1,3]]],[],"H_Cap_police","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ACE_Altimeter",""]], true];
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
        TB_fnc_customLayout = {
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
