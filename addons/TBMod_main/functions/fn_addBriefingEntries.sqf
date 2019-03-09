/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de

    Original by: Schwaggot ( https://github.com/Schwaggot )
        from: https://github.com/Schwaggot/kellerkompanie-mods/blob/master/addons/common/functions/fnc_addBriefingEntries.sqf
*/
player createDiarySubject ["missionSettings", "Missioneinstellungen"];

private _txt = "
<br/>Medical:<br/>
- max Wiederbelebungszeit: %1min<br/>
- KI-Leben: %1<br/>
- Spieler-Leben: %3<br/>
- Überdosis: %4<br/>
- direkter Tod verhindert: %5<br/>
- Schmerzauswirkung: %6<br/>
- Verblutungsauswirkung: %7<br/>
- Verbrauch PAK: %8<br/>
- Verbrauch OP-Kit: %9<br/>
- Ort PAK: %10<br/>
- Ort OP-Kit: %11<br/>";
player createDiaryRecord ["missionSettings", ["Medical", format [_txt,
    ace_medical_maxReviveTime / 60,
    ace_medical_AIDamageThreshold * 100,
    ace_medical_playerDamageThreshold * 100,
    ["aus", "an"] select ace_medical_enableOverdosing,
    ["aus", "an"] select ace_medical_preventInstaDeath,
    ace_medical_painCoefficient * 100,
    ace_medical_bleedingCoefficient * 100,
    ["aus", "an"] select ace_medical_consumeItem_PAK,
    ["aus", "an"] select ace_medical_consumeItem_SurgicalKit,
    localize (['STR_ACE_Medical_AdvancedMedicalSettings_anywhere', 'STR_ACE_Medical_AdvancedMedicalSettings_vehicle', 'STR_ACE_Medical_AdvancedMedicalSettings_facility', 'STR_ACE_Medical_AdvancedMedicalSettings_vehicleAndFacility', 'STR_ACE_Common_Disabled'] select ace_medical_useLocation_PAK),
    localize (['STR_ACE_Medical_AdvancedMedicalSettings_anywhere', 'STR_ACE_Medical_AdvancedMedicalSettings_vehicle', 'STR_ACE_Medical_AdvancedMedicalSettings_facility', 'STR_ACE_Medical_AdvancedMedicalSettings_vehicleAndFacility', 'STR_ACE_Common_Disabled'] select ace_medical_useLocation_SurgicalKit)
]]];
