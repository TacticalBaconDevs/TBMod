// Endless Loading Screen Buxfix
[] spawn {
    if (!isMultiplayer) exitWith {};
    uiSleep 5;

    for "_x" from 1 to 4 do
    {
        endLoadingScreen;
        uiSleep 3;
    };
};
