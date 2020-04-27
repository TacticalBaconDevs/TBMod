/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgMovesBasic
{
    class ManActions
    {
        tb_radioLR = "tb_radioLR";
        tb_radioSR = "tb_radioSR";
        tb_radioStop = "tb_radioStop";
    };

    class Actions
    {
        class NoActions: ManActions
        {
            tb_radioLR[] = {"tb_radioLR", "Gesture"};
            tb_radioSR[] = {"tb_radioSR", "Gesture"};
            tb_radioStop[] = {"tb_radioStop", "Gesture"};
        };
    };
};
