class Indep {

    class I_TB_Drogen {
        name = "[TB] Drogenhaendler";

        class Infantry {
            name = "Infantry";

            class i_itbdrogen_infantry_patrouille {
                name = "Patrouille";
                side = 2;
                faction = "I_TB_Drogen";
                icon = "\A3\ui_f\data\map\markers\nato\n_inf.paa";
                rarityGroup = 0.5;

                class Unit0 {
                    position[] = {0,0,0};
                    rank = "SERGEANT";
                    side = 2;
                    vehicle = "I_ITBDrogen_Drogenheandler_01";
                };
                class Unit1 {
                    position[] = {5,-5,0};
                    rank = "PRIVATE";
                    side = 2;
                    vehicle = "I_ITBDrogen_Drogenheandler_03";
                };
            };

            class i_itbdrogen_infantry_schlagtrupp {
                name = "Schlaegertrupp";
                side = 2;
                faction = "I_TB_Drogen";
                icon = "\A3\ui_f\data\map\markers\nato\n_inf.paa";
                rarityGroup = 0.5;

                class Unit0 {
                    position[] = {0,0,0};
                    rank = "SERGEANT";
                    side = 2;
                    vehicle = "I_ITBDrogen_Drogenheandler_01";
                };
                class Unit1 {
                    position[] = {5,-5,0};
                    rank = "PRIVATE";
                    side = 2;
                    vehicle = "I_ITBDrogen_Drogenheandler_02";
                };
                class Unit2 {
                    position[] = {-5,-5,0};
                    rank = "PRIVATE";
                    side = 2;
                    vehicle = "I_ITBDrogen_Drogenheandler_03";
                };
                class Unit3 {
                    position[] = {10,-10,0};
                    rank = "PRIVATE";
                    side = 2;
                    vehicle = "I_ITBDrogen_Drogenheandler_01";
                };
            };

            class i_itbdrogen_infantry_bosstrupp {
                name = "BossTrupp";
                side = 2;
                faction = "I_TB_Drogen";
                icon = "\A3\ui_f\data\map\markers\nato\n_inf.paa";
                rarityGroup = 0.5;

                class Unit0 {
                    position[] = {0,0,0};
                    rank = "SERGEANT";
                    side = 2;
                    vehicle = "I_ITBDrogen_Drogenboss_01";
                };
                class Unit1 {
                    position[] = {5,-5,0};
                    rank = "PRIVATE";
                    side = 2;
                    vehicle = "I_ITBDrogen_Drogenheandler_01";
                };
                class Unit2 {
                    position[] = {-5,-5,0};
                    rank = "PRIVATE";
                    side = 2;
                    vehicle = "I_ITBDrogen_Drogenheandler_02";
                };
                class Unit3 {
                    position[] = {10,-10,0};
                    rank = "PRIVATE";
                    side = 2;
                    vehicle = "I_ITBDrogen_Drogenheandler_03";
                };
                class Unit4 {
                    position[] = {-10,-10,0};
                    rank = "PRIVATE";
                    side = 2;
                    vehicle = "I_ITBDrogen_Drogenheandler_04";
                };
            };

            class i_itbdrogen_infantry_bosstrupp2 {
                name = "BossTrupp2";
                side = 2;
                faction = "I_TB_Drogen";
                icon = "\A3\ui_f\data\map\markers\nato\n_inf.paa";
                rarityGroup = 0.5;

                class Unit0 {
                    position[] = {0,0,0};
                    rank = "SERGEANT";
                    side = 2;
                    vehicle = "I_ITBDrogen_Drogenheandler_01";
                };
                class Unit1 {
                    position[] = {5,-5,0};
                    rank = "PRIVATE";
                    side = 2;
                    vehicle = "I_ITBDrogen_Drogenheandler_02";
                };
                class Unit2 {
                    position[] = {-5,-5,0};
                    rank = "PRIVATE";
                    side = 2;
                    vehicle = "I_ITBDrogen_Drogenheandler_03";
                };
                class Unit3 {
                    position[] = {10,-10,0};
                    rank = "PRIVATE";
                    side = 2;
                    vehicle = "I_ITBDrogen_Drogenheandler_04";
                };
                class Unit4 {
                    position[] = {-10,-10,0};
                    rank = "PRIVATE";
                    side = 2;
                    vehicle = "I_ITBDrogen_Drogenboss_02";
                };
            };

        };

        class SpecOps {
            name = "Special Forces";

        };

        class Motorized {
            name = "Motorized Infantry";

        };

        class Motorized_MTP {
            name = "Motorized Infantry (MTP)";

        };

        class Support {
            name = "Support Infantry";

        };

        class Mechanized {
            name = "Mechanized Infantry";

        };

        class Armored {
            name = "Armor";

        };

        class Artillery {
            name = "Artillery";

        };

        class Naval {
            name = "Naval";

        };

        class Air {
            name = "Air";

        };


    };

};