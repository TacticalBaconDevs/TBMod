/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
class ACE_ZeusActions
{
    class ZeusUnits
    {

    };

    class ZeusGroups
    {
        class TBMod
        {
            displayName = "TBMod";

            class disablePath
            {
                displayName = "DisablePath: aus";
                condition = "(curatorSelected select 1) findIf {_x getVariable ['NOPATH', false]} != -1";
                statement = "{private _units = (units _x) select {alive _x};
                        doStop _units;
                        {[_x, 'PATH'] remoteExec ['disableAI', _x]} forEach _units;
                        _x setVariable ['NOPATH', true, true];
                    } forEach (curatorSelected select 1)";
            };
            class enablePath
            {
                displayName = "DisablePath: an";
                condition = "(curatorSelected select 1) findIf {!(_x getVariable ['NOPATH', false])} != -1";
                statement = "{private _units = (units _x) select {alive _x};
                        {[_x, 'PATH'] remoteExec ['enableAI', _x]} forEach _units;
                        _x setVariable ['NOPATH', false, true];
                        (units _x) doFollow (leader _x);
                    } forEach (curatorSelected select 1)";
            };
        };

        class VCOM
        {
            displayName = "VCOM";

            class noFlank
            {
                displayName = "Flankieren: aus";
                condition = "(curatorSelected select 1) findIf {!(_x getVariable ['VCM_NOFLANK', false])} != -1";
                statement = "{_x setVariable ['VCM_NOFLANK', true, true]} forEach (curatorSelected select 1)";
            };
            class yesFlank
            {
                displayName = "Flankieren: an";
                condition = "(curatorSelected select 1) findIf {_x getVariable ['VCM_NOFLANK', false]} != -1";
                statement = "{_x setVariable ['VCM_NOFLANK', false, true]} forEach (curatorSelected select 1)";
            };

            class noBackup
            {
                displayName = "Unterstützung geben: aus";
                condition = "(curatorSelected select 1) findIf {!(_x getVariable ['VCM_NORESCUE', false])} != -1";
                statement = "{_x setVariable ['VCM_NORESCUE', true, true]} forEach (curatorSelected select 1)";
            };
            class yesBackup
            {
                displayName = "Unterstützung geben: an";
                condition = "(curatorSelected select 1) findIf {_x getVariable ['VCM_NORESCUE', false]} != -1";
                statement = "{_x setVariable ['VCM_NORESCUE', false, true]} forEach (curatorSelected select 1)";
            };

            class noCallbackup
            {
                displayName = "Unterstützung rufen: aus";
                condition = "(curatorSelected select 1) findIf {!(_x getVariable ['VCM_TOUGHSQUAD', false])} != -1";
                statement = "{_x setVariable ['VCM_TOUGHSQUAD', true, true]} forEach (curatorSelected select 1)";
            };
            class yesCallbackup
            {
                displayName = "Unterstützung rufen: an";
                condition = "(curatorSelected select 1) findIf {_x getVariable ['VCM_TOUGHSQUAD', false]} != -1";
                statement = "{_x setVariable ['VCM_TOUGHSQUAD', false, true]} forEach (curatorSelected select 1)";
            };

            class noDisable
            {
                displayName = "VCOM generell: aus";
                condition = "(curatorSelected select 1) findIf {!(_x getVariable ['Vcm_Disable', false])} != -1";
                statement = "{_x setVariable ['Vcm_Disable', true, true]} forEach (curatorSelected select 1)";
            };
            class yesDisable
            {
                displayName = "VCOM generell: an";
                condition = "(curatorSelected select 1) findIf {_x getVariable ['Vcm_Disable', false]} != -1";
                statement = "{_x setVariable ['Vcm_Disable', false, true]} forEach (curatorSelected select 1)";
            };

            class noFormationChange
            {
                displayName = "Formationswechsel: aus";
                condition = "(curatorSelected select 1) findIf {!(_x getVariable ['VCM_DisableForm', false])} != -1";
                statement = "{_x setVariable ['VCM_DisableForm', true, true]} forEach (curatorSelected select 1)";
            };
            class yesFormationChange
            {
                displayName = "Formationswechsel: an";
                condition = "(curatorSelected select 1) findIf {_x getVariable ['VCM_DisableForm', false]} != -1";
                statement = "{_x setVariable ['VCM_DisableForm', false, true]} forEach (curatorSelected select 1)";
            };

            class noSkillChange
            {
                displayName = "Skillwechsel: aus";
                condition = "(curatorSelected select 1) findIf {!(_x getVariable ['VCM_Skilldisable', false])} != -1";
                statement = "{_x setVariable ['VCM_Skilldisable', true, true]} forEach (curatorSelected select 1)";
            };
            class yesSkillChange
            {
                displayName = "Skillwechsel: an";
                condition = "(curatorSelected select 1) findIf {_x getVariable ['VCM_Skilldisable', false]} != -1";
                statement = "{_x setVariable ['VCM_Skilldisable', false, true]} forEach (curatorSelected select 1)";
            };
        };
    };

    class ZeusWaypoints
    {

    };

    class ZeusMarkers
    {

    };
};
