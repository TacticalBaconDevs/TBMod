class TB_zusatz_eos_normaleZone : TB_zusatz_Module {
    scope = 2;
    displayName = "EOS Zone";
    function = "TB_EOS_fnc_moduleZone";
    canSetArea = 1;
    canSetAreaHeight = 0;
    canSetAreaShape = 0;
    icon = "\A3\ui_f\data\igui\cfg\simpleTasks\types\attack_ca.paa";
    
    class AttributeValues
    {
        isRectangle = 0;
        size3[] = {300,300,-1};
    };
    
    class Attributes: AttributesBase
    {
        class hausInf: Edit
        {
            property = "TB_zusatz_eos_normaleZone_hausInf";
            displayName = "Hausgruppen";
            tooltip = "[ANZAHL der Gruppen, Größe, (Gruppenanzahl pro Spieler, (Größen Erhöhung pro Spieler))]";
            typeName = "STRING";
            defaultValue = "[0, 0]";
        };
        class patrolInf: Edit
        {
            property = "TB_zusatz_eos_normaleZone_patrolInf";
            displayName = "Patrouille";
            tooltip = "[ANZAHL der Gruppen, Größe, (Gruppenanzahl pro Spieler, (Größen Erhöhung pro Spieler))]";
            typeName = "STRING";
            defaultValue = "[0, 0]";
        };
        class lightVeh: Edit
        {
            property = "TB_zusatz_eos_normaleZone_lightVeh";
            displayName = "Leichte Fahrzeuge";
            tooltip = "[ANZAHL der Gruppen, Größe, (Gruppenanzahl pro Spieler, (Größen Erhöhung pro Spieler))]";
            typeName = "STRING";
            defaultValue = "[0, 0]";
        };
        class armorVeh: Edit
        {
            property = "TB_zusatz_eos_normaleZone_armorVeh";
            displayName = "Schwere Fahrzeuge";
            tooltip = "[ANZAHL der Gruppen, (Gruppenanzahl pro Spieler)]";
            typeName = "STRING";
            defaultValue = "[0]";
        };
        class statics: Edit
        {
            property = "TB_zusatz_eos_normaleZone_statics";
            displayName = "Statische Geschütze";
            tooltip = "[ANZAHL der Gruppen, (Gruppenanzahl pro Spieler)]";
            typeName = "STRING";
            defaultValue = "[0]";
        };
        class helis: Edit
        {
            property = "TB_zusatz_eos_normaleZone_helis";
            displayName = "Helikopter";
            tooltip = "[ANZAHL der Gruppen, Größe, (Gruppenanzahl pro Spieler, (Größen Erhöhung pro Spieler))]";
            typeName = "STRING";
            defaultValue = "[0, 0]";
        };
        class activRadius: Edit
        {
            property = "TB_zusatz_eos_normaleZone_activRadius";
            displayName = "Aktivierungsabstand";
            tooltip = "Wird zudätzlich zur Markergröße genommen zum Start der Spawns";
            typeName = "NUMBER";
            defaultValue = "500";
        };
        class side: Combo
        {
            property = "TB_zusatz_eos_normaleZone_side";
            displayName = "Seite";
            tooltip = "Seite der Zone";
            typeName = "STRING";
            class values {
                class EAST {
                    name = "ROT (EAST)";
                    value = "EAST";
                    default = 1;
                };
                class WEST {
                    name = "Blau (WEST)";
                    value = "WEST";
                };
                class INDEPENDENT {
                    name = "Grün (INDEPENDENT)";
                    value = "INDEPENDENT";
                };
                class CIVILIAN {
                    name = "Violett (CIVILIAN)";
                    value = "CIVILIAN";
                };
            };
        };
        class heightCheck: Checkbox
        {
            property = "TB_zusatz_eos_normaleZone_heightCheck";
            displayName = "Nur Soldaten lösen aus";
            tooltip = "Keine Helikopter, nur unter Spieler unter 5m lösen aus";
            typeName = "BOOL";
            defaultValue = "true";
        };
        class settings: Edit
        {
            property = "TB_zusatz_eos_normaleZone_settings";
            displayName = "Settings";
            tooltip = "[FACTION] | Factions: 11->Russland";
            typeName = "STRING";
            defaultValue = "[11]";
        };
        class sichtbar: Checkbox
        {
            property = "TB_zusatz_eos_normaleZone_sichtbar";
            displayName = "Marker sichtbar";
            tooltip = "Zeigt den EOS Marker an";
            typeName = "BOOL";
            defaultValue = "false";
        };
        class heliAbspringen: Checkbox
        {
            property = "TB_zusatz_eos_normaleZone_heliAbspringen";
            displayName = "Heli Absprung";
            tooltip = "Lässt die Einheiten nicht landen, sondern per Fallschirm abwerfen";
            typeName = "BOOL";
            defaultValue = "false";
        };
        class helicopterHeight: Edit
        {
            property = "TB_zusatz_eos_normaleZone_helicopterHeight";
            displayName = "Flughöhe der Helis";
            tooltip = "Wie hoch über dem Boden sollen die Helis fliegen!";
            typeName = "NUMBER";
            defaultValue = "500";
        };
        class angriffsRichtungHeli: Edit
        {
            property = "TB_zusatz_eos_normaleZone_angriffsRichtungHeli";
            displayName = "Angriffsrichtung Helis";
            tooltip = "Aus welcher Richtung sollen die Helis angreifen. (Angabe in 360 Grad Angabe, [RICHTUNG, RANDOM])";
            typeName = "STRING";
            defaultValue = "[0, 360]";
        };
    };
};

class TB_zusatz_eos_bastionZone : TB_zusatz_Module {
    scope = 2;
    displayName = "EOS BastionZone";
    function = "TB_EOS_fnc_moduleBastion";
    canSetArea = 1;
    canSetAreaHeight = 0;
    canSetAreaShape = 0;
    icon = "\A3\ui_f\data\igui\cfg\simpleTasks\types\defend_ca.paa";
    
    class AttributeValues
    {
        isRectangle = 0;
        size3[] = {300,300,-1};
    };
    
    class Attributes: AttributesBase
    {
        class patrolInf: Edit
        {
            property = "TB_zusatz_eos_bastionZone_patrolInf";
            displayName = "Patrouille";
            tooltip = "[ANZAHL der Gruppen, Größe, (Gruppenanzahl pro Spieler, (Größen Erhöhung pro Spieler))]";
            typeName = "STRING";
            defaultValue = "[0, 0]";
        };
        class lightVeh: Edit
        {
            property = "TB_zusatz_eos_bastionZone_lightVeh";
            displayName = "Leichte Fahrzeuge";
            tooltip = "[ANZAHL der Gruppen, Größe, (Gruppenanzahl pro Spieler, (Größen Erhöhung pro Spieler))]";
            typeName = "STRING";
            defaultValue = "[0, 0]";
        };
        class armorVeh: Edit
        {
            property = "TB_zusatz_eos_bastionZone_armorVeh";
            displayName = "Schwere Fahrzeuge";
            tooltip = "[ANZAHL der Gruppen, (Gruppenanzahl pro Spieler)]";
            typeName = "STRING";
            defaultValue = "[0]";
        };
        class helis: Edit
        {
            property = "TB_zusatz_eos_bastionZone_helis";
            displayName = "Helikopter";
            tooltip = "[ANZAHL der Gruppen, Größe, (Gruppenanzahl pro Spieler)]";
            typeName = "STRING";
            defaultValue = "[0, 0]";
        };
        class activRadius: Edit
        {
            property = "TB_zusatz_eos_bastionZone_activRadius";
            displayName = "KI-SpawnAbstand";
            tooltip = "Wird zusätzlich zur Markergröße genommen zum Erstellen der KI (Abstand=KI, +500=CAR, +600=Panzer, +1000=Air)";
            typeName = "NUMBER";
            defaultValue = "500";
        };
        class side: Combo
        {
            property = "TB_zusatz_eos_bastionZone_side";
            displayName = "Seite";
            tooltip = "Seite der Zone";
            typeName = "STRING";
            class values {
                class EAST {
                    name = "ROT (EAST)";
                    value = "EAST";
                    default = 1;
                };
                class WEST {
                    name = "Blau (WEST)";
                    value = "WEST";
                };
                class INDEPENDENT {
                    name = "Grün (INDEPENDENT)";
                    value = "INDEPENDENT";
                };
                class CIVILIAN {
                    name = "Violett (CIVILIAN)";
                    value = "CIVILIAN";
                };
            };
        };
        class heightCheck: Checkbox
        {
            property = "TB_zusatz_eos_bastionZone_heightCheck";
            displayName = "Nur Soldaten lösen aus";
            tooltip = "Keine Helikopter, nur unter Spieler unter 5m lösen aus";
            typeName = "BOOL";
            defaultValue = "true";
        };
        class settings: Edit
        {
            property = "TB_zusatz_eos_bastionZone_settings";
            displayName = "Settings";
            tooltip = "[FACTION] | Factions: 11->Russland";
            typeName = "STRING";
            defaultValue = "[11]";
        };
        class bastionSettings: Edit
        {
            property = "TB_zusatz_eos_bastionZone_bastionSettings";
            displayName = "Bastion Settings";
            tooltip = "[PAUSE bis Begin, Wellenanzahl, Zeit zwischen Wellen, Besetzen wenn zurückerobert, Hinweise anzeigen]";
            typeName = "STRING";
            defaultValue = "[30, 3, 600, true, false]";
        };
        class sichtbar: Checkbox
        {
            property = "TB_zusatz_eos_bastionZone_sichtbar";
            displayName = "Marker sichtbar";
            tooltip = "Zeigt den EOS Marker an";
            typeName = "BOOL";
            defaultValue = "false";
        };
        class heliAbspringen: Checkbox
        {
            property = "TB_zusatz_eos_normaleZone_heliAbspringen";
            displayName = "Heli Absprung";
            tooltip = "Lässt die Einheiten nicht landen, sondern per Fallschirm abwerfen";
            typeName = "BOOL";
            defaultValue = "false";
        };
        class helicopterHeight: Edit
        {
            property = "TB_zusatz_eos_normaleZone_helicopterHeight";
            displayName = "Flughöhe der Helis";
            tooltip = "Wie hoch über dem Boden sollen die Helis fliegen!";
            typeName = "NUMBER";
            defaultValue = "500";
        };
        class angriffsRichtung: Edit
        {
            property = "TB_zusatz_eos_normaleZone_angriffsRichtung";
            displayName = "Angriffsrichtung Bodentruppen";
            tooltip = "Aus welcher Richtung sollen die Bodentruppen angreifen. (Angabe in 360 Grad Angabe, [RICHTUNG, RANDOM])";
            typeName = "STRING";
            defaultValue = "[0, 360]";
        };
        class angriffsRichtungHeli: Edit
        {
            property = "TB_zusatz_eos_normaleZone_angriffsRichtungHeli";
            displayName = "Angriffsrichtung Helis";
            tooltip = "Aus welcher Richtung sollen die Helis angreifen. (Angabe in 360 Grad Angabe, [RICHTUNG, RANDOM])";
            typeName = "STRING";
            defaultValue = "[0, 360]";
        };
    };
};
