private ["_tempArray","_InfPool","_MotPool","_ACHPool","_CHPool","_uavPool","_stPool","_shipPool","_diverPool","_crewPool","_heliCrew","_ArmPool"];
_faction=(_this select 0);
_type=(_this select 1);
_tempArray=[];

// Sahrani Liberation ArmY 
    if (_faction==0) then {
    _InfPool=    ["LOP_SLA_Infantry_Officer","LOP_SLA_Infantry_SL","LOP_SLA_Infantry_TL","LOP_SLA_Infantry_Rifleman_2","LOP_SLA_Infantry_Rifleman","LOP_SLA_Infantry_Marksman","LOP_SLA_Infantry_MG_Asst",
                 "LOP_SLA_Infantry_MG","LOP_SLA_Infantry_AT","LOP_SLA_Infantry_GL","LOP_SLA_Infantry_Engineer","LOP_SLA_Infantry_Corpsman","LOP_SLA_Infantry_AT_Asst","LOP_SLA_Infantry_AA"];    
    _ArmPool=    ["LOP_SLA_T72BA","LOP_SLA_BMP2","LOP_SLA_BTR60"];
    _MotPool=    ["LOP_SLA_UAZ","LOP_SLA_UAZ_DshKM","LOP_SLA_Ural","LOP_SLA_Ural_open"];
    _ACHPool=    ["LOP_SLA_Mi8MTV3_FAB"];
    _CHPool=    ["LOP_SLA_Mi8MT_Cargo"];
    _uavPool=    [];
    _stPool=    ["LOP_SLA_Static_D30","LOP_SLA_Igla_AA_pod","LOP_SLA_Static_DSHKM","LOP_SLA_Kord_High"];
    _shipPool=    [];
    _diverPool=    [];
    _crewPool=    ["LOP_SLA_Infantry_SL","LOP_SLA_Infantry_TL","LOP_SLA_Infantry_Rifleman_2","LOP_SLA_Infantry_Rifleman"];
    _heliCrew=    ["LOP_SLA_Infantry_Pilot"];
};
////////////////////////////////////////////////////////////////////////////////////////
if (_type==0) then {
        for "_i" from 0 to 5 do{
        _unit=_InfPool select (floor(random(count _InfPool)));
        _tempArray set [count _tempArray,_unit];};
                        };
                        
if (_type==1) then {_tempArray=_diverPool};
    
                
// CREATE ARMOUR & CREW            
if (_type==2) then {
                _tempUnit=_ArmPool select (floor(random(count _ArmPool)));
                _temparray set [count _temparray,_tempUnit];
                _crew=_crewPool select (floor(random(count _crewPool)));
                _temparray set [count _temparray,_crew];
};

// CREATE ATTACK CHOPPER & CREW    
if (_type==3) then {
                _tempUnit=_ACHPool select (floor(random(count _ACHPool)));
                _temparray set [count _temparray,_tempUnit];
                _crew=_heliCrew select (floor(random(count _heliCrew)));
                _temparray set [count _temparray,_crew];
};

// CREATE TRANSPORT CHOPPER & CREW        
if (_type==4) then {
                _tempUnit=_CHPool select (floor(random(count _CHPool)));
                _temparray set [count _temparray,_tempUnit];
                _crew=_heliCrew select (floor(random(count _heliCrew)));
                _temparray set [count _temparray,_crew];
                        };
                        
// CREATE STATIC & CREW                        
if (_type==5) then {
                _tempUnit=_stPool select (floor(random(count _stPool)));
                _temparray set [count _temparray,_tempUnit];
                _crew=_crewPool select (floor(random(count _crewPool)));
                _temparray set [count _temparray,_crew];

};
if (_type==6) then {_tempArray=_uavPool select (floor(random(count _uavPool)));};

// CREATE TRANSPORT & CREW
if (_type==7) then {
                _tempUnit=_MotPool select (floor(random(count _MotPool)));
                _temparray set [count _temparray,_tempUnit];
                _crew=_crewPool select (floor(random(count _crewPool)));
                _temparray set [count _temparray,_crew];
                };
/*
// CREATE BOAT & DIVER CREW
if (_type==8) then {
                _tempUnit=_shipPool select (floor(random(count _shipPool)));
                _temparray set [count _temparray,_tempUnit];
                _crew=_diverPool select (floor(random(count _diverPool)));
                _temparray set [count _temparray,_crew];
                };
*/                
// CREATE CARGO
if (_type==9) then {
        for "_i" from 0 to 4 do{
            _unit=_InfPool select (floor(random(count _InfPool)));
            _temparray set [count _temparray,_unit];
                            };
};
/*
// CREATE DIVER CARGO
if (_type==10) then {
        for "_i" from 0 to 4 do{
            _unit=_diverPool select (floor(random(count _diverPool)));
            _temparray set [count _temparray,_unit];
                            };            
};
*/
//hint format ["%1",_tempArray];
_tempArray