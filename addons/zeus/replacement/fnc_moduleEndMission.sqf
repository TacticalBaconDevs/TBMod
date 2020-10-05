#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Original by: Bohemia
    Edited by http://tacticalbacon.de
    FNC: BIS_fnc_moduleEndMission
*/

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated) then {
    if (_logic call bis_fnc_isCuratorEditable) then {
        waituntil {!isnil {_logic getvariable "updated"} || isnull _logic};
    };
    if (isnull _logic) exitwith {};

    
    //Add call to savestart here (maybe with setting option)
    if (isNil QEGVAR(main,safeInfo) && GVAR(enableSafestartOnEndmission)) then {
        [true] remoteExec [QEFUNC(main,safe)];
    };
    
    //--- Use custom type
    _typeCustom = _logic getvariable ["TypeCustom",""];
    _win = _logic getvariable ["Win",true];
    if ({isclass (_x >> "CfgDebriefing" >> _typeCustom)} count [configfile,campaignconfigfile,missionconfigfile] > 0) exitwith {
        [[_typeCustom,_win],"bis_fnc_endMission"] call bis_fnc_mp;
    };

    _debriefing = missionnamespace getvariable [typeof _logic + "RscAttributeEndMission_debriefing",""];
    RscDisplayDebriefing_params = _debriefing;
    publicvariable "RscDisplayDebriefing_params";

    _type = _logic getvariable ["Type",""];
    _type call bis_fnc_endMissionServer;

    RscDisplayDebriefing_params = _debriefing;
    publicvariable "RscDisplayDebriefing_params";

    if (count objectcurators _logic > 0) then {deletevehicle _logic};
};