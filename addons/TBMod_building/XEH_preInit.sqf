#include "script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call EFUNC(main,isTBMission)) exitWith {};

{
    [
        _x,
        "init",
        {(_this select 0) setVariable ["ace_medical_isMedicalFacility", true, true]},
        true,
        [],
        true
    ] call CBA_fnc_addClassEventHandler;
}
forEach [
    "Land_MedicalTent_01_base_F",
    "Land_MedicalTent_01_floor_base_F",
    "Land_Medevac_house_V1_F",
    "Land_Medevac_HQ_V1_F"
];
