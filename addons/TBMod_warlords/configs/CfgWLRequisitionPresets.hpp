/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    requirements: "A" = airstrip, "H" = helipad, "W" = water (harbor)
*/
// ###################### Makros ######################
#define ADD(ITEM,KOSTEN) class ITEM {cost = KOSTEN; requirements[]={};}
#define ADDREQ(ITEM,KOSTEN,REQ) class ITEM {cost = KOSTEN; requirements[]={ #REQ };}

class CfgWLRequisitionPresets
{
    class TB_RHS
    {
        class WEST
        {
            class Infantry
            {
                ADD(rhsusf_army_ocp_arb_rifleman, 100);
                ADD(rhsusf_army_ocp_arb_grenadier, 150);
                ADD(rhsusf_army_ocp_arb_medic, 150);
                ADD(rhsusf_army_ocp_arb_autoriflemana, 200);
                ADD(rhsusf_army_ocp_arb_autorifleman, 200);
                ADD(rhsusf_army_ocp_arb_engineer, 250);
                ADD(rhsusf_army_ocp_arb_marksman, 350);
                ADD(rhsusf_army_ocp_arb_maaws, 500);
                ADD(rhsusf_army_ocp_aa, 500);
            };

            class Vehicles
            {
                // ### Autos
                ADD(rhsusf_m1043_d, 500);
                ADD(rhsusf_m1043_d_m2, 750);
                ADD(rhsusf_m1043_d_mk19, 800);
                ADD(rhsusf_m1045_d, 1500);

                // ### LKWs
                ADD(rhsusf_M1078A1P2_D_fmtv_usarmy, 1000);

                // ### MRAPS
                ADD(rhsusf_CGRCAT1A2_usmc_d, 1200);
                ADD(rhsusf_CGRCAT1A2_M2_usmc_d, 1400);
                ADD(rhsusf_CGRCAT1A2_Mk19_usmc_d, 1500);

                // ### SPW
                ADD(rhsusf_M1117_D, 2000);

                // ### SPZ
                ADD(RHS_M2A3, 3000);
                ADD(RHS_M2A3_BUSKIII, 4000);

                // ### Panzer
                ADD(rhsusf_m1a2sep1d_usarmy, 6000);
                ADD(rhsusf_m1a2sep1tuskiid_usarmy, 7000);
            };

            class Aircraft
            {
                ADDREQ(RHS_MELB_H6M, 1000, H);
                ADDREQ(RHS_MELB_MH6M, 1500, H);
                ADDREQ(RHS_UH60M_d, 3000, H);
            };

            class Naval
            {
                ADDREQ(B_Boat_Transport_01_F, 100, W);
            };

            class Gear
            {
                // ### Allgemein
                ADD(TB_supply_all_medic, 100);
                ADD(TB_supply_all_building, 300);
                ADD(TB_supply_all_mines, 400);

                // ### Fraktionspezifisch
                ADD(TB_WL_AR_AR_556mm_USA_Kiste, 50);
                ADD(TB_WL_Mun_AR_USA, 150);
                ADD(TB_WL_GREN_556mm_USA_Kiste, 250);
                ADD(TB_WL_Mun_GREN_USA, 600);
                ADD(TB_WL_MG_556mm_USA_Kiste, 300);
                ADD(TB_WL_Mun_MG556_USA, 900);
                ADD(TB_WL_MG_762mm_USA_Kiste, 600);
                ADD(TB_WL_Mun_MG762_USA, 1300);
                ADD(TB_WL_DMR_762mm_USA_Kiste, 1000);
                ADD(TB_WL_Mun_DMR762_USA, 2200);
                ADD(TB_WL_Werfer_USA_Leicht_Kiste, 550);
                ADD(TB_WL_Werfer_USA_Schwer_Kiste, 1500);
                ADD(TB_WL_Mun_Werfer_Schwer_USA, 1900);
            };

            class Defences
            {
                ADD(rhs_M2StaticMG_MiniTripod_D, 200);
                ADD(rhs_M2StaticMG_D, 250);
                ADD(rhs_MK19_TriPod_D, 300);
                ADD(rhs_Stinger_AA_pod_D, 400);
                ADD(rhs_TOW_TriPod_D, 400);
            };
        };

        // #### Opfor
        class EAST
        {
            class Infantry
            {
                ADD(rhs_vdv_des_rifleman, 100);
                ADD(rhs_vdv_des_grenadier, 150);
                ADD(rhs_vdv_des_medic, 150);
                ADD(rhs_vdv_des_machinegunner_assistant, 200);
                ADD(rhs_vdv_des_machinegunner, 200);
                ADD(rhs_vdv_des_engineer, 250);
                ADD(rhs_vdv_des_marksman, 350);
                ADD(rhs_vdv_des_at, 500);
                ADD(rhs_vdv_des_aa, 500);
            };

            class Vehicles
            {
                // ### Autos
                ADD(rhsgref_ins_uaz_open, 400);
                ADD(rhsgref_ins_uaz_dshkm, 650);
                ADD(rhsgref_ins_uaz_ags, 700);
                ADD(rhsgref_ins_uaz_spg9, 800);

                // ### LKWs
                ADD(rhs_gaz66_msv, 900);

                // ### MRAPS
                ADD(rhs_tigr_3camo_msv, 1200);
                ADD(rhs_tigr_sts_3camo_msv, 1800);

                // ### SPW
                ADD(rhsgref_BRDM2_msv, 2100);

                // ### SPZ
                ADD(rhs_bmp3m_msv, 3000);
                ADD(rhs_bmp3mera_msv, 4000);

                // ### Panzer
                ADD(rhs_t72bc_tv, 7000);
                ADD(rhs_t72ba_tv, 8000);
            };

            class Aircraft
            {
                ADDREQ(RHS_MELB_H6M, 1000, H);
                ADDREQ(RHS_MELB_MH6M, 1500, H);
                ADDREQ(RHS_UH60M_d, 3000, H);
            };

            class Naval
            {
                ADDREQ(O_Boat_Transport_01_F, 100, W);
            };

            class Gear
            {
                // ### Allgemein
                ADD(TB_supply_all_medic, 100);
                ADD(TB_supply_all_building, 300);
                ADD(TB_supply_all_mines, 400);

                // ### Fraktionspezifisch
                ADD(TB_WL_AR_545mm_RUS_Kiste, 50);
                ADD(TB_WL_Mun_AR_RUS, 150);
                ADD(TB_WL_GREN_545mm_RUS_Kiste, 250);
                ADD(TB_WL_Mun_GREN_RUS, 600);
                ADD(TB_WL_MG_556mm_RUS_Kiste, 300);
                ADD(TB_WL_Mun_MG556_RUS, 900);
                ADD(TB_WL_MG_762mm_RUS_Kiste, 600);
                ADD(TB_WL_Mun_MG762_RUS, 1300);
                ADD(TB_WL_DMR_762mm_RUS_Kiste, 1000);
                ADD(TB_WL_Mun_DMR772_RUS, 2200);
                ADD(TB_WL_Werfer_RUS_Leicht_Kiste, 550);
                ADD(TB_WL_Werfer_RUS_Schwer_Kiste, 1500);
                ADD(TB_WL_Mun_Werfer_Schwer_RUS, 1900);
            };

            class Defences
            {
                ADD(rhs_M2StaticMG_MiniTripod_D, 200);
                ADD(rhs_M2StaticMG_D, 250);
                ADD(rhs_MK19_TriPod_D, 300);
                ADD(rhs_Stinger_AA_pod_D, 400);
                ADD(rhs_TOW_TriPod_D, 400);
            };
        };
    };
};
