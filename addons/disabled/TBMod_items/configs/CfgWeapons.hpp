/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
#define ADD_ITEM(OBJECT,DISPNAME,MODEL_NAME,PICT,GEWICHT) class TBMod_items_##OBJECT : TB_itemcore \
    { \
        scope = 2; \
        displayName = DISPNAME; \
        model = MODEL_NAME; \
        picture = \TBMod_items\pics\PICT; \
        class ItemInfo: CBA_MiscItem_ItemInfo \
        { \
            mass = GEWICHT; \
        }; \
    }
#define ADD_ITEM2(OBJECT,DISPNAME,PICT,GEWICHT) class TBMod_items_##OBJECT : TB_itemcore \
    { \
        scope = 2; \
        displayName = DISPNAME; \
        picture = \TBMod_items\pics\PICT; \
        class ItemInfo: CBA_MiscItem_ItemInfo \
        { \
            mass = GEWICHT; \
        }; \
    }




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
        //model = "\A3\weapons_F\ammo\mag_univ.p3d";
        //picture = "\A3\EditorPreviews_F\Data\CfgVehicles\OBJECT.jpg";

        class ItemInfo: CBA_MiscItem_ItemInfo
        {
            mass = 15;
        };
    };

    // VoP Items
    ADD_ITEM(bacon,"Tactical Bacon","\A3\Structures_F\Items\Food\TacticalBacon_F",bacon.paa,10);
    ADD_ITEM2(gold,"Goldbarren",gold_bar.paa,50);
    ADD_ITEM2(id_guard,"Sicherheitsdients ID",keycard_east.paa,1);
    ADD_ITEM2(id_military,"Militär ID",keycard.paa,1);
    ADD_ITEM2(id_police,"Polizei ID",keycard_west.paa,1);
    ADD_ITEM2(keycard,"Schlüsselkarte",keycard.paa,1); //model = "\A3\Structures_F\Items\Documents\Photos_V4_F"; //can't get this to work
    ADD_ITEM2(keycard_east,"Schlüsselkarte",keycard_east.paa,1);
    ADD_ITEM2(keycard_west,"Schlüsselkarte",keycard_west.paa,1);
    ADD_ITEM2(nuclear_terminal,"Atomraketenkoffer",nuclear_football.paa,60);
    ADD_ITEM2(playboy,"Playboy",playboy.paa,5);
    ADD_ITEM2(playboy2,"Playboy",playboy2.paa,5);
    ADD_ITEM2(playboy3,"Playboy",playboy3.paa,5);
    ADD_ITEM2(playboy4,"Playboy",playboy4.paa,5);
    ADD_ITEM2(playboy5,"Playboy",playboy5.paa,5);
    ADD_ITEM2(playboy6,"Playboy",playboy6.paa,5);
    ADD_ITEM2(whiskey,"Whiskey",whiskey.paa,15);
    ADD_ITEM2(beer,"Bier",beer.paa,15);
    ADD_ITEM2(logbook,"Notizen",logbook.paa,8);

};
