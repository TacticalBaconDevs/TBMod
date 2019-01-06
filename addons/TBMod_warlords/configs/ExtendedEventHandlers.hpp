/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
#define INIT_TEXTURE(VEHICLE,SKIN) class VEHICLE \
    { \
        class TBMod_warlords \
        { \
            serverInit = "params ['_vehicle']; if (call TB_fnc_isWLMission) then {{_vehicle setObjectTextureGlobal [_forEachIndex, _x]} forEach (getArray (configfile >> 'CfgVehicles' >> (typeOf _vehicle) >> 'textureSources' >> 'SKIN' >> 'textures'))};"; \
        }; \
    }

class Extended_PreInit_EventHandlers
{
    class TBMod_warlords
    {
        clientInit = "call compile preprocessFileLineNumbers '\TBMod_warlords\XEH_preClientInit.sqf'";
        serverInit = "call compile preprocessFileLineNumbers '\TBMod_warlords\XEH_preServerInit.sqf'";
    };
};

class Extended_InitPost_Eventhandlers
{
    class AllVehicles
    {
        class TBMod_warlords
        {
            serverInit = "params ['_vehicle']; if (call TB_fnc_isWLMission) then {_vehicle setVehicleLock 'LOCKED'};";
        };
    };

    INIT_TEXTURE(rhsgref_ins_uaz_open, Camo);
    INIT_TEXTURE(rhsgref_ins_uaz_dshkm, Camo);
    INIT_TEXTURE(rhsgref_ins_uaz_ags, Camo);
    INIT_TEXTURE(rhsgref_ins_uaz_spg9, Camo);

    INIT_TEXTURE(rhs_gaz66_msv, rhs_sand);

    INIT_TEXTURE(rhsgref_BRDM2_msv, takistan);

    INIT_TEXTURE(rhs_bmp3m_msv, rhs_sand);
    INIT_TEXTURE(rhs_bmp3mera_msv, rhs_sand);

    INIT_TEXTURE(rhs_t80um, rhs_Sand);
    INIT_TEXTURE(rhs_t90a_tv, rhs_Sand);
};


