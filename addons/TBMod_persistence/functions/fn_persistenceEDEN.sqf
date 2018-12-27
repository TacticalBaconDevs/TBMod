/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
*/
params [
        ["_number", 0, [0]]
    ];

private _loadArray = profileNamespace getVariable [format ["TB_persistence_%1", _number], [[], [], [], []]]; 
{ 
 if (!((_x get3DENAttribute "ControlMP" select 0) || (_x get3DENAttribute "ControlSP" select 0))) then { 
  delete3DENEntities [_x] 
 } 
} 
foreach (all3DENEntities select 0); 
 
{ 
    _x params ["_classname", "_pos", "_dir", "_up","_sim", "_nameignored"]; 
 
    private _obj = create3DENEntity ["Object", _classname, ASLToATL _pos]; 
         
    //_obj setVectorDirAndUp [_dir, _up]; Rotation is not working I have no idea what the calculation to xyz rotation is
 
    _obj set3DENAttribute ["enableSimulation",false ]; 
} 
forEach (_loadArray select 2); 
 
private _lookup = [["hitengine","Enh_damageEngine"],["hitgun","Enh_damageGun"],["hitfuel","Enh_damageFuelTank"],["hitturret","Enh_damageTurret"],["hithull","Enh_hull"],["hitrglass","Enh_damageWindows"],["hitglass1","Enh_damageWindows1"],["hitglass2","Enh_damageWindows2"],["hitglass3","Enh_damageWindows3"],["hitglass4","Enh_damageWindows4"],["hitglass5","Enh_damageWindows5"],["hitglass6","Enh_damageWindows6"],["hitlfwheel","Enh_damageLFWheel"],["hitrfwheel","Enh_damageRFWheel"],["hitlf2wheel","Enh_damageLF2Wheel"],["hitrf2wheel","Enh_damageRF2Wheel"],["hitlmwheel","Enh_damageLMWheel"],["hitrmwheel","Enh_damageRMWheel"],["hitlbwheel","Enh_damageLBWheel"],["hitrbwheel","Enh_damageRBWheel"],["hitbody","Enh_damageVehBody"],["hitltrack","Enh_damageLTrack"],["hitrtrack","Enh_damageRTrack"],["hitavionics","Enh_damageAvionics"],["hitrrotor","Enh_damageMainRotor"],["hitvrotor","Enh_damageTailRotor"],["hitengine2","Enh_engine2"],["hitfuel2","Enh_fuel2"],["hitlaileron","Enh_hitlaileron"],["hitraileron","Enh_hitraileron"],["hitlcrudder","Enh_hitlcrudder"],["hitrrudder","Enh_hitrrudder"],["hitlcelevator","Enh_hitlcelevator"],["hitrelevator","Enh_hitrelevator"],["#gear_f_lights","Enh_gear_f_lights"]]; 
{ 
    _x params ["_class", "_pos", "_dir", "_up", "_sim", "_vanillaCargoignored", "_aceCargoignored", "_dmg", "_ammoignored", "_fuel", "_crew", "_nameignored"]; 
     
    private _vehicle = create3DENEntity ["Object", _class, ASLToATL _pos, (_crew select 1) isEqualTo []]; 
             
         
    //_vehicle setVectorDirAndUp [_dir, _up]; Rotation is not working I have no idea what the calculation to xyz rotation is
         
    if !(_dmg isEqualTo []) then { 
        { 
            private _part = _x; 
            private _result = (_lookup select {(tolower (_x # 0)) isEqualTo  (tolower _part)}); 
               if(!(_result isEqualTo [])) then { 
                _vehicle set3DENAttribute [_result # 0 # 1, (_dmg select 1) select _forEachIndex]; 
               };     
        }forEach (_dmg select 0); 
    }; 
 
    _vehicle set3DENAttribute ["fuel", _fuel]; 
 _vehicle set3DENAttribute ["enableSimulation", _sim]; 
} forEach (_loadArray select 3); 
 
 
{ 
 _x params ["_marker", "_pos", "_color", "_size", "_type", "_alpha", "_brush", "_dir", "_shape", "_text"]; 
     
    private _newMarker = create3DENEntity ["Marker", _type, ASLToATL _pos]; 
     _newMarker set3DENAttribute ["baseColor", _color]; 
        _newMarker set3DENAttribute ["size2", _size]; 
        _newMarker set3DENAttribute ["markerType", _shape]; 
        _newMarker set3DENAttribute ["alpha", _alpha]; 
        _newMarker set3DENAttribute ["brush", _brush]; 
        _newMarker set3DENAttribute ["rotation", _dir]; 
        _newMarker set3DENAttribute ["text", _text]; 
} forEach (_loadArray select 1); 
 
