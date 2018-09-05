/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author:
        bangabob (https://forums.bohemia.net/forums/topic/144150-enemy-occupation-system-eos/)
  
    Complete rewrite and modification:
        shukari

    Info:
    Überschreibt den unitPool aus der Mod mit der eigenen
    Wenn UnitPool aus der Mod verwendet werden will, dann diese Datei löschen oder umbennen.
    Case 0 ist hier derzeit nur exemplarisch ausgefüllt.
    
    Der TBMod unitPool hat derzeit folgene Faction:
    - keine
*/
private ["_InfPool","_ArmPool","_MotPool","_ACHPool","_CHPool","_stPool","_shipPool","_diverPool","_crewPool","_heliCrew"];

params ["_faction", "_type"];
private _tempArray = [];

switch (_faction) do
{
    case 0:
    {
        _InfPool = ["O_soldier_PG_F","O_officer_F","O_support_MG_F"];
        _ArmPool = ["O_MBT_04_cannon_F"];
        _MotPool = ["O_Truck_02_transport_F"];
        _ACHPool = ["O_Heli_Light_02_dynamicLoadout_F"];
        _CHPool = ["O_Heli_Light_02_unarmed_F"];
        _stPool = ["O_SAM_System_04_F","O_GMG_01_high_F"];
        _shipPool = ["O_Boat_Transport_01_F","O_Boat_Armed_01_hmg_F"];
        _diverPool = ["O_diver_F","O_diver_TL_F","O_diver_exp_F"];
        _crewPool = ["O_crew_F"];
        _heliCrew = ["O_helicrew_F","O_helipilot_F"];
    };
    
    case 1:
    {
        _InfPool = [];
        _ArmPool = [];
        _MotPool = [];
        _ACHPool = [];
        _CHPool = [];
        _stPool = [];
        _shipPool = [];
        _diverPool = [];
        _crewPool = [];
        _heliCrew = [];
    };
    
    case 2:
    {
        _InfPool = [];
        _ArmPool = [];
        _MotPool = [];
        _ACHPool = [];
        _CHPool = [];
        _stPool = [];
        _shipPool = [];
        _diverPool = [];
        _crewPool = [];
        _heliCrew = [];
    };
    
    case 3:
    {
        _InfPool = [];
        _ArmPool = [];
        _MotPool = [];
        _ACHPool = [];
        _CHPool = [];
        _stPool = [];
        _shipPool = [];
        _diverPool = [];
        _crewPool = [];
        _heliCrew = [];
    };
    
    case 4:
    {
        _InfPool = [];
        _ArmPool = [];
        _MotPool = [];
        _ACHPool = [];
        _CHPool = [];
        _stPool = [];
        _shipPool = [];
        _diverPool = [];
        _crewPool = [];
        _heliCrew = [];
    };
    
    case 5:
    {
        _InfPool = [];
        _ArmPool = [];
        _MotPool = [];
        _ACHPool = [];
        _CHPool = [];
        _stPool = [];
        _shipPool = [];
        _diverPool = [];
        _crewPool = [];
        _heliCrew = [];
    };
    
    case 6:
    {
        _InfPool = [];
        _ArmPool = [];
        _MotPool = [];
        _ACHPool = [];
        _CHPool = [];
        _stPool = [];
        _shipPool = [];
        _diverPool = [];
        _crewPool = [];
        _heliCrew = [];
    };
    
    case 7:
    {
        _InfPool = [];
        _ArmPool = [];
        _MotPool = [];
        _ACHPool = [];
        _CHPool = [];
        _stPool = [];
        _shipPool = [];
        _diverPool = [];
        _crewPool = [];
        _heliCrew = [];
    };
    
    case 8:
    {
        _InfPool = [];
        _ArmPool = [];
        _MotPool = [];
        _ACHPool = [];
        _CHPool = [];
        _stPool = [];
        _shipPool = [];
        _diverPool = [];
        _crewPool = [];
        _heliCrew = [];
    };
    
    case 9:
    {
        _InfPool = [];
        _ArmPool = [];
        _MotPool = [];
        _ACHPool = [];
        _CHPool = [];
        _stPool = [];
        _shipPool = [];
        _diverPool = [];
        _crewPool = [];
        _heliCrew = [];
    };
    
    case 10:
    {
        _InfPool = [];
        _ArmPool = [];
        _MotPool = [];
        _ACHPool = [];
        _CHPool = [];
        _stPool = [];
        _shipPool = [];
        _diverPool = [];
        _crewPool = [];
        _heliCrew = [];
    };
    
    // default {};
};

////////////////////////////////////////////////////////////////////////////////////////

switch (_type) do
{
    case 0:
    {
        for "_i" from 0 to 5 do {_tempArray pushBack (selectRandom _InfPool)};
    };
    
    case 1:
    {
        _tempArray = _diverPool;
    };
    
    // CREATE ARMOUR & CREW
    case 2:
    {
        _tempArray pushBack (selectRandom _ArmPool);
        _tempArray pushBack (selectRandom _crewPool);
    };
    
    // CREATE ATTACK CHOPPER & CREW
    case 3:
    {
        _tempArray pushBack (selectRandom _ACHPool);
        _tempArray pushBack (selectRandom _heliCrew);
    };
    
    // CREATE TRANSPORT CHOPPER & CREW 
    case 4:
    {
        _tempArray pushBack (selectRandom _CHPool);
        _tempArray pushBack (selectRandom _heliCrew);
    };
    
    // CREATE STATIC & CREW
    case 5:
    {
        _tempArray pushBack (selectRandom _stPool);
        _tempArray pushBack (selectRandom _crewPool);
    };
    
    // CREATE TRANSPORT & CREW
    case 7:
    {
        _tempArray pushBack (selectRandom _MotPool);
        _tempArray pushBack (selectRandom _crewPool);
    };
    
    // CREATE BOAT & DIVER CREW
    case 8:
    {
        _tempArray pushBack (selectRandom _shipPool);
        _tempArray pushBack (selectRandom _diverPool);
    };
    
    // CREATE CARGO
    case 9:
    {
        for "_i" from 0 to 4 do {_tempArray pushBack (selectRandom _InfPool)};
    };
    
    // CREATE DIVER CARGO
    case 10:
    {
        for "_i" from 0 to 4 do {_tempArray pushBack (selectRandom _diverPool)}; 
    };
    
    // default {};
};

_tempArray
