/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
// original: https://github.com/acemod/ACE3/blob/master/addons/minedetector/ACE_detector.hpp

class ACE_detector
{
    class detectors
    {
        class ACE_VMM3
        {
            radius = 10; // 2.5
            sounds[] = {"ace_detector_1", "ace_detector_2", "ace_detector_3", "ace_detector_4"};
        };

        class ACE_VMH3: ACE_VMM3 {};
    };
};
