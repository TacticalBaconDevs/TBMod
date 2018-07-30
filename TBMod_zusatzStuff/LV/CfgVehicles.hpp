
class TB_zusatz_lv_militarize : TB_zusatz_Module {
	scope = 2;
	displayName = "LV Militarize";
	function = "TB_LV_fnc_moduleMilitarize";
	canSetArea = 1;
	canSetAreaHeight = 0;
	canSetAreaShape = 0;
	
	class AttributeValues
	{
		isRectangle = 0;
		size3[] = {150,150,-1};
	};
	
	class Attributes: AttributesBase
	{
		class filterClass: Edit
		{
			property = "TB_zusatz_lv_militarize_filterClass";
			displayName = "Filterklassen aus der Config";
			tooltip = "ConfigKlasse aus der config_aissp.hpp auch mehrere möglich!";
			typeName = "STRING";
			defaultValue = "['customClass1']";
		};
		class side: Edit
		{
			property = "TB_zusatz_lv_militarize_side";
			displayName = "Feindseite";
			tooltip = "0 = civilian, 1 = blue, 2 = red, 3 = green";
			typeName = "NUMBER";
			defaultValue = "2";
		};
		// class radius: Edit
		// {
			// property = "TB_zusatz_lv_militarize_radius";
			// displayName = "Radius";
			// tooltip = "Radius um dieses Modul";
			// typeName = "NUMBER";
			// defaultValue = "150";
		// };
		class menSpawnLand: Checkbox
		{
			property = "TB_zusatz_lv_militarize_menSpawnLand";
			displayName = "Infanterie";
			tooltip = "Soll Infanterie gesetzt werden?";
			typeName = "BOOL";
			defaultValue = "true";
		};
		class menSpawnWater: Checkbox
		{
			property = "TB_zusatz_lv_militarize_menSpawnWater";
			displayName = "Taucher-Infanterie";
			tooltip = "ACHTUNG, Wasser muss im Radius sein! Soll Taucherinfanterie gesetzt werden?";
			typeName = "BOOL";
			defaultValue = "false";
		};
		class vehSpawnLand: Checkbox
		{
			property = "TB_zusatz_lv_militarize_vehSpawnLand";
			displayName = "Fahrzeuge";
			tooltip = "Sollen Landfahrzeuge gesetzt werden?";
			typeName = "BOOL";
			defaultValue = "true";
		};
		class vehSpawnWater: Checkbox
		{
			property = "TB_zusatz_lv_militarize_vehSpawnWater";
			displayName = "Boote";
			tooltip = "ACHTUNG, Wasser muss im Radius sein! Sollen Boote gesetzt werden?";
			typeName = "BOOL";
			defaultValue = "false";
		};
		class vehSpawnAir: Checkbox
		{
			property = "TB_zusatz_lv_militarize_vehSpawnAir";
			displayName = "Heli/Jet";
			tooltip = "Sollen Heli/Jet gesetzt werden?";
			typeName = "BOOL";
			defaultValue = "false";
		};
		class patrol: Checkbox
		{
			property = "TB_zusatz_lv_militarize_patrol";
			displayName = "Patrouillieren";
			tooltip = "Sollen die Einheiten patrouillieren oder nichts machen.";
			typeName = "BOOL";
			defaultValue = "true";
		};
		class infCoef: Edit
		{
			property = "TB_zusatz_lv_militarize_infCoef";
			displayName = "Infanterieverhältnis";
			tooltip = "Array -> [BASIS, RANDOM]";
			typeName = "STRING";
			defaultValue = "[10,5]";
		};
		class vehCoef: Edit
		{
			property = "TB_zusatz_lv_militarize_vehCoef";
			displayName = "Fahrzeugverhältnis";
			tooltip = "Array -> [BASIS, RANDOM]";
			typeName = "STRING";
			defaultValue = "[0,1]";
		};
		class skill: Edit
		{
			property = "TB_zusatz_lv_militarize_skill";
			displayName = "Skill";
			tooltip = "eine Zahl von 0 bis 1 kann die Stärke angepasst werden, (-1 = keine Veränderung)";
			typeName = "NUMBER";
			defaultValue = "-1";
		};
		class smokeChems: Checkbox
		{
			property = "TB_zusatz_lv_militarize_smokeChems";
			displayName = "Rauch und Knicklichter";
			tooltip = "Alle Einheiten haben Rauch und Knicklichter und nutzen diese auch.";
			typeName = "BOOL";
			defaultValue = "false";
		};
		class doorHandling: Checkbox
		{
			property = "TB_zusatz_lv_militarize_doorHandling";
			displayName = "Türen bei Patrol zumachen";
			tooltip = "Wenn Patrol ein, dann macht die KI die Türen wieder zu";
			typeName = "BOOL";
			defaultValue = "false";
		};
        class dynSim: Checkbox
		{
			property = "TB_zusatz_lv_militarize_dynSim";
			displayName = "Dynamische Simulation";
			tooltip = "Schaltet dynamische Simulation für alle Einheiten an";
			typeName = "BOOL";
			defaultValue = "false";
		};
	};
};
