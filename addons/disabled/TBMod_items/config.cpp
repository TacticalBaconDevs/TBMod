////////////////////////////////////////////////////////////////////
//DeRap: TBMod_items\config.bin
//Produced from mikero's Dos Tools Dll version 7.16
//https://armaservices.maverick-applications.com/Products/MikerosDosTools/default
//'now' is Mon Jul 29 01:49:45 2019 : 'file' last modified on Sun Jul 28 22:39:53 2019
////////////////////////////////////////////////////////////////////

#define _ARMA_

class CfgPatches
{
	class TBMod_items
	{
		name = "TBMod Items";
		requiredAddons[] = {"TBMod_main"};
		addonRootClass = "TBMod_main";
		units[] = {};
		weapons[] = {"TBMod_items_bacon","TBMod_items_gold","TBMod_items_id_guard","TBMod_items_id_military","TBMod_items_id_police","TBMod_items_keycard","TBMod_items_keycard_east","TBMod_items_keycard_west","TBMod_items_nuclear_terminal","TBMod_items_playboy","TBMod_items_playboy2","TBMod_items_playboy3","TBMod_items_playboy4","TBMod_items_playboy5","TBMod_items_playboy6","TBMod_items_whiskey","TBMod_items_beer","TBMod_items_logbook"};
	};
};
class CfgWeapons
{
	class CBA_MiscItem;
	class CBA_MiscItem_ItemInfo;
	class TB_itemcore: CBA_MiscItem
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
	class TBMod_items_bacon: TB_itemcore
	{
		scope = 2;
		displayName = "Tactical Bacon";
		model = "\A3\Structures_F\Items\Food\TacticalBacon_F";
		picture = "\TBMod_items\pics\bacon.paa";
		class ItemInfo: CBA_MiscItem_ItemInfo
		{
			mass = 10;
		};
	};
	class TBMod_items_gold: TB_itemcore
	{
		scope = 2;
		displayName = "Goldbarren";
		picture = "\TBMod_items\pics\gold_bar.paa";
		class ItemInfo: CBA_MiscItem_ItemInfo
		{
			mass = 50;
		};
	};
	class TBMod_items_id_guard: TB_itemcore
	{
		scope = 2;
		displayName = "Sicherheitsdients ID";
		picture = "\TBMod_items\pics\keycard_east.paa";
		class ItemInfo: CBA_MiscItem_ItemInfo
		{
			mass = 1;
		};
	};
	class TBMod_items_id_military: TB_itemcore
	{
		scope = 2;
		displayName = "Militär ID";
		picture = "\TBMod_items\pics\keycard.paa";
		class ItemInfo: CBA_MiscItem_ItemInfo
		{
			mass = 1;
		};
	};
	class TBMod_items_id_police: TB_itemcore
	{
		scope = 2;
		displayName = "Polizei ID";
		picture = "\TBMod_items\pics\keycard_west.paa";
		class ItemInfo: CBA_MiscItem_ItemInfo
		{
			mass = 1;
		};
	};
	class TBMod_items_keycard: TB_itemcore
	{
		scope = 2;
		displayName = "Schlüsselkarte";
		picture = "\TBMod_items\pics\keycard.paa";
		class ItemInfo: CBA_MiscItem_ItemInfo
		{
			mass = 1;
		};
	};
	class TBMod_items_keycard_east: TB_itemcore
	{
		scope = 2;
		displayName = "Schlüsselkarte";
		picture = "\TBMod_items\pics\keycard_east.paa";
		class ItemInfo: CBA_MiscItem_ItemInfo
		{
			mass = 1;
		};
	};
	class TBMod_items_keycard_west: TB_itemcore
	{
		scope = 2;
		displayName = "Schlüsselkarte";
		picture = "\TBMod_items\pics\keycard_west.paa";
		class ItemInfo: CBA_MiscItem_ItemInfo
		{
			mass = 1;
		};
	};
	class TBMod_items_nuclear_terminal: TB_itemcore
	{
		scope = 2;
		displayName = "Atomraketenkoffer";
		picture = "\TBMod_items\pics\nuclear_football.paa";
		class ItemInfo: CBA_MiscItem_ItemInfo
		{
			mass = 60;
		};
	};
	class TBMod_items_playboy: TB_itemcore
	{
		scope = 2;
		displayName = "Playboy";
		picture = "\TBMod_items\pics\playboy.paa";
		class ItemInfo: CBA_MiscItem_ItemInfo
		{
			mass = 5;
		};
	};
	class TBMod_items_playboy2: TB_itemcore
	{
		scope = 2;
		displayName = "Playboy";
		picture = "\TBMod_items\pics\playboy2.paa";
		class ItemInfo: CBA_MiscItem_ItemInfo
		{
			mass = 5;
		};
	};
	class TBMod_items_playboy3: TB_itemcore
	{
		scope = 2;
		displayName = "Playboy";
		picture = "\TBMod_items\pics\playboy3.paa";
		class ItemInfo: CBA_MiscItem_ItemInfo
		{
			mass = 5;
		};
	};
	class TBMod_items_playboy4: TB_itemcore
	{
		scope = 2;
		displayName = "Playboy";
		picture = "\TBMod_items\pics\playboy4.paa";
		class ItemInfo: CBA_MiscItem_ItemInfo
		{
			mass = 5;
		};
	};
	class TBMod_items_playboy5: TB_itemcore
	{
		scope = 2;
		displayName = "Playboy";
		picture = "\TBMod_items\pics\playboy5.paa";
		class ItemInfo: CBA_MiscItem_ItemInfo
		{
			mass = 5;
		};
	};
	class TBMod_items_playboy6: TB_itemcore
	{
		scope = 2;
		displayName = "Playboy";
		picture = "\TBMod_items\pics\playboy6.paa";
		class ItemInfo: CBA_MiscItem_ItemInfo
		{
			mass = 5;
		};
	};
	class TBMod_items_whiskey: TB_itemcore
	{
		scope = 2;
		displayName = "Whiskey";
		picture = "\TBMod_items\pics\whiskey.paa";
		class ItemInfo: CBA_MiscItem_ItemInfo
		{
			mass = 15;
		};
	};
	class TBMod_items_beer: TB_itemcore
	{
		scope = 2;
		displayName = "Bier";
		picture = "\TBMod_items\pics\beer.paa";
		class ItemInfo: CBA_MiscItem_ItemInfo
		{
			mass = 15;
		};
	};
	class TBMod_items_logbook: TB_itemcore
	{
		scope = 2;
		displayName = "Notizen";
		picture = "\TBMod_items\pics\logbook.paa";
		class ItemInfo: CBA_MiscItem_ItemInfo
		{
			mass = 8;
		};
	};
};
