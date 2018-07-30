class CfgPatches
{
	class TBMod_items
	{
		units[] = {};
		weapons[] =
		{
			"TB_Item_Base",
			"TB_Item_liveMonitor",
			"TB_Item_coffeeMachine"
		};
		
		version = 1;
		requiredVersion = 1.82;
		requiredAddons[] = {
			"A3_Data_F_Tank_Loadorder",
			"TBMod_main"
		};
		author = "Chris [TacticalBacon]";
		fileName = "TBMod_items.pbo";
	};
};

class cfgWeapons
{
	class CBA_MiscItem;
	class CBA_MiscItem_ItemInfo;
	
	class TB_Item_Base: CBA_MiscItem
	{
		displayName="-";
		picture="";
		descriptionShort="";
		scope=1;
		
		class ItemInfo: CBA_MiscItem_ItemInfo
		{
			mass=10;
		};
	};

	//Medics
	class TB_Item_liveMonitor: TB_Item_Base
	{
		scope=2;
		scopeCurator=2;
		displayName="Live Monitor (Medic)";

		picture="\TBMod_items\pictures\liveMonitor";
		model="\TBMod_items\models\liveMonitor.p3d";

		descriptionShort="A monitor for tracking heart rate, blood pressure and blood lost. Use arrow keys to switch between mods.";
		class ItemInfo: ItemInfo
		{
			mass=5;
		};
	};

	//Charlie
	// class TB_Item_coffeeMachine: TB_Item_Base
	// {
		// scope=2;
		// displayName="Coffee Machine";

		// picture="\TBMod_items\pictures\liveMonitor";
		// model="\TBMod_items\models\coffeeMachine.p3d";

		// descriptionShort="The best for the best! This machine wakes everyone up.";
		// class ItemInfo: ItemInfo
		// {
			// mass=5;
		// };
	// };
};

class CfgVehicles
{
	class Man;
	class CAManBase: Man
	{
		class ACE_Actions
		{
			class ACE_MainActions
			{
				class TB_Item_liveMonitor_connect
				{
					displayName="Connect to solider";
					icon="\TBMod_items\pictures\medical_cross_lm.paa";
					condition="call TB_Items_fnc_lm_canShow";
					statement="TB_Item_liveMonitor_unit = _target;";
					exceptions[]=
					{
						"isNotInside",
						"isNotSwimming",
						"isNotSitting"
					};	
				};
			};
		};
		class ACE_SelfActions
		{
			class Medical
			{
				class TB_Item_liveMonitor_connectSelf
				{
					displayName="Connect to solider";
					icon="\TBMod_items\pictures\medical_cross_lm.paa";
					condition="call TB_Items_fnc_lm_canShow";
					statement="TB_Item_liveMonitor_unit = player;";
					exceptions[]=
					{
						"isNotInside",
						"isNotSwimming",
						"isNotSitting"
					};	
				};
			};

			class ACE_Equipment
			{
				class TB_Item_liveMonitor_show
				{
					displayName="Live Monitor (Medic)";
					condition="call TB_Items_fnc_lm_canShow";
					showDisabled=0;
					priority=0.1;
					icon="\TBMod_items\pictures\medical_cross_lm.paa";
					exceptions[]=
					{
						"notOnMap",
						"isNotInside",
						"isNotSitting"
					};

					class TB_Item_liveMonitor_open
					{
						displayName="Open";
						condition="call TB_Items_fnc_lm_canShow && !TB_Item_liveMonitor_isActive";
						statement="call TB_Items_fnc_lm_initialize";
						showDisabled=0;
						priority=0.2;
						icon="\TBMod_items\pictures\medical_cross_lm.paa";
						exceptions[]=
						{
							"notOnMap",
							"isNotInside",
							"isNotSitting"
						};
					};

					class TB_Item_liveMonitor_hide
					{
						displayName="Close";
						condition="TB_Item_liveMonitor_isActive";
						statement="call TB_Items_fnc_lm_remove";
						showDisabled=0;
						priority=0.30000001;
						icon="\TBMod_items\pictures\medical_cross_lm.paa";
						exceptions[]=
						{
							"notOnMap",
							"isNotInside",
							"isNotSitting"
						};
					};
				};
			};
		};
	};
};

class RscTitles 
{
	#include "UI\common.hpp"
	#include "UI\common_EditorWrapper.hpp"
	#include "UI\liveMonitor.hpp"
};

class CfgFunctions
{
	class TBMod_items
	{
		tag = "TB_Items";
		
		class TB_Item_liveMonitor
		{
			file = "\TBMod_items\functions\liveMonitor";

			class lm_animated {};
			class lm_canShow {};
			class lm_initialize {};
			class lm_loop {};
			class lm_remove {};
		};
	};
};

class Extended_PostInit_EventHandlers
{
	class TB_Items
	{
		init="call compile preProcessFileLineNumbers '\TBMod_items\XEH_postInit.sqf'";
	};
};