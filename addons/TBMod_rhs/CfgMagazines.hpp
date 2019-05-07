/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgMagazines
{
    class rhs_mag_m713_Red;
    class rhs_mag_m713_Red_precise : rhs_mag_m713_Red
    {
        ammo = "rhs_40mm_smoke_red_precise";
        author = "TBMod";

        descriptionShort = "Type: AIM Smoke Round - Red<br />Caliber: 40 mm<br />Rounds: 1<br />Used in: M203, M320, M79";
        displayName = "M713A Red Smoke Round";
        displaynameshort = "Red AIM Smoke";

        mass = 5; //5
    };

    class rhs_mag_m714_White;
    class rhs_mag_m714_White_precise : rhs_mag_m714_White
    {
        ammo = "rhs_40mm_smoke_white_precise";
        author = "TBMod";

        descriptionShort = "Type: AIM Smoke Round - White<br />Caliber: 40 mm<br />Rounds: 1<br />Used in: M203, M320, M79";
        displayName = "M714A White Smoke Round";
        displaynameshort = "White AIM Smoke";

        mass = 5; //5
    };

    class rhs_mag_m715_Green;
    class rhs_mag_m715_Green_precise : rhs_mag_m715_Green
    {
        ammo = "rhs_40mm_smoke_green_precise";
        author = "TBMod";

        descriptionShort = "Type: AIM Smoke Round - Green<br />Caliber: 40 mm<br />Rounds: 1<br />Used in: M203, M320, M79";
        displayName = "M715A Green Smoke Round";
        displaynameshort = "Green AIM Smoke";

        mass = 5; //5
    };

    class rhs_mag_m716_Yellow;
    class rhs_mag_m716_Yellow_precise : rhs_mag_m716_Yellow
    {
        ammo = "rhs_40mm_smoke_yellow_precise";
        author = "TBMod";

        descriptionShort = "Type: AIM Smoke Round - Yellow<br />Caliber: 40 mm<br />Rounds: 1<br />Used in: M203, M320, M79";
        displayName = "M716A Yellow Smoke Round";
        displaynameshort = "Yellow AIM Smoke";

        mass = 5; //5
    };

    class CA_LauncherMagazine;
    class rhs_fgm148_magazine_AT : CA_LauncherMagazine
    {
        mass = 176.37; // 286.88
    };

    class rhs_mag_M433_HEDP;
    class TB_rhs_mag_40mm_HEDP : rhs_mag_M433_HEDP // Umbenennung zu TB_HEDP
    {
        ammo = "TB_rhs_40mm_HEDP";
        author = "TBMod";

        descriptionShort = "Type: TB HEDP Grenade Round<br />Caliber: 40 mm<br />Rounds: 1<br />Used in: M203, M320, M79";
        displayName = "TB 40mm HEDP Grenade Round";
        displaynameshort = "TB HEDP Grenade";

        mass = 5; // 5.06
    };

    class rhs_mag_M441_HE;
    class TB_rhs_mag_40mm_HE : rhs_mag_M441_HE // Umbenennung zu TB_HE
    {
        ammo = "TB_rhsusf_40mm_HE";
        author = "TBMod";

        descriptionShort = "Type: TB HE Grenade Round<br />Caliber: 40 mm<br />Rounds: 1<br />Used in: M203, M320, M79";
        displayName = "TB 40mm HE Grenade Round";
        displaynameshort = "TB HE Grenade";

        mass = 5; // 5.06
    };
    class TB_rhs_mag_40mm_Delay : rhs_mag_M441_HE // Delay Grenade
    {
        ammo = "TB_rhs_40mm_Delay";
        author = "TBMod";

        descriptionShort = "Type: TB Delay Direct Grenade Round<br />Caliber: 40 mm<br />Rounds: 1<br />Used in: M203, M320, M79";
        displayName = "TB 40mm Delay Direct Grenade Round";
        displaynameshort = "TB Delay D Grenade";

        initSpeed = 425; // 80
        mass = 5; // 5.06
        picture = "\rhsusf\addons\rhsusf_weapons2\icons\rhs_icon_m781_ca.paa"; // \rhsusf\addons\rhsusf_weapons2\icons\rhs_icon_m443_ca.paa
        tracersEvery = 1; // 0
    };

    class rhsusf_8Rnd_Slug;
    class TB_rhs_mag_40mm_Slugshot : rhsusf_8Rnd_Slug // Umbenennung zu TB_Slugshot
    {
        ammo = "TB_rhs_ammo_40mm_Slugshot";
        author = "TBMod";

        descriptionShort = "Type: TB Slugshot Grenade Round<br />Caliber: 40 mm<br />Rounds: 1<br />Used in: M203, M320, M79";
        displayName = "TB 40mm Slugshot Grenade Round";
        displaynameshort = "TB Slugshot Grenade";

        count = 1; // 8
        mass = 5; // 5.06
        picture = "\rhsusf\addons\rhsusf_weapons\icons\m576_buckshot_ca.paa";
    };

    class rhs_mag_M585_white;
    class TB_rhs_mag_M585_white : rhs_mag_M585_white // White Flare
    {
        ammo = "TB_rhsusf_40mm_white";
        author = "TBMod";

        descriptionShort = "Type: TB White Flare Grenade Round<br />Caliber: 40 mm<br />Rounds: 1<br />Used in: M203, M320, M79";
        displayName = "TB 40mm White Flare Grenade Round";
        displaynameshort = "TB White Flare Grenade";

        mass = 3; // 5.06
    };

    class rhs_mag_m661_green;
    class TB_rhs_mag_m661_green : rhs_mag_m661_green // Green Flare
    {
        ammo = "TB_rhsusf_40mm_green";
        author = "TBMod";

        descriptionShort = "Type: TB Green Flare Grenade Round<br />Caliber: 40 mm<br />Rounds: 1<br />Used in: M203, M320, M79";
        displayName = "TB 40mm Green Flare Grenade Round";
        displaynameshort = "TB Green Flare Grenade";

        mass = 3; // 5.06
    };

    class rhs_mag_m662_red;
    class TB_rhs_mag_m662_red : rhs_mag_m662_red // Red Flare
    {
        ammo = "TB_rhsusf_40mm_red";
        author = "TBMod";

        descriptionShort = "Type: TB Red Flare Grenade Round<br />Caliber: 40 mm<br />Rounds: 1<br />Used in: M203, M320, M79";
        displayName = "TB 40mm Red Flare Grenade Round";
        displaynameshort = "TB Red Flare Grenade";

        mass = 3; // 5.06
    };
};
