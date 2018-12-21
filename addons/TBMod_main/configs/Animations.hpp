/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
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

class CfgGesturesMale
{   
    class Default;
    class States
    {
        class tb_base : Default
        {
            disableWeapons = 0;
            enableOptics = 1;
            looped = 0;
            mask = "ace_gestures_LeftArm";
            minPlayTime = 0.2;
            preload = 1;
            showWeaponAim = 1;
            speed = 1;
            soundEnabled = 1;
            leftHandIKCurve[] = {};
        };
        class tb_radioSR : tb_base
        {
            file = "a3\anims_f_bootcamp\data\anim\sdr\cts\acts_kore_talkingoverradio_loop.rtm";
            speed = 0.1339;
            looped = 1;
        };
        class tb_radioLR : tb_base
        {
            file = "a3\anims_f_epa\data\anim\sdr\cts\custom\a_in\acts_listeningtoradioloop.rtm";
            speed = 0.1622;
            looped = 1;
        };
        class tb_radioStop : tb_base
        {
            file = "a3\anims_f\data\anim\sdr\gst\gesturenod.rtm";
            speed = 20;
            
            mask = "empty";
            
            weaponIK = 1;
            leftHandIKBeg = 0;
            leftHandIKCurve[] = {1};
            leftHandIKEnd = 1;
            rightHandIKBeg = 0;
            rightHandIKCurve[] = {1};
            rightHandIKEnd = 0;
        };
    };
};