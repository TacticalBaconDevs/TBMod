/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
#define ADD_ITEM(OBJECT,MODEL_NAME,GEWICHT) class TB_building_item_##OBJECT : TB_itemcore \
    { \
        scope = 2; \
        displayName = $STR_ITEM_##OBJECT; \
        model = MODEL_NAME; \
        class ItemInfo: CBA_MiscItem_ItemInfo \
        { \
            mass = GEWICHT; \
        }; \
    }
#define ADD_TOOL(OBJECT,MODEL_NAME) class TB_building_tool_##OBJECT : TB_itemcore \
    { \
        scope = 2; \
        displayName = $STR_ITEM_##OBJECT; \
        model = MODEL_NAME; \
    }

// picture = "\A3\EditorPreviews_F\Data\CfgVehicles\OBJECT.jpg";

class CfgWeapons
{
    class CBA_MiscItem;
    class CBA_MiscItem_ItemInfo;

    class TB_itemcore : CBA_MiscItem
    {
        scope = 0;
        author = "shukari";
        descriptionShort = "";
        icon = "iconObject_circle";

        class ItemInfo: CBA_MiscItem_ItemInfo
        {
            mass = 15;
        };
    };

    // Sanibaukiste
    ADD_ITEM(Land_IntravenStand_01_2bags_F,"\A3\Props_F_Orange\Humanitarian\Camps\IntravenStand_01_F.p3d",10);
    ADD_ITEM(Land_Stretcher_01_F,"\A3\Props_F_Orange\Humanitarian\Camps\Stretcher_01_F.p3d",22);
    ADD_ITEM(Land_PortableLight_double_F,"\A3\Structures_F_EPA\Civ\Constructions\PortableLight_double_F.p3d",30);
    ADD_ITEM(Land_MedicalTent_01_white_generic_open_F,"\A3\Structures_F_Orange\Humanitarian\Camps\MedicalTent_01_F.p3d",44);    //muss noch als Medizinische Einrichtung gesetzt werden
    ADD_ITEM(Land_MedicalTent_01_floor_light_F,"\A3\Structures_F_Orange\Humanitarian\Camps\MedicalTent_01_floor_light_F.p3d",10);

    // Zivil
    ADD_ITEM(RoadBarrier_F,"\A3\Signs_F\SignT\RoadBarrier_F.p3d",22);
    // ADD_ITEM(RoadBarrier_small_F,"\A3\signs_f\SignT\RoadBarrier_small_F.p3d");
    ADD_ITEM(RoadCone_F,"\A3\signs_f\SignT\RoadCone_F.p3d",10);
    // ADD_ITEM(RoadCone_L_F,"\A3\signs_f\SignT\RoadCone_L_F.p3d");
    ADD_ITEM(Land_PortableLight_single_F,"\A3\structures_f_epa\Civ\Constructions\PortableLight_single_F.p3d",25);
    // ADD_ITEM(TapeSign_F,"\A3\signs_f\SignT\TapeSign_F.p3d");
    // ADD_ITEM(Target_F,"\A3\structures_f\Training\Target_F.p3d");
    // ADD_ITEM(Land_Camping_Light_F,"\A3\structures_f\Civ\Camping\Camping_Light_F.p3d");
    // ADD_ITEM(Land_CampingChair_V1_F,"\A3\structures_f\Civ\Camping\CampingChair_V1_folded_F.p3d");
    // ADD_ITEM(Campfire_F,"\A3\structures_f\Civ\Camping\Campfire_F.p3d");
    // ADD_ITEM(Land_CampingTable_F,"\A3\Structures_F\Civ\Camping\CampingTable_F.p3d");

    ADD_ITEM(Land_Pallet_vertical_F,"\A3\structures_f\Civ\Constructions\Pallet_vertical_F.p3d",22);
    ADD_ITEM(Land_BagFence_Long_F,"A3\Structures_F\Mil\BagFence\BagFence_Long_F.p3d",44);
    ADD_ITEM(Land_BagFence_Round_F,"\A3\structures_f\mil\BagFence\BagFence_Round_F.p3d",40);
    class TB_building_item_ace_concertinawirecoil : TB_itemcore
    {
        scope = 2;
        displayName = $STR_ITEM_ace_concertinawirecoil;
        // picture = "\A3\EditorPreviews_F\Data\CfgVehicles\##OBJECT##.jpg";
        model = "\z\ace\addons\concertina_wire\data\ACE_ConcertinaWireCoil.p3d";

        class ItemInfo: CBA_MiscItem_ItemInfo
        {
            mass = 5;
        };
    };
    ADD_ITEM(Land_SandbagBarricade_01_hole_F,"\A3\Structures_F_Argo\Military\Fortifications\SandbagBarricade_01_hole_F.p3d",66);

    // ADD_TOOL(Land_DrillAku_F,"\A3\structures_f\Items\Tools\DrillAku_F.p3d");
    // ADD_TOOL(Land_Wrench_F,"\A3\structures_f\Items\Tools\Wrench_F.p3d");
};
