///////////////////////////////////////////////////////////////////////////
/// Base Classes Wrapped to Altis Life
///////////////////////////////////////////////////////////////////////////
class RscText : TB_RscText
{
    
};
class RscStructuredText : TB_RscStructuredText
{
    
};
class RscPicture : TB_RscPicture
{
    
};
class RscEdit : TB_RscEdit
{
    
};
class RscCombo : TB_RscCombo
{
    
};
class RscListBox : TB_RscListBox
{
    
};
class RscButton : TB_RscButton
{
    
};
class RscShortcutButton : TB_RscShortcutButton
{
    
};
class RscShortcutButtonMain : TB_RscShortcutButtonMain
{
    
};
class RscFrame : TB_RscFrame
{
    
};
class RscSlider : TB_RscSlider
{
    
};
class IGUIBack : TB_RscText
{
    colorBackground[] = {0, 0, 0, 0.7};
};
class RscCheckBox : TB_RscCheckBox
{
    
};

class RscButtonMenu : TB_RscButtonMenu
{
    
};
class RscButtonMenuOK : TB_RscButtonMenu
{
    idc = 1;
    shortcuts[] = 
    {
        "0x00050000 + 0",
        28,
        57,
        156
    };
    default = 1;
    text = "OK";
    soundPush[] = 
    {
        "\A3\ui_f\data\sound\RscButtonMenuOK\soundPush",
        0.09,
        1
    };
};
class RscButtonMenuCancel : TB_RscButtonMenu
{
    idc = 2;
    shortcuts[] = 
    {
        "0x00050000 + 1"
    };
    text = "Abbrechen";
};
class RscControlsGroup : TB_RscControlsGroup
{
    
};
