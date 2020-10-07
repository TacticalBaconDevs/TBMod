// TBModExtension_x64.dll und TBModExtension_Inheritance.dll neben Arma3.exe packen (ACHTUNG DANACH WIEDER L�SCHEN, sonst wird nicht mehr aus TBMOd genutzt)
// Wenn Vanilla Daten erfasst werden sollen ist der TBMod und die ExtensionCallback nicht da also Funktion selber reinladen:
TBExt_addConfig = {
    params ['_config'];
    'TBModExtension' callExtension '-';
    {
        ([_x, true] call BIS_fnc_returnParents) params ['_value', ['_parent', '<noParent>']];
        'TBModExtension' callExtension ['addEntry', [configName _config, _value, _parent]];
    }
    forEach ('true' configClasses _config);
    'TBModExtension' callExtension ['savefile', []];
};

[configFile >> "CfgVehicles"] call TBExt_addConfig
// zudem adden: CfgWeapons, CfgMagazines, CfgAmmo

Dann die "inheritance.data" aus dem Arma3.exe Ordner kopieren und umbennen: inheritance_INFOS.data zB "inheritance_Vanilla+RHS-0.5.2.data"

Dann unseren TBMod starten und neben die Arma3.exe die "inheritance_INFOS.data" kopieren mit der man testen will und zu "inheritance.data" umbennenen

Im Spiel dann TBExt_checkConfig nutzen
[configFile >> "CfgVehicles"] call TBExt_checkConfig
// zudem checken: CfgWeapons, CfgMagazines, CfgAmmo
