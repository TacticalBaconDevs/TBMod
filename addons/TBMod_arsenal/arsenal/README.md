# Infos zu den Arsenalen
## Aufbau Items
Die Items sind sortiert nach den Kategorien des ACE Arsenals.
Also die Items in einem Array per Kommentar getrennt in diese Kategorien packen.
#### NICHT
```
// Gewehr
"rhs_weap_t5000",

// Zubehör1
"rhs_acc_harris_swivel",

// Guckdingsdabumse
"rhs_acc_dh520x56",

// Sachen für den Kopf
"rhs_fieldcap_khk",
```

#### sondern
```
// Gewehr
"rhs_weap_t5000",
// ### Zweibein
"rhs_acc_harris_swivel",
// ### Visier 
"rhs_acc_dh520x56",
// ### Kopfbedeckung
"rhs_fieldcap_khk",
```

## Aufbau Mengen
Die Arsenale sollen alle per Mengen aufgebaut werden. Also alle Gemeinsamheiten aus den Rollen
in gemeinsame Mengen (Arrays) schieben. Siehe USA Arsenal.

## Defaultloadouts
Die Defaultloadouts MÜSSEN die Grundlagen enthalten, also GPS, Karten, Funks usw.
