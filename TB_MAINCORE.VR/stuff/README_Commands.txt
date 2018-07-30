### SafeStart
-> Starten - GLOBAL ausführen:
	[true] call TB_fnc_safe;
-> Beenden - GLOBAL ausführen:
	[false] call TB_fnc_safe;


### ZeusGruppe von der Karte verschwinden (Bluetrack)
-> Ausblenden - LOKAL ausführen:
	(group player) setVariable ["ace_map_hideBlueForceMarker", true, true];
-> (Wieder)Einblenden - LOKAL ausführen:
	(group player) setVariable ["ace_map_hideBlueForceMarker", false, true];


### GruppenID setzen
-> Person direkt anschauen und davorstehen (Name zwischen den "" ändern) - LOKAL ausführen:
	cursorTarget setGroupIdGlobal ["Alpha"];

