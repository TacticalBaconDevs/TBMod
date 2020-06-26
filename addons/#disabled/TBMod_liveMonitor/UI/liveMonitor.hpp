/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author: Chris 'Taranis'
*/
class TB_liveMonitor_gui
{
    idd = -1;
    duration = 10e10;
    movingEnable = 0;
    fadein = 0;
    fadeout = 0;
    name = "TB_liveMonitor_gui";
    onLoad = "uiNamespace setVariable ['TB_liveMonitor_display', _this select 0]; call TB_liveMonitor_fnc_loop";

    class controlsBackground {};

    class controls
    {
        class group_liveMonitorMaster: TB_RscControlsGroup
        {
            idc = 9099;

            x = safezoneW + safezoneX - 0.565;
            y = safezoneH + safezoneY + 0.1; //all - 0.65
            w = 0.5525;
            h = 0.635;

            class Controls
            {
                class picBackground : TB_RscPicture
                {
                    idc = -1;

                    text = "\TBMod_liveMonitor\pictures\liveMonitorBackground.paa";

                    x = 0;
                    y = 0;
                    w = 0.5525;
                    h = 0.635;
                };

                class group_liveMonitorDisplay: TB_RscControlsGroup
                {
                    idc = 9100;

                    x = 0.05;
                    y = 0.06;
                    w = 0.45;
                    h = 0.52;

                    class Controls
                    {
                        class picBlackBackground : TB_RscPicture
                        {
                            idc = -1;

                            text = "#(argb,8,8,3)color(0,0,0,1)";

                            x = 0;
                            y = 0;
                            w = 0.45;
                            h = 0.51;
                        };

                        class pic_Heartline: TB_RscPicture
                        {
                            idc = -1;

                            text = "\TBMod_liveMonitor\pictures\heartline.paa";

                            x = 0.2125;
                            y = 0.04;
                            w = 0.2125;
                            h = 0.3;
                        };

                        class text_Heartrate: TB_RscStructuredText
                        {
                            idc = 9101;

                            text = "0";

                            font = "PuristaSemiBold";
                            size = 0.20;

                            x = 0.025;
                            y = 0.02;
                            w = 0.175;
                            h = 0.2;

                            class Attributes
                            {
                                align = "center";
                                valign = "middle";
                            };
                        };
                        class text_Bloodpressure: TB_RscStructuredText
                        {
                            idc = 9102;

                            text = "000/000";

                            font = "PuristaSemiBold";
                            size = 0.08;

                            x = 0.025;
                            y = 0.19;
                            w = 0.175;
                            h = 0.08;

                            class Attributes
                            {
                                align = "center";
                                valign = "middle";
                            };
                        };
                        class text_bloodlost: TB_RscStructuredText
                        {
                            idc = 9103;

                            text = "keine Info";

                            font = "PuristaSemiBold";
                            size = 0.04;

                            x = 0.025;
                            y = 0.27;
                            w = 0.175;
                            h = 0.08;

                            colorText[] = {1,0.22,0.22,1};

                            class Attributes
                            {
                                align = "center";
                                valign = "middle";
                            };
                        };
                        class group_Heartbeat: TB_RscControlsGroup
                        {
                            idc = 9110;
                            x = 0.2125;
                            y = 0.04;
                            w = 0.2125;
                            h = 0.3;

                            class VScrollBar : TB_RscScrollBar
                            {
                                width = 0;
                            };

                            class HScrollBar : TB_RscScrollBar
                            {
                                height = 0;
                            };

                            class Controls
                            {
                                class pic_Heartbeat_1 : TB_RscPicture
                                {
                                    idc = 9111;

                                    text = "\TBMod_liveMonitor\pictures\heartbeat.paa";

                                    x = 0.2125;
                                    y = 0;
                                    w = 0.0425;
                                    h = 0.3;
                                };
                                class pic_Heartbeat_2 : pic_Heartbeat_1
                                {
                                    idc = 9112;
                                };
                                class pic_Heartbeat_3 : pic_Heartbeat_1
                                {
                                    idc = 9113;
                                };
                                class pic_Heartbeat_4 : pic_Heartbeat_1
                                {
                                    idc = 9114;
                                };
                            };
                        };

                        class picCloseBackWhite: TB_RscPicture
                        {
                            idc = -1;
                            text = "#(argb,8,8,3)color(1,1,1,1)";
                            x = 0.0225;
                            y = 0.3575;
                            w = 0.1925;
                            h = 0.125;
                        };
                        class picCloseBackBlack: TB_RscPicture
                        {
                            idc = -1;
                            text = "#(argb,8,8,3)color(0,0,0,1)";
                            x = 0.025;
                            y = 0.36;
                            w = 0.1875;
                            h = 0.12;
                        };

                        class picCheckBackWhite: TB_RscPicture
                        {
                            idc = -1;
                            text = "#(argb,8,8,3)color(1,1,1,1)";
                            x = 0.235;
                            y = 0.3575;
                            w = 0.1925;
                            h = 0.125;
                        };
                        class picCheckBackBlack: TB_RscPicture
                        {
                            idc = -1;
                            text = "#(argb,8,8,3)color(0,0,0,1)";
                            x = 0.2375;
                            y = 0.36;
                            w = 0.1875;
                            h = 0.12;
                        };

                        class picClose: TB_RscPicture
                        {
                            idc = -1;
                            text = "\TBMod_liveMonitor\pictures\Arrow_Down.paa";
                            x = 0.025;
                            y = 0.36;
                            w = 0.075;
                            h = 0.12;
                        };
                        class txtClose: TB_RscStructuredText
                        {
                            idc = -1;
                            text = "Close";
                            x = 0.0825;
                            y = 0.375;
                            w = 0.14;
                            h = 0.11;

                            font = "PuristaSemiBold";
                            size = 0.08;

                            class Attributes
                            {
                                align = "center";
                                valign = "middle";
                            };
                        };

                        class picCheck: TB_RscPicture
                        {
                            idc = -1;
                            text = "\TBMod_liveMonitor\pictures\Arrow_Up.paa";
                            x = 0.35;
                            y = 0.36;
                            w = 0.075;
                            h = 0.12;
                        };

                        class txtCheck: TB_RscStructuredText
                        {
                            idc = -1;
                            text = "Neuladen";
                            x = 0.2475;
                            y = 0.3625;
                            w = 0.1;
                            h = 0.04;

                            font = "PuristaSemiBold";
                            size = 0.04;

                            class Attributes
                            {
                                align = "center";
                                valign = "middle";
                            };
                        };
                        class valueCheck: TB_RscStructuredText
                        {
                            idc = 9104;
                            text = "2s";
                            x = 0.2475;
                            y = 0.385;
                            w = 0.1;
                            h = 0.08;

                            font = "PuristaSemiBold";
                            size = 0.10;

                            class Attributes
                            {
                                align = "center";
                                valign = "middle";
                            };
                        };
                        class allBlackForLoading : TB_RscPicture
                        {
                            idc = 9120;

                            text = "#(argb,8,8,3)color(0,0,0,1)";

                            x = 0;
                            y = 0;
                            w = 0.45;
                            h = 0.51;
                        };
                    };
                };

            };
        };
    };
};
