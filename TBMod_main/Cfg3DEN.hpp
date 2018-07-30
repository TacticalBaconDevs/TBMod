class Cfg3DEN
{
	class Mission
	{
		class Scenario
		{
			class AttributeCategories
			{
				class TB_main_missionVars
				{
					collapsed = 0;
					displayName = "TB Missionwerte";
					
					class Attributes
					{
						class TB_mission_extremMedic
						{
							displayName = "extremes Sanisystem";
							tooltip = "Arzt kann nur noch EHK verwenden usw. GENEMIGUNGSPFLICHTIG!";
							property = "TB_main_mission_extremMedic";
							control = "Checkbox";
							expression = "if (!is3DEN) then {TB_addArztRolle = _value; publicVariable 'TB_addArztRolle'};";
							defaultValue = "false";
						};
						class TB_mission_crashHelfer
						{
							displayName = "Crashhelfer";
							tooltip = "Wenn jemand die Mission verlässt, wird alles über ihn gespeichert.";
							property = "TB_mission_crashHelfer";
							control = "Checkbox";
							expression = "if (!is3DEN) then {TB_crashHelfer = _value; publicVariable 'TB_crashHelfer'};";
							defaultValue = "true";
						};
						class TB_mission_doorBreach
						{
							displayName = "DoorBreach";
							tooltip = "Schrotflinten SLUG Munition kann verschlossene Türen öffnen.";
							property = "TB_mission_doorBreach";
							control = "Checkbox";
							expression = "if (!is3DEN) then {TB_doorBreach = _value; publicVariable 'TB_doorBreach'};";
							defaultValue = "false";
						};
						class TB_mission_recoilSystem
						{
							displayName = "RecoilSystem Koeffizent";
							tooltip = "Die Stärke des dynamischen Rückstoßes. -1 = AUS";
							property = "TB_mission_recoilSystem";
							control = "Edit";
							expression = "if (!is3DEN) then {TB_recoilCoef = _value; publicVariable 'TB_recoilCoef'};";
							defaultValue = "1";
							validate = "number";
							typeName = "NUMBER";
						};
					};
				};
			};
		};
	};
	
	class Object
	{
		class AttributeCategories
		{
			class Inventory
			{
				class Attributes
				{
					class TB_main_disableCargoCleanup
					{
						displayName = "Inventar nicht löschen";
						tooltip = "Normalerweise werden alle Inventare gelöscht, wenn diese Option an ist nicht!";
						property = "TB_main_disableCargoCleanup";
						control = "Checkbox";
						expression = "if (!is3DEN && _value) then {_this setVariable ['TB_main_disableCargoCleanup', true, true]}";
						condition = "objectVehicle + objectSimulated + objectHasInventoryCargo";
						defaultValue = "false";
					};
				};
			};

			class TBMod_Main_KI_Actions
			{
				displayName = "TB KI-Aktionen";
				collapsed = 1;
				
				class Attributes
				{
					class TBMod_Main_kiDeckung
					{
						displayName = "UpDown Skript";
						tooltip = "KI UpDown Skript";
						property = "TBMod_Main_kiDeckung";
						control = "Checkbox";
 
                        expression = "";
						//expression = "if (!is3DEN && _value) then {this addeventhandler ['FiredNear', {[_this select 0, ['UP', 'MIDDLE']] spawn TB_fnc_UpDown}]}";
 
						defaultValue = "false";
 
						unique = 0;
						condition = "objectControllable";
					};
				};
			};
		};
	};
};
