/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/

/*
    Zum Testen in der Debugconsole, innerhalb von 5sek Debugconsole schließen:
    [] spawn {
        uiSleep 5;
        uiNamespace setVariable ["TB_RscHTML_url", "https://tacticalbacon.de/index.php?faq-regeln"];
        (findDisplay 46) createDisplay "TB_RscHTML";
    };
*/

class RscHTML;
class RscText;
class TB_RscHTML {
   idd = 70500;
    onLoad = "uiNamespace setVariable ['TB_RscHTML', _this # 0]; ((_this # 0) displayCtrl 1800) htmlLoad (uiNamespace getVariable ['TB_RscHTML_url', '']);";
    onKeyDown = "(_this # 0) closeDisplay 1";

   /*class controlsBackground
    {
        class TB_MainBackground : RscText
        {
         idc = -1;
         x = 0.29375 * safezoneW + safezoneX;
         y = 0.225 * safezoneH + safezoneY;
         w = 0.4125 * safezoneW;
         h = 0.55 * safezoneH;
            colorBackground[] = {0, 0, 0, 0.7};
      };
    };*/

   class controls
    {
      class TB_RscHTML : RscHTML
      {
         idc = 1800;
         x = 0.29375 * safezoneW + safezoneX;
         y = 0.225 * safezoneH + safezoneY;
         w = 0.4125 * safezoneW;
         h = 0.55 * safezoneH;
            colorBackground[] = {0, 0, 0, 0.7};
      };
   };
};
