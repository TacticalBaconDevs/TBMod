#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
ADDON = false;
PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

[
    QGVAR(enableSafestartOnEndmission),
    "CHECKBOX",
    ["enableSafestartOnEndmission", "Soll bei beenden der Mission Safestart aktiviert werden?"],
    ["TBMod", QUOTE(COMPONENT)],
    true,
    1
] call CBA_fnc_addSetting;

// Nachschubskisten automatisch aus der config lesen fürs Zeus Modul
private _naschschubConfigs = configProperties [configFile >> "CfgVehicles", "isClass _x && {(configName _x) select [0, 3] == 'TB_'}
        && {getNumber (_x >> 'scope') == 2} && {(getText (_x >> 'editorCategory')) isEqualTo 'EdCat_TB_MainCat_supply'}", false];
_naschschubConfigs = _naschschubConfigs apply {[getNumber (configFile >> 'CfgEditorSubcategories' >> getText (_x >> 'editorSubcategory') >> "order"), configName _x, _x]};
_naschschubConfigs sort false;

TB_nachschubsKisten = [];
private _lastOrderNr = -1;
{
    _x params ["_order"];

    if (_lastOrderNr != _order) then
    {
        _lastOrderNr = _order;
        TB_nachschubsKisten pushBackUnique (format ["### %1 ###",getText (configFile >> 'CfgEditorSubcategories' >> getText ((_x select 2) >> 'editorSubcategory') >> "displayName")]);
    };

    TB_nachschubsKisten pushBackUnique (_x select 1);
}
forEach _naschschubConfigs;

ADDON = true;
