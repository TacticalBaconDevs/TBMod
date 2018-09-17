/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgMagazines
{
    class 11Rnd_45ACP_Mag;
    class TB_mag_taser : 11Rnd_45ACP_Mag
    {
        ammo = "TB_ammo_taser";
        author = "TBMod";
        count = 1; //2
        initSpeed = 50;
        descriptionShort = "Taser Magazin<br />Rounds: 1<br />Benutzt in: Taser";
        displayName = "Taser Magazine";
        displaynameshort = "Taser Magazine";
    };
    
    class 6Rnd_45ACP_Cylinder;
    class TB_mag_taser2 : 6Rnd_45ACP_Cylinder
    {
        ammo = "TB_ammo_taser";
        author = "TBMod";
        count = 1; //2
        initSpeed = 50;
        mass = 20;
        descriptionShort = "CoolererTaser Magazin<br />Rounds: 1<br />Benutzt in: CoolererTaser";
        displayName = "CoolererTaser Magazine";
        displaynameshort = "CoolererTaser Magazine";
    };
};
