// TBModExtension_x64.dll und TBModExtension_Inheritance.dll neben Arma3.exe packen (ACHTUNG DANACH WIEDER L�SCHEN, sonst wird nicht mehr aus TBMOd genutzt)
// Wenn Vanilla Daten erfasst werden sollen ist der TBMod und die ExtensionCallback nicht da also Funktion selber reinladen:
"TBModExtensionHost" callExtension "-";
[configFile >> "CfgVehicles", true] call TBExt_addConfig;
[configFile >> "CfgWeapons"] call TBExt_addConfig;
[configFile >> "CfgMagazines"] call TBExt_addConfig;
[configFile >> "CfgAmmo"] call TBExt_addConfig;

Dann die "inheritance.data" aus dem Arma3.exe Ordner kopieren und umbennen: inheritance_INFOS.data zB "inheritance_Vanilla+RHS-0.5.2.data"

Dann unseren TBMod starten und neben die Arma3.exe die "inheritance_INFOS.data" kopieren mit der man testen will und zu "inheritance.data" umbennenen

Im Spiel dann TBExt_checkConfig nutzen
[configFile >> "CfgVehicles"] call TBExt_checkConfig;
[configFile >> "CfgWeapons"] call TBExt_checkConfig;
[configFile >> "CfgMagazines"] call TBExt_checkConfig;
[configFile >> "CfgAmmo"] call TBExt_checkConfig;
