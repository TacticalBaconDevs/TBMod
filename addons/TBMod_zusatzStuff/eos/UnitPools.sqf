private ["_tempArray","_InfPool","_MotPool","_ACHPool","_CHPool","_uavPool","_stPool","_shipPool","_diverPool","_crewPool","_heliCrew","_ArmPool"];
_faction=(_this select 0);
_type=(_this select 1);
_tempArray=[];

// Zombie Slow
    if (_faction==0) then {
    _InfPool=    ["RyanZombieC_man_1slowOpfor","RyanZombieC_man_hunter_1_FslowOpfor","RyanZombieC_journalist_FslowOpfor","RyanZombieC_OrestesslowOpfor","RyanZombieC_NikosslowOpfor","RyanZombie15slowOpfor","RyanZombie16slowOpfor",
"RyanZombie17slowOpfor","RyanZombie18slowOpfor","RyanZombie19slowOpfor","RyanZombieC_man_polo_1_FslowOpfor","RyanZombie20slowOpfor","RyanZombie21slowOpfor","RyanZombie22slowOpfor","RyanZombie23slowOpfor",
"RyanZombie24slowOpfor","RyanZombie25slowOpfor","RyanZombie26slowOpfor","RyanZombie27slowOpfor","RyanZombie28slowOpfor","RyanZombie29slowOpfor","RyanZombieC_man_polo_2_FslowOpfor","RyanZombie30slowOpfor",
"RyanZombie31slowOpfor","RyanZombie32slowOpfor","RyanZombieC_man_polo_4_FslowOpfor","RyanZombieC_man_polo_5_FslowOpfor","RyanZombieC_man_polo_6_FslowOpfor","RyanZombieC_man_p_fugitive_FslowOpfor",
"RyanZombieC_man_w_worker_FslowOpfor","RyanZombieC_scientist_FslowOpfor","RyanZombieB_Soldier_05_fslowOpfor","RyanZombieB_RangeMaster_FslowOpfor"];    
    _ArmPool=    [];
    _MotPool=    [];
    _ACHPool=    [];
    _CHPool=    [];
    _uavPool=    [];
    _stPool=    [];
    _shipPool=    [];
    _diverPool=    [];
    _crewPool=    [];
    _heliCrew=    [];
};
//  Zombie Medium
    if (_faction==1) then {
    _InfPool=    ["RyanZombieC_man_1mediumOpfor","RyanZombieC_man_hunter_1_FmediumOpfor","RyanZombieC_man_pilot_FmediumOpfor","RyanZombieC_journalist_FmediumOpfor","RyanZombieC_OrestesmediumOpfor","RyanZombieC_NikosmediumOpfor",
"RyanZombie15mediumOpfor","RyanZombie16mediumOpfor","RyanZombie17mediumOpfor","RyanZombie18mediumOpfor","RyanZombie19mediumOpfor","RyanZombieC_man_polo_1_FmediumOpfor","RyanZombie20mediumOpfor","RyanZombie21mediumOpfor",
"RyanZombie22mediumOpfor","RyanZombie23mediumOpfor","RyanZombie24mediumOpfor","RyanZombie25mediumOpfor","RyanZombie26mediumOpfor","RyanZombie27mediumOpfor","RyanZombie28mediumOpfor","RyanZombie29mediumOpfor",
"RyanZombieC_man_polo_2_FmediumOpfor","RyanZombie30mediumOpfor","RyanZombie31mediumOpfor","RyanZombie32mediumOpfor","RyanZombieC_man_polo_4_FmediumOpfor","RyanZombieC_man_polo_5_FmediumOpfor","RyanZombieC_man_polo_6_FmediumOpfor",
"RyanZombieC_man_p_fugitive_FmediumOpfor","RyanZombieC_man_w_worker_FmediumOpfor","RyanZombieC_scientist_FmediumOpfor"];    
    _ArmPool=    [];
    _MotPool=    [];
    _ACHPool=    [];
    _CHPool=    [];
    _uavPool=    [];
    _stPool=    [];
    _shipPool=    [];
    _diverPool=    [];
    _crewPool=    [];
    _heliCrew=    [];
};
//  Zombie Fast
    if (_faction==2) then {
    _InfPool=    ["RyanZombieC_man_1Opfor","RyanZombieC_man_hunter_1_FOpfor","RyanZombieC_man_pilot_FOpfor","RyanZombieC_journalist_FOpfor","RyanZombieC_OrestesOpfor","RyanZombieC_NikosOpfor","RyanZombie15Opfor","RyanZombie16Opfor",
"RyanZombie17Opfor","RyanZombie18Opfor","RyanZombie19Opfor","RyanZombieC_man_polo_1_FOpfor","RyanZombie20Opfor","RyanZombie21Opfor","RyanZombie22Opfor","RyanZombie23Opfor","RyanZombie24Opfor","RyanZombie25Opfor",
"RyanZombie26Opfor","RyanZombie27Opfor","RyanZombie29Opfor","RyanZombieC_man_polo_2_FOpfor","RyanZombie30Opfor","RyanZombie31Opfor","RyanZombieC_man_polo_4_FOpfor","RyanZombieC_man_polo_5_FOpfor","RyanZombieC_man_polo_6_FOpfor",
"RyanZombieC_man_p_fugitive_FOpfor","RyanZombieC_man_w_worker_FOpfor","RyanZombieC_scientist_FOpfor"];    
    _ArmPool=    [];
    _MotPool=    [];
    _ACHPool=    [];
    _CHPool=    [];
    _uavPool=    [];
    _stPool=    [];
    _shipPool=    [];
    _diverPool=    [];
    _crewPool=    [];
    _heliCrew=    [];
};
//  Mix 1 - Fast, Medium
    if (_faction==3) then {
    _InfPool=    ["RyanZombieC_man_1Opfor","RyanZombieC_man_hunter_1_FOpfor","RyanZombieC_man_pilot_FOpfor","RyanZombieC_journalist_FOpfor","RyanZombieC_OrestesOpfor","RyanZombieC_NikosOpfor","RyanZombie15Opfor","RyanZombie16Opfor",
"RyanZombie17Opfor","RyanZombie18Opfor","RyanZombie19Opfor","RyanZombieC_man_polo_1_FOpfor","RyanZombie20Opfor","RyanZombie21Opfor","RyanZombie22Opfor","RyanZombie23Opfor","RyanZombie24Opfor","RyanZombie25Opfor",
"RyanZombie26Opfor","RyanZombie27Opfor","RyanZombie29Opfor","RyanZombieC_man_polo_2_FOpfor","RyanZombie30Opfor","RyanZombie31Opfor","RyanZombieC_man_polo_4_FOpfor","RyanZombieC_man_polo_5_FOpfor","RyanZombieC_man_polo_6_FOpfor",
"RyanZombieC_man_p_fugitive_FOpfor","RyanZombieC_man_w_worker_FOpfor","RyanZombieC_scientist_FOpfor","RyanZombieC_man_1mediumOpfor","RyanZombieC_man_hunter_1_FmediumOpfor","RyanZombieC_man_pilot_FmediumOpfor","RyanZombieC_journalist_FmediumOpfor","RyanZombieC_OrestesmediumOpfor","RyanZombieC_NikosmediumOpfor",
"RyanZombie15mediumOpfor","RyanZombie16mediumOpfor","RyanZombie17mediumOpfor","RyanZombie18mediumOpfor","RyanZombie19mediumOpfor","RyanZombieC_man_polo_1_FmediumOpfor","RyanZombie20mediumOpfor","RyanZombie21mediumOpfor",
"RyanZombie22mediumOpfor","RyanZombie23mediumOpfor","RyanZombie24mediumOpfor","RyanZombie25mediumOpfor","RyanZombie26mediumOpfor","RyanZombie27mediumOpfor","RyanZombie28mediumOpfor","RyanZombie29mediumOpfor",
"RyanZombieC_man_polo_2_FmediumOpfor","RyanZombie30mediumOpfor","RyanZombie31mediumOpfor","RyanZombie32mediumOpfor","RyanZombieC_man_polo_4_FmediumOpfor","RyanZombieC_man_polo_5_FmediumOpfor","RyanZombieC_man_polo_6_FmediumOpfor",
"RyanZombieC_man_p_fugitive_FmediumOpfor","RyanZombieC_man_w_worker_FmediumOpfor","RyanZombieC_scientist_FmediumOpfor"];    
    _ArmPool=    [];
    _MotPool=    [];
    _ACHPool=    [];
    _CHPool=    [];
    _uavPool=    [];
    _stPool=    [];
    _shipPool=    [];
    _diverPool=    [];
    _crewPool=    [];
    _heliCrew=    [];
};
//  Zombie Crawler
    if (_faction==4) then {
    _InfPool=    ["RyanZombieCrawler1Opfor","RyanZombieCrawler10Opfor","RyanZombieCrawler11Opfor","RyanZombieCrawler12Opfor","RyanZombieCrawler13Opfor","RyanZombieCrawler14Opfor","RyanZombieCrawler15Opfor","RyanZombieCrawler16Opfor",
"RyanZombieCrawler17Opfor","RyanZombieCrawler18Opfor","RyanZombieCrawler19Opfor","RyanZombieCrawler2Opfor","RyanZombieCrawler20Opfor","RyanZombieCrawler21Opfor","RyanZombieCrawler22Opfor","RyanZombieCrawler23Opfor",
"RyanZombieCrawler24Opfor","RyanZombieCrawler25Opfor","RyanZombieCrawler26Opfor","RyanZombieCrawler27Opfor","RyanZombieCrawler28Opfor","RyanZombieCrawler29Opfor","RyanZombieCrawler3Opfor","RyanZombieCrawler30Opfor",
"RyanZombieCrawler31Opfor","RyanZombieCrawler32Opfor","RyanZombieCrawler4Opfor","RyanZombieCrawler5Opfor","RyanZombieCrawler6Opfor","RyanZombieCrawler7Opfor","RyanZombieCrawler8Opfor","RyanZombieCrawler9Opfor"];    
    _ArmPool=    [];
    _MotPool=    [];
    _ACHPool=    [];
    _CHPool=    [];
    _uavPool=    [];
    _stPool=    [];
    _shipPool=    [];
    _diverPool=    [];
    _crewPool=    [];
    _heliCrew=    [];
};
//  Zombie Walker
    if (_faction==5) then {
    _InfPool=    ["RyanZombieC_man_1walkerOpfor","RyanZombieC_man_hunter_1_FwalkerOpfor","RyanZombieC_man_pilot_FwalkerOpfor","RyanZombieC_journalist_FwalkerOpfor","RyanZombieC_OresteswalkerOpfor","RyanZombieC_NikoswalkerOpfor",
"RyanZombie15walkerOpfor","RyanZombie16walkerOpfor","RyanZombie17walkerOpfor","RyanZombie18walkerOpfor","RyanZombie19walkerOpfor","RyanZombieC_man_polo_1_FwalkerOpfor","RyanZombie20walkerOpfor","RyanZombie21walkerOpfor",
"RyanZombie22walkerOpfor","RyanZombie23walkerOpfor","RyanZombie24walkerOpfor","RyanZombie25walkerOpfor","RyanZombie26walkerOpfor","RyanZombie27walkerOpfor","RyanZombie28walkerOpfor","RyanZombie29walkerOpfor",
"RyanZombieC_man_polo_2_FwalkerOpfor","RyanZombie30walkerOpfor","RyanZombie31walkerOpfor","RyanZombie32walkerOpfor","RyanZombieC_man_polo_4_FwalkerOpfor","RyanZombieC_man_polo_5_FwalkerOpfor","RyanZombieC_man_polo_6_FwalkerOpfor",
"RyanZombieC_man_p_fugitive_FwalkerOpfor","RyanZombieC_man_w_worker_FwalkerOpfor","RyanZombieC_scientist_FwalkerOpfor"];    
    _ArmPool=    [];
    _MotPool=    [];
    _ACHPool=    [];
    _CHPool=    [];
    _uavPool=    [];
    _stPool=    [];
    _shipPool=    [];
    _diverPool=    [];
    _crewPool=    [];
    _heliCrew=    [];
};
//  Zombie Spider
    if (_faction==6) then {
    _InfPool=    ["RyanZombieSpider1Opfor","RyanZombieSpider10Opfor","RyanZombieSpider11Opfor","RyanZombieSpider12Opfor","RyanZombieSpider13Opfor","RyanZombieSpider14Opfor","RyanZombieSpider15Opfor","RyanZombieSpider16Opfor",
"RyanZombieSpider17Opfor","RyanZombieSpider18Opfor","RyanZombieSpider19Opfor","RyanZombieSpider2Opfor","RyanZombieSpider20Opfor","RyanZombieSpider21Opfor","RyanZombieSpider22Opfor","RyanZombieSpider23Opfor",
"RyanZombieSpider24Opfor","RyanZombieSpider25Opfor","RyanZombieSpider26Opfor","RyanZombieSpider27Opfor","RyanZombieSpider28Opfor","RyanZombieSpider29Opfor","RyanZombieSpider3Opfor","RyanZombieSpider30Opfor",
"RyanZombieSpider31Opfor","RyanZombieSpider32Opfor","RyanZombieSpider4Opfor","RyanZombieSpider5Opfor","RyanZombieSpider6Opfor","RyanZombieSpider7Opfor","RyanZombieSpider8Opfor","RyanZombieSpider9Opfor"];    
    _ArmPool=    [];
    _MotPool=    [];
    _ACHPool=    [];
    _CHPool=    [];
    _uavPool=    [];
    _stPool=    [];
    _shipPool=    [];
    _diverPool=    [];
    _crewPool=    [];
    _heliCrew=    [];
};
//  Zombie Demons
    if (_faction==7) then {
    _InfPool=    ["RyanZombieboss1Opfor","RyanZombieboss10Opfor","RyanZombieboss11Opfor","RyanZombieboss12Opfor","RyanZombieboss13Opfor","RyanZombieboss14Opfor","RyanZombieboss15Opfor","RyanZombieboss16Opfor",
"RyanZombieboss17Opfor","RyanZombieboss18Opfor","RyanZombieboss19Opfor","RyanZombieboss2Opfor","RyanZombieboss20Opfor","RyanZombieboss21Opfor","RyanZombieboss22Opfor","RyanZombieboss23Opfor",
"RyanZombieboss24Opfor","RyanZombieboss25Opfor","RyanZombieboss26Opfor","RyanZombieboss27Opfor","RyanZombieboss28Opfor","RyanZombieboss29Opfor","RyanZombieboss3Opfor","RyanZombieboss30Opfor",
"RyanZombieboss31Opfor","RyanZombieboss32Opfor","RyanZombieboss4Opfor","RyanZombieboss5Opfor","RyanZombieboss6Opfor","RyanZombieboss7Opfor","RyanZombieboss8Opfor","RyanZombieboss9Opfor"];    
    _ArmPool=    [];
    _MotPool=    [];
    _ACHPool=    [];
    _CHPool=    [];
    _uavPool=    [];
    _stPool=    [];
    _shipPool=    [];
    _diverPool=    [];
    _crewPool=    [];
    _heliCrew=    [];
};
//  Mix 2 - Slow, Demon
    if (_faction==8) then {
    _InfPool=    ["RyanZombieboss1Opfor","RyanZombieboss10Opfor","RyanZombieboss11Opfor","RyanZombieboss12Opfor","RyanZombieboss13Opfor","RyanZombieboss14Opfor","RyanZombieboss15Opfor",
    "RyanZombieboss16Opfor","RyanZombieboss17Opfor","RyanZombieboss18Opfor","RyanZombieboss19Opfor","RyanZombieboss2Opfor","RyanZombieboss20Opfor","RyanZombieboss21Opfor","RyanZombieboss22Opfor",
    "RyanZombieboss23Opfor","RyanZombieboss24Opfor","RyanZombieboss25Opfor","RyanZombieboss26Opfor","RyanZombieboss27Opfor","RyanZombieboss28Opfor","RyanZombieboss29Opfor","RyanZombieboss3Opfor",
    "RyanZombieboss30Opfor","RyanZombieboss31Opfor","RyanZombieboss32Opfor","RyanZombieboss4Opfor","RyanZombieboss5Opfor","RyanZombieboss6Opfor","RyanZombieboss7Opfor","RyanZombieboss8Opfor",
    "RyanZombieboss9Opfor","RyanZombieC_man_1slowOpfor","RyanZombieC_man_hunter_1_FslowOpfor","RyanZombieC_journalist_FslowOpfor","RyanZombieC_OrestesslowOpfor","RyanZombieC_NikosslowOpfor",
    "RyanZombie15slowOpfor","RyanZombie16slowOpfor","RyanZombie17slowOpfor","RyanZombie18slowOpfor","RyanZombie19slowOpfor","RyanZombieC_man_polo_1_FslowOpfor","RyanZombie20slowOpfor",
    "RyanZombie21slowOpfor","RyanZombie22slowOpfor","RyanZombie23slowOpfor","RyanZombie24slowOpfor","RyanZombie25slowOpfor","RyanZombie26slowOpfor","RyanZombie27slowOpfor","RyanZombie28slowOpfor",
    "RyanZombie29slowOpfor","RyanZombieC_man_polo_2_FslowOpfor","RyanZombie30slowOpfor","RyanZombie31slowOpfor","RyanZombie32slowOpfor","RyanZombieC_man_polo_4_FslowOpfor",
    "RyanZombieC_man_polo_5_FslowOpfor","RyanZombieC_man_polo_6_FslowOpfor","RyanZombieC_man_p_fugitive_FslowOpfor","RyanZombieC_man_w_worker_FslowOpfor","RyanZombieC_scientist_FslowOpfor",
    "RyanZombieB_Soldier_05_fslowOpfor","RyanZombieB_RangeMaster_FslowOpfor"];    
    _ArmPool=    [];
    _MotPool=    [];
    _ACHPool=    [];
    _CHPool=    [];
    _uavPool=    [];
    _stPool=    [];
    _shipPool=    [];
    _diverPool=    [];
    _crewPool=    [];
    _heliCrew=    [];
};
// Mix 3 - Walker, Medium    
    if (_faction==9) then {
    _InfPool=    ["RyanZombieC_man_1walkerOpfor","RyanZombieC_man_hunter_1_FwalkerOpfor","RyanZombieC_man_pilot_FwalkerOpfor","RyanZombieC_journalist_FwalkerOpfor","RyanZombieC_OresteswalkerOpfor","RyanZombieC_NikoswalkerOpfor",
"RyanZombie15walkerOpfor","RyanZombie16walkerOpfor","RyanZombie17walkerOpfor","RyanZombie18walkerOpfor","RyanZombie19walkerOpfor","RyanZombieC_man_polo_1_FwalkerOpfor","RyanZombie20walkerOpfor","RyanZombie21walkerOpfor",
"RyanZombie22walkerOpfor","RyanZombie23walkerOpfor","RyanZombie24walkerOpfor","RyanZombie25walkerOpfor","RyanZombie26walkerOpfor","RyanZombie27walkerOpfor","RyanZombie28walkerOpfor","RyanZombie29walkerOpfor",
"RyanZombieC_man_polo_2_FwalkerOpfor","RyanZombie30walkerOpfor","RyanZombie31walkerOpfor","RyanZombie32walkerOpfor","RyanZombieC_man_polo_4_FwalkerOpfor","RyanZombieC_man_polo_5_FwalkerOpfor","RyanZombieC_man_polo_6_FwalkerOpfor",
"RyanZombieC_man_p_fugitive_FwalkerOpfor","RyanZombieC_man_w_worker_FwalkerOpfor","RyanZombieC_scientist_FwalkerOpfor","RyanZombieC_man_1mediumOpfor","RyanZombieC_man_hunter_1_FmediumOpfor","RyanZombieC_man_pilot_FmediumOpfor","RyanZombieC_journalist_FmediumOpfor","RyanZombieC_OrestesmediumOpfor","RyanZombieC_NikosmediumOpfor",
"RyanZombie15mediumOpfor","RyanZombie16mediumOpfor","RyanZombie17mediumOpfor","RyanZombie18mediumOpfor","RyanZombie19mediumOpfor","RyanZombieC_man_polo_1_FmediumOpfor","RyanZombie20mediumOpfor","RyanZombie21mediumOpfor",
"RyanZombie22mediumOpfor","RyanZombie23mediumOpfor","RyanZombie24mediumOpfor","RyanZombie25mediumOpfor","RyanZombie26mediumOpfor","RyanZombie27mediumOpfor","RyanZombie28mediumOpfor","RyanZombie29mediumOpfor",
"RyanZombieC_man_polo_2_FmediumOpfor","RyanZombie30mediumOpfor","RyanZombie31mediumOpfor","RyanZombie32mediumOpfor","RyanZombieC_man_polo_4_FmediumOpfor","RyanZombieC_man_polo_5_FmediumOpfor","RyanZombieC_man_polo_6_FmediumOpfor",
"RyanZombieC_man_p_fugitive_FmediumOpfor","RyanZombieC_man_w_worker_FmediumOpfor","RyanZombieC_scientist_FmediumOpfor"];    
    _ArmPool=    [];
    _MotPool=    [];
    _ACHPool=    [];
    _CHPool=    [];
    _uavPool=    [];
    _stPool=    [];
    _shipPool=    [];
    _diverPool=    [];
    _crewPool=    [];
    _heliCrew=    [];
};
//  Mix 4 - Slow, Walker
    if (_faction==10) then {
    _InfPool=    ["RyanZombieC_man_1walkerOpfor","RyanZombieC_man_hunter_1_FwalkerOpfor","RyanZombieC_man_pilot_FwalkerOpfor","RyanZombieC_journalist_FwalkerOpfor","RyanZombieC_OresteswalkerOpfor","RyanZombieC_NikoswalkerOpfor",
    "RyanZombie15walkerOpfor","RyanZombie16walkerOpfor","RyanZombie17walkerOpfor","RyanZombie18walkerOpfor","RyanZombie19walkerOpfor","RyanZombieC_man_polo_1_FwalkerOpfor","RyanZombie20walkerOpfor","RyanZombie21walkerOpfor",
    "RyanZombie22walkerOpfor","RyanZombie23walkerOpfor","RyanZombie24walkerOpfor","RyanZombie25walkerOpfor","RyanZombie26walkerOpfor","RyanZombie27walkerOpfor","RyanZombie28walkerOpfor","RyanZombie29walkerOpfor",
    "RyanZombieC_man_polo_2_FwalkerOpfor","RyanZombie30walkerOpfor","RyanZombie31walkerOpfor","RyanZombie32walkerOpfor","RyanZombieC_man_polo_4_FwalkerOpfor","RyanZombieC_man_polo_5_FwalkerOpfor","RyanZombieC_man_polo_6_FwalkerOpfor",
    "RyanZombieC_man_p_fugitive_FwalkerOpfor","RyanZombieC_man_w_worker_FwalkerOpfor","RyanZombieC_scientist_FwalkerOpfor","RyanZombieC_man_1slowOpfor","RyanZombieC_man_hunter_1_FslowOpfor","RyanZombieC_journalist_FslowOpfor","RyanZombieC_OrestesslowOpfor","RyanZombieC_NikosslowOpfor",
    "RyanZombie15slowOpfor","RyanZombie16slowOpfor","RyanZombie17slowOpfor","RyanZombie18slowOpfor","RyanZombie19slowOpfor","RyanZombieC_man_polo_1_FslowOpfor","RyanZombie20slowOpfor",
    "RyanZombie21slowOpfor","RyanZombie22slowOpfor","RyanZombie23slowOpfor","RyanZombie24slowOpfor","RyanZombie25slowOpfor","RyanZombie26slowOpfor","RyanZombie27slowOpfor","RyanZombie28slowOpfor",
    "RyanZombie29slowOpfor","RyanZombieC_man_polo_2_FslowOpfor","RyanZombie30slowOpfor","RyanZombie31slowOpfor","RyanZombie32slowOpfor","RyanZombieC_man_polo_4_FslowOpfor",
    "RyanZombieC_man_polo_5_FslowOpfor","RyanZombieC_man_polo_6_FslowOpfor","RyanZombieC_man_p_fugitive_FslowOpfor","RyanZombieC_man_w_worker_FslowOpfor","RyanZombieC_scientist_FslowOpfor",
    "RyanZombieB_Soldier_05_fslowOpfor","RyanZombieB_RangeMaster_FslowOpfor"];    
    _ArmPool=    [];
    _MotPool=    [];
    _ACHPool=    [];
    _CHPool=    [];
    _uavPool=    [];
    _stPool=    [];
    _shipPool=    [];
    _diverPool=    [];
    _crewPool=    [];
    _heliCrew=    [];
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

// CREATE BOAT & DIVER CREW
if (_type==8) then {
                _tempUnit=_shipPool select (floor(random(count _shipPool)));
                _temparray set [count _temparray,_tempUnit];
                _crew=_diverPool select (floor(random(count _diverPool)));
                _temparray set [count _temparray,_crew];
                };
                
// CREATE CARGO
if (_type==9) then {
        for "_i" from 0 to 4 do{
            _unit=_InfPool select (floor(random(count _InfPool)));
            _temparray set [count _temparray,_unit];
                            };
};

// CREATE DIVER CARGO
if (_type==10) then {
        for "_i" from 0 to 4 do{
            _unit=_diverPool select (floor(random(count _diverPool)));
            _temparray set [count _temparray,_unit];
                            };            
};

//hint format ["%1",_tempArray];
_tempArray