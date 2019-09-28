/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class ACE_ZeusActions
{
    class ZeusGroups
    {
        class TBMod
        {
            displayName = "TBMod";

            class disablePath
            {
                displayName = "DisablePath: aus";
                condition = "(curatorSelected select 1) findIf {!(_x getVariable ['NOPATH', false])} != -1";
                statement = "{private _units = (units _x) select {alive _x}; \
                        doStop _units; \
                        {[_x, 'PATH'] remoteExec ['disableAI', _x]} forEach _units; \
                        _x setVariable ['NOPATH', true, true]; \
                    } forEach (curatorSelected select 1)";
            };
            class enablePath
            {
                displayName = "DisablePath: an";
                condition = "(curatorSelected select 1) findIf {_x getVariable ['NOPATH', false]} != -1";
                statement = "{private _units = (units _x) select {alive _x}; \
                        {[_x, 'PATH'] remoteExec ['enableAI', _x]} forEach _units; \
                        _x setVariable ['NOPATH', false, true]; \
                        _units doFollow (leader _x); \
                    } forEach (curatorSelected select 1)";
            };
        };

        class VCOM
        {
            displayName = "VCOM";

            #define ADD_OPTION(NAME,VAR) class off_##VAR \
                { \
                    displayName = QUOTE(NAME: aus); \
                    condition = QUOTE((curatorSelected select 1) findIf {!(_x getVariable [QUOTE(#VAR), false])} != -1); \
                    statement = QUOTE({_x setVariable [QUOTE(#VAR), true, true]} forEach (curatorSelected select 1)); \
                }; \
                class on_##VAR \
                { \
                    displayName = QUOTE(NAME: an); \
                    condition = QUOTE((curatorSelected select 1) findIf {_x getVariable [QUOTE(#VAR), false]} != -1); \
                    statement = QUOTE({_x setVariable [QUOTE(#VAR), false, true]} forEach (curatorSelected select 1)); \
                }

            ADD_OPTION(VCOM generell, Vcm_Disable);
            ADD_OPTION(Flankieren, VCM_NOFLANK);
            ADD_OPTION(Unterstützung geben, VCM_NORESCUE);
            ADD_OPTION(Unterstützung rufen, VCM_TOUGHSQUAD);
            ADD_OPTION(Formationswechsel, VCM_DisableForm);
            ADD_OPTION(Skillwechsel, VCM_Skilldisable);
        };
    };

    class ZeusUnits {};
    class ZeusWaypoints {};
    class ZeusMarkers {};
};
