/* #define ADD_EVENT onLoad = "[['ace_infoDisplayChanged', [_this select 0, 'Any']]] call CBA_fnc_localEvent;"

class RscInGameUI {
    class RHS_RscUnitInfoAir {
        onLoad = "[['ace_infoDisplayChanged', [_this select 0, 'Any']]] call CBA_fnc_localEvent;";
    };
    class RHSUSF_RscUnitInfoJet {
        onLoad += "[['ace_infoDisplayChanged', [_this select 0, 'Any']]] call CBA_fnc_localEvent;";
    };
    class RHSUSF_RscUnitInfoAir {
        onLoad += "[['ace_infoDisplayChanged', [_this select 0, 'Any']]] call CBA_fnc_localEvent;";
    };
}; */

class Extended_DisplayLoad_EventHandlers {
    // A10 - unitInfoType = "RHSUSF_RscUnitInfoJet";
    tb_version = "3";
    class RscUnitInfo {
        ace_infoDisplayChanged1 = "['ace_infoDisplayChanged', [_this select 0, 'will4']] call CBA_fnc_localEvent;";
        ace_infoDisplayChanged2 = "systemChat 'will1'";
        ace_infoDisplayChanged22 = "diag_log 'ERROR POS1'";
        ace_infoDisplayChanged3 = "systemChat format ['will2: %1', !isNil 'CBA_fnc_localEvent']";
    };
    
    class RscDiary {
        ace_infoDisplayChanged1 = "['ace_infoDisplayChanged', [_this select 0, 'will3']] call CBA_fnc_localEvent;";
        ace_infoDisplayChanged2 = "systemChat 'will3'";
        ace_infoDisplayChanged22 = "diag_log 'ERROR POS3'";
        ace_infoDisplayChanged3 = "systemChat format ['will3: %1', !isNil 'CBA_fnc_localEvent']";
    };
    
    class RscOptics_CAS_Pilot {
        ace_infoDisplayChanged3 = "systemChat 'will3'";
        ace_infoDisplayChanged22 = "diag_log 'ERROR POS2'";
    };
    class RHSUSF_RscUnitInfoAir {
        ace_infoDisplayChanged = "['ace_infoDisplayChanged', [_this select 0, 'will']] call CBA_fnc_localEvent;";
    };
};