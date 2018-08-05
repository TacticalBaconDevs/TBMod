PBO BAUEN
1. Wenn der TBMod in eurem Arma3 Mod Ordner bereits vorhanden ist, einfach diesen duplizieren
    und in TBMod_dev umbennenen
2. dann den Pfad vom /TBMod/addons Ordner kopieren
3. nun die Datein aus dem #buildTools im git in den übergeordeten Ordner ziehen (Hauptordner)
4. die Datein "pbo_alle.bat" und "pbo_einzeln.bat" mit Notepad++ öffnen
5. jeweils in den beiden Datein den "SET armaFolder" mit dem kopierten aus Punkt zwei ersetzen


BATCHES
pbo_einzeln
- jede PBO wird einzeln erstellt, dadurch sieht man Fehler sehr gut
- nach jedem erstellen muss einmal kurz eine Taste gedrückt werden

pbo_alle
- alle PBOs werden erstellt, wenn ein Fehler auftritt, sieht man das nur daran das die PBO im "armaFolder" fehlt
- nur machen wenn nur Skripte verändert wurden, da die hpp und cpp checks nicht angezeigt werden


HOWTO TEST
1. in Arma3Sync einfach eine neue Gruppe machen mit allen gewünschten Mods und statt dem TBMod den TBMod_dev reinpacken
2. beachte, Arma3 muss geschlossen werden um neue PBOs zu bauen
