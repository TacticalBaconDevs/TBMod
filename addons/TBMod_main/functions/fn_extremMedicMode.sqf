/*
    Author: shukari
*/
params [["_input", false, [false]]];

if (!TB_addArztRolle && _input) then {TB_addArztRolle = true};
if (!TB_addArztRolle) exitWith {};

ace_medical_enableOverdosing = true;
ace_medical_bleedingCoefficient = 0.6;
ace_medical_painCoefficient = 0.5;
ace_medical_consumeItem_PAK = 0;
ace_medical_medicSetting_PAK = 2;
ace_medical_useLocation_PAK = 3;
ace_medical_maxReviveTime = 1800;

systemChat "[Einstellungen] Extremes Sanitätssystem aktiviert!";