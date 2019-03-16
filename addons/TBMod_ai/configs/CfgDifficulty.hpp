/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgAILevelPresets
{
    class Custom
    {
        displayName = "TacticalBaconAI";
        skillAI = 0.6;
        precisionAI = 0.5;
    };
};

class CfgDifficultyPresets
{
    defaultPreset = "Custom";

    class Custom
    {
        description = "TacticalBaconAI";
        levelAI = "Custom";

        class Options
        {
            autoReport = 0;
            cameraShake = 1;
            commands = 0;
            deathMessages = 0;
            detectedMines = 0;
            enemyTags = 0;
            friendlyTags = 0;
            groupIndicators = 0;
            mapContent = 0;
            multipleSaves = 0;
            reducedDamage = 0;
            scoreTable = 0;
            staminaBar = 0;
            stanceIndicator = 0;
            thirdPersonView = 0;
            visionAid = 0;
            vonID = 0;
            squadRadar = 0;
            waypoints = 0;
            weaponCrosshair = 0;
            weaponInfo = 1;
            roughLanding = 1;
        };
    };
};
