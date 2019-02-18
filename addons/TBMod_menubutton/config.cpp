// Original by Ampersand https://github.com/ampersand38/Server-Spotlight

class CfgPatches {
    class TBMod_menubutton {

        requiredAddons[] = {
            "TBMod_main",
		};

    };
};

class RscStandardDisplay;
class RscDisplayMain: RscStandardDisplay {
	class Spotlight {
		class AwesomeServer {
			text = ""; // Text displayed on the square button, converted to upper-case
			textIsQuote = 0; // 1 to add quotation marks around the text
			picture = "\TBMod_menubutton\button.paa"; // Square picture, ideally 512x512
			//video = "\a3\Ui_f\Video\spotlight_1_Apex.ogv"; // Video played on mouse hover
			//action = "0 = [_this, 'your.domain.name', '2302', 'yourpasshere'] execVM '\amp_spotlight\joinServer.sqf';";
			action = "0 = [_this, 'server.tacticalbacon.de', '2302', 'TacticalBacon'] execVM '\TBMod_menubutton\joinServer.sqf';";
			actionText = "Join TacticalBacon Server"; // Text displayed in top left corner of on-hover white frame
			condition = "true"; // Condition for showing the spotlight
		};
	};
};
