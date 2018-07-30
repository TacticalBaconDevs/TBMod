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
	
	// Zivil
	ADD_ITEM(RoadBarrier_F,"\A3\Signs_F\SignT\RoadBarrier_F.p3d",20);
	// ADD_ITEM(RoadBarrier_small_F,"\A3\signs_f\SignT\RoadBarrier_small_F.p3d");
	ADD_ITEM(RoadCone_F,"\A3\signs_f\SignT\RoadCone_F.p3d",10);
	// ADD_ITEM(RoadCone_L_F,"\A3\signs_f\SignT\RoadCone_L_F.p3d");
	ADD_ITEM(Land_PortableLight_single_F,"\A3\structures_f_epa\Civ\Constructions\PortableLight_single_F.p3d",15);
	// ADD_ITEM(TapeSign_F,"\A3\signs_f\SignT\TapeSign_F.p3d");
	// ADD_ITEM(Target_F,"\A3\structures_f\Training\Target_F.p3d");
	// ADD_ITEM(Land_Camping_Light_F,"\A3\structures_f\Civ\Camping\Camping_Light_F.p3d");
	// ADD_ITEM(Land_CampingChair_V1_F,"\A3\structures_f\Civ\Camping\CampingChair_V1_folded_F.p3d");
	// ADD_ITEM(Campfire_F,"\A3\structures_f\Civ\Camping\Campfire_F.p3d");
	// ADD_ITEM(Land_CampingTable_F,"\A3\Structures_F\Civ\Camping\CampingTable_F.p3d");
	
	ADD_ITEM(Land_Pallet_vertical_F,"\A3\structures_f\Civ\Constructions\Pallet_vertical_F.p3d",15);
	ADD_ITEM(Land_BagFence_Long_F,"A3\Structures_F\Mil\BagFence\BagFence_Long_F.p3d",20);
	ADD_ITEM(Land_BagFence_Round_F,"\A3\structures_f\mil\BagFence\BagFence_Round_F.p3d",18);
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
	ADD_ITEM(Land_SandbagBarricade_01_hole_F,"\A3\Structures_F_Argo\Military\Fortifications\SandbagBarricade_01_hole_F.p3d",22);

	// ADD_TOOL(Land_DrillAku_F,"\A3\structures_f\Items\Tools\DrillAku_F.p3d");
	// ADD_TOOL(Land_Wrench_F,"\A3\structures_f\Items\Tools\Wrench_F.p3d");	
};
