// configfile >> "CfgMagazines" >> "UGL_FlareWhite_F"
// configfile >> "CfgAmmo" >> "F_40mm_White"
class CfgAmmo
{
	class FlareCore;
    class FlareBase: FlareCore {
        intensity = 250000;
        flareSize = 12;
        timeToLive = 180;
    };
	
	class F_20mm_White: FlareBase {
        intensity = 800000;
		brightness = 1000000;
		
		//flareSize = 12;
		useFlare = 1;
		timeToLive = 500;
		coefGravity = 0.5;
    };

    class F_40mm_White: FlareBase {
		intensity = 1500000;
		brightness = 2000000;
		
		//flareSize = 12;
		useFlare = 1;
		timeToLive = 600;
		coefGravity = 0.5;
    };

    class Flare_82mm_AMOS_White: FlareCore {
        intensity = 4000000;
		brightness = 3000000;
		
        flareSize = 20;
        timeToLive = 1000;
		coefGravity = 0.3;
    };
};