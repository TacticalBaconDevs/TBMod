/* 
TPW SOAP - SOnic Ambience Project
Author: tpw, autigergrad 
Date: 20180613
Version: 1.34
Requires: CBA A3, tpw_core.sqf, tpw_sounds.pbo
Compatibility: SP, MP client

Disclaimer: Feel free to use and modify this code, on the proviso that you post back changes and improvements so that everyone can benefit from them, and acknowledge the original author (tpw) in any derivative works.     

To use: 
1 - Save this script into your mission directory as eg tpw_soap.sqf
2 - Call it with 0 = [1,1,1,1,1,0,0,0,12,1] execvm "tpw_soap.sqf";  

1 = ambient sounds volume (0-2)
1 = music volume (0-2)
1 = Azan volume (0-2)
1 = house FX volume (0-2)
1 = scream volume (0-2)
0 = number of user music files in @TPW_MODS\music (0-20)
0 = number of user sound files in @TPW_MODS\sounds (0-20)
0 = region (0 = autoselect Greek/Fijian sounds on Greek/Fijian maps (1 = force Greek, 2 = force Mid East, 3 = force Fijian, 4 = force French, 5= force Russian))
12 = traffic volume (0= no traffic, 20 = very loud)
1 = chainsaw volume (0- 2)
THIS SCRIPT WON'T RUN ON DEDICATED SERVERS.
*/

if (isDedicated) exitWith {};
WaitUntil {!isNull FindDisplay 46};
if (count _this < 10) exitwith {player sidechat "TPW soap incorrect/no config, exiting."};

// READ IN CONFIGURATION VALUES
tpw_soap_version = "1.34"; // Version string
tpw_soap_ambientvolume = _this select 0; // Ambient sounds volume
tpw_soap_musicvolume = _this select 1; // Music volume
tpw_soap_azanvolume = _this select 2; // Azan volume
tpw_soap_housefxvolume = _this select 3; // House fx volume
tpw_soap_screamvolume = _this select 4; // Screams volume

tpw_soap_usermusic = _this select 5; // Number of user supplied songs
tpw_soap_usersounds = _this select 6; // Number of user supplied sounds
tpw_soap_region = _this select 7; // 0 = autodetect 1 = Greece, 2 = Mideast, 3 = Fiji, 4 = France, 5 = Russia, 6 = all 
tpw_soap_trafficmult = _this select 8;  // 0 = no traffic, 20 = very loud
tpw_soap_chainsawvolume = _this select 9; // Chainsaw volume

// OTHER VARS
tpw_soap_active = true; // Global enable/disabled
tpw_soap_radius = 50; // Distance around player to spawn ambience into houses
tpw_soap_attenuation = 50; // Distance over which sound fades out
tpw_soap_greeksoundlength = [60,48,87,73,61,88,87,65,72,56,72,49,69,64,85,62,76]; // Length (sec) of each ambience clip in the order of the config
tpw_soap_greeksonglength = [69,187,165,149,153,181,240,194,175]; // Length (sec) of each song in the order of the config
tpw_soap_mideastsoundlength = [52,134,80,32,28,40,81,9,15,80,64,63,59,97,101,90,66,21,52,20,30,140]; // Length (sec) of each ambience clip in the order of the config
tpw_soap_mideastsonglength = [19,180,180,180,180,180,180,276,329,133,120,180,180,180,180,180,180,180,180,180]; // Length (sec) of each song in the order of the config
tpw_soap_fijisoundlength = [60,70,50,50,20,30,25,20,15,25,15,10,35,45,45,55,30,45,50,45,60,35,25,20,25]; // Length (sec) of each ambience clip in the order of the config
tpw_soap_francesoundlength = [61,62,63,64,65,66,67,68,69,60,61,62,63,64,65,66,67,68,69,60,61,62,63,64,65,66,67,68,69];// Length (sec) of each ambience clip in the order of the config
tpw_soap_francesonglength = [180,180,180,180,180,180,180,180,180,180,180,180];// Length (sec) of each song in the order of the config
tpw_soap_fijisonglength = [220,180,40,120,120,130,150,110,80,180,180]; // Length (sec) of each song in the order of the config
tpw_soap_russiasoundlength = [61,62,63,64,65,66,67,68,69,60,61,62,63,64,65,66,67,68,69,60,61,62,63,64,65,66,67,68,69];// Length (sec) of each ambience clip in the order of the config
tpw_soap_russiasonglength = [180,180,180,180,180,180,180,180];// Length (sec) of each song in the order of the config
tpw_soap_azanlength = [223,149,128,184,173,159,120,133,120,112];// Length (sec) of each Azan in the config
tpw_soap_constructionlength = [60,35,90,120,80,75,100,180,80,80,80,70,50]; // Length (sec) of each construction noise
tpw_soap_songsplaying = 0; // How many songs
tpw_soap_maxsongs = 4; // Maximum simultaneous songs allowed
tpw_soap_soundsplaying = 0; // How many songs
tpw_soap_maxsounds = 12; // Maximum simultaneous sounds allowed
tpw_soap_dead = 0; // initial number of deaths
tpw_soap_nearhouses = []; // initial number of nearby buildings
tpw_soap_volume = 1; // Master volume
tpw_soap_constructionplaying = 0; // construction noises
tpw_soap_soundplayed = [];
tpw_soap_songplayed = [];
tpw_soap_lastpos = [0,0,0]; // position of player at last tree scan

// SUNRISE AND SUNSET
_riseset = [] call BIS_fnc_sunriseSunsetTime;
tpw_soap_sunrise = _riseset select 0;
tpw_soap_sunset = _riseset select 1;

// AUTO DETECT REGION
if (tpw_soap_region == 0) then
	{
	// Default to Polyglot
	tpw_soap_region = 6;
	
	// Greece
	if  (tolower worldname in ["altis","stratis","bozcaada"]) then 
		{
		tpw_soap_region = 1;
		};
	
	// Mideast	
	if (tolower worldname in [
	"mcn_aliabad",
	"bmfayshkhabur",
	"clafghan",
	"fata",
	"hellskitchen",
	"hellskitchens",
	"mcn_hazarkot",
	"praa_av",
	"reshmaan",
	"shapur_baf",
	"takistan",
	"torabora",
	"tup_qom",
	"zargabad",
	"pja306",
	"tunba",
	"mountains_acr",
	"kunduz",
	"pja310",
	"pja308",
	"tropica",
	"pja307",
	"wgl_palms",
	"fallujah",
	"dya",
	"kidal",
	"pja319",
	"lythium",
	"huntersvalley",
	"farkhar",
	"altiplano"
	]) then	
		{
		tpw_soap_region = 2
		};

	// Tropical	/ Pacific / African
	if  (tolower worldname in 
	["tanoa",
	"mak_jungle",
	"pja305",
	"tigeria",
	"tigeria_se",
	"plr_mana",
	"sara",
	"saralite",
	"sara_dbe1",
	"porto",
	"intro",
	"pja312",
	"tanoa",
	"bsoc_brasil",
	"lingor3",
	"isladuala3",
	"dingor",
	"prei_khmaoch_luong",
	 "us101_cao_bang",
	 "dakrong",
	 "uns_dong_ha",
	 "rungsat",
	 "csj_sea",
	 "csj_lowlands",
	 "phu_bai",
	 "uns_ptv",
	 "rockwall"
	]) then 
		{
		tpw_soap_region = 3;
		};
	
	// France	
	if  (tolower worldname in ["malden","tembelan","porquerolles"]) then 
		{
		tpw_soap_region = 4;
		};	

	// Eastern Europe	
	if (tolower worldname in [
	"caribou",
	"namalsk",
	"bush_island_51",
	"chernarus",
	"chernarus_summer",
	"chernarusredux",
	"fdf_isle1_a",
	"mbg_celle2",
	"woodland_acr",
	"bootcamp_acr",
	"thirsk",
	"thirskw",
	"utes",
	"gsep_mosch",
	"gsep_zernovo",
	"anim_helvantis_v2",
	"colleville",
	"staszow",
	"baranow",
	"panovo",
	"ivachev",
	"xcam_taunus",
	"pja314",
	"beketov",
	"hellanmaa",
	"blud_vidda",
    "ruha"
	]) then
		{
		tpw_soap_region = 5;
		};			
	};
	
// ADJUST TRAFFIC NOISE MULTIPLIER PER MAP
private _maps = ["altis","stratis","malden","lythium","tanoa","prei_khmaoch_luong","dya","chernarusredux"];
private _adj = [1,1.5,1.5,1.5,1.2,0.2,0.5,0.1];
if (tolower worldname in _maps) then
	{
	tpw_soap_mapfactor = (_adj select (_maps find tolower worldname)); 	
	} 
	else
	{
	tpw_soap_mapfactor = 1; 	
	};
	
// IS PLAYER IN A HOUSE?		
tpw_soap_fnc_indoors = 
	{
	private ["_pos","_highpos","_return"];
	_pos = eyepos player;
	_highpos = _pos vectoradd [0,0,10];
	if (lineintersects [_pos,_highpos]) then
		{
		_return = true;
		}
		else
		{
		_return = false;
		};
	_return	
	};
	
// NEAREST BUILDING
tpw_soap_fnc_nearestbuilding =
	{	
	private ["_return"];
	_return = (nearestObject [player, "House"]) distance player; // will also return walls
	_return
	};
	
// MAIN LOOP
tpw_soap_fnc_mainloop = 
	{
	
	while {tpw_soap_active} do
		{
		// Scan houses only if fewer than maximum sounds are playing 
		if ((tpw_soap_active) && 
		{tpw_soap_soundsplaying < tpw_soap_maxsounds} && 
		{speed player <20} && 
		{!([] call tpw_soap_fnc_indoors)}) then
			{
			tpw_soap_nearhouses = [];
			0 = [] call tpw_soap_fnc_housescan;
			};
		sleep 5.11;
		};
	};
	
// AZAN LOOP
tpw_soap_fnc_azanloop = 
	{
	tpw_soap_azanflag = 0;
	while {tpw_soap_active} do
		{
		if ((tpw_soap_active) &&
		{tpw_soap_azanflag == 0} &&
		{(daytime > tpw_soap_sunrise - 1.25 && daytime < tpw_soap_sunrise - 1 ) || 
		(daytime > tpw_soap_sunrise && daytime < tpw_soap_sunrise + 0.25) || 
		(daytime > 11.75 && daytime < 12) || 
		(daytime > 14 && daytime < 14.25) ||
		(daytime > tpw_soap_sunset - 2 && daytime < tpw_soap_sunset - 1.75) || 
		(daytime > tpw_soap_sunset && daytime < tpw_soap_sunset + 0.25)}) then
			{
			0 = [] call tpw_soap_fnc_mosquescan;
			};
		sleep 61.3;
		};
	};
	
// HOUSE SCANNING 
tpw_soap_fnc_housescan =
	{
	private ["_nearhouses","_house","_i"];
	// Region - can be changed on the fly
	if (tpw_soap_region == 1) then
		{
		tpw_soap_sounds = 17;
		tpw_soap_songs = 9;
		tpw_soap_path = "TPW_SOUNDS\sounds\greek\";
		tpw_soap_soundlength = tpw_soap_greeksoundlength;
		tpw_soap_songlength = tpw_soap_greeksonglength;
		tpw_soap_musicfactor = 2.5; // Slightly louder Greek music
		};
		
	if (tpw_soap_region == 2) then
		{
		tpw_soap_sounds = 22;
		tpw_soap_songs = 20;
		tpw_soap_path = "TPW_SOUNDS\sounds\mideast\";
		tpw_soap_soundlength = tpw_soap_mideastsoundlength;
		tpw_soap_songlength = tpw_soap_mideastsonglength;
		tpw_soap_musicfactor = 2;
		}; 	

	if (tpw_soap_region == 3) then
		{
		tpw_soap_sounds = 25;
		tpw_soap_songs = 11;
		tpw_soap_path = "TPW_SOUNDS\sounds\fiji\";
		tpw_soap_soundlength = tpw_soap_fijisoundlength;
		tpw_soap_songlength = tpw_soap_fijisonglength;
		tpw_soap_musicfactor = 2;
		}; 	

	if (tpw_soap_region == 4) then
		{
		tpw_soap_sounds = 29;
		tpw_soap_songs = 12;
		tpw_soap_path = "TPW_SOUNDS\sounds\france\";
		tpw_soap_soundlength = tpw_soap_francesoundlength;
		tpw_soap_songlength = tpw_soap_francesonglength;
		tpw_soap_musicfactor = 0.5;
		}; 	

	if (tpw_soap_region == 5) then
		{
		tpw_soap_sounds = 29;
		tpw_soap_songs = 8;
		tpw_soap_path = "TPW_SOUNDS\sounds\russia\";
		tpw_soap_soundlength = tpw_soap_russiasoundlength;
		tpw_soap_songlength = tpw_soap_russiasonglength;
		tpw_soap_musicfactor = 1.5;
		};	
	
	if (tpw_soap_region == 6) then
		{
		private _rnd = floor random 5;
		tpw_soap_sounds = [17,19,25,29,29] select _rnd;
		tpw_soap_songs = [9,11,11,12,8] select _rnd; 
		tpw_soap_path = format ["%1%2\","TPW_SOUNDS\sounds\",["greece","mideast","fiji","france","russia"] select _rnd];
		tpw_soap_soundlength = [tpw_soap_greeksoundlength, tpw_soap_mideastsoundlength,tpw_soap_fijisoundlength,tpw_soap_francesoundlength,tpw_soap_russiasoundlength] select _rnd;
		tpw_soap_songlength = [tpw_soap_greeksonglength, tpw_soap_mideastsonglength,tpw_soap_fijisonglength,tpw_soap_francesonglength,tpw_soap_russiasonglength] select _rnd; 
		tpw_soap_musicfactor = [2.5,2,2,1.5,1.5] select _rnd; 
		};
		
	// Adjust volume & chance of spawning based on time of day
	tpw_soap_soundvolmult =  [0,0,0,0,0,0.2,0.4,0.6,0.8,1,1.0,1,1.2,1.2,1.2,1.2,1,1,0.9,0.8,0.6,0.3,0.2,0.1,0] select (round daytime);
	tpw_soap_musicvolmult =  [0,0,0,0,0,0,0,0.3,0.4,0.6,0.8,0.9,1,1,1,1,1,1,1,1,1,0.8,0.4,0.2,0,0] select (round daytime);

	// Scan for habitable houses 
	_nearhouses = [tpw_soap_radius] call tpw_core_fnc_screenhouses;
	tpw_soap_nearhouses = _nearhouses select {damage _x == 0};
	
	// Loop through nearest houses, find first available
	for "_i" from 0 to (count tpw_soap_nearhouses - 1) do
		{
		_house = tpw_soap_nearhouses select _i;
		
		// Play environmental ambience if not already doing so
		if (
		(_house getvariable ["tpw_soap_ambienceflag",0] == 0) &&
		{_house distance player  > 5} &&
		{random 1 < tpw_soap_soundvolmult} &&
		{tpw_soap_soundsplaying < tpw_soap_maxsounds}
		) then 
			{
			tpw_soap_soundsplaying = tpw_soap_soundsplaying + 1;
			_house setvariable ["tpw_soap_ambienceflag",1,true];
			[_house] call tpw_soap_fnc_ambientsounds; 
			};
		
		// Occasionally play music if not already doing so
		if (
		(_house getvariable ["tpw_soap_musicflag",0] == 0)  && 
		{_house distance player  > 5} &&
		{random 50 < (1 * tpw_soap_musicvolmult)} &&
		{tpw_soap_songsplaying < tpw_soap_maxsongs}
		) then 
			{
			tpw_soap_songsplaying = tpw_soap_songsplaying + 1;
			_house setvariable ["tpw_soap_musicflag",1,true];
			[_house] call tpw_soap_fnc_ambientmusic; 
			};	
			
		// Occasional construction noises
		if (tpw_soap_constructionplaying < 3 && {daytime > tpw_soap_sunrise && daytime < tpw_soap_sunset}  && {_house distance player  > 5} ) then
			{
			_house setvariable ["tpw_soap_constructionflag",1,true];
			tpw_soap_constructionplaying = tpw_soap_constructionplaying + 1;
			[_house] call tpw_soap_fnc_constructionsounds; 
			};
		};
	};
	
// MOSQUE SCANNING	
tpw_soap_fnc_mosquescan =
	{
	private ["_nearhouses","_nearmosques","_mosque","_i","_playflag"];
	// Scan for habitable houses - which can include mosques
	
	_nearhouses = [250] call tpw_core_fnc_screenhouses;
	_nearmosques = [];
	
	// Grab nearest mosques - but only want one playing at a given time
	_playflag = 0;
	for "_i" from 0 to (count _nearhouses - 1) do
		{
		_mosque = _nearhouses select _i;
		if (["osque",str typeof _mosque] call BIS_fnc_inString) then 
			{
			_nearmosques set [count _nearmosques,_mosque];
			};
		};
	_nearmosques = [_nearmosques,[],{player distance _x},"ASCEND"] call BIS_fnc_sortBy;
	
	if ((count _nearmosques > 0) && {_mosque getvariable ["tpw_soap_azanflag",0] == 0}) then
		{
		_mosque = _nearmosques select 0;
		[_mosque] call tpw_soap_fnc_azanplay; 
		};
	};	

// PLAY MUSIC FROM HOUSES
tpw_soap_fnc_ambientmusic =
	{
	private _house = _this select 0;
	[_house] spawn	
		{
		private ["_house","_sel","_len","_finish","_clip","_pos","_pitch","_atten","_vol"];
		sleep random 3;
		_house = _this select 0;
		_pitch = 1;
		_pos = getposasl _house;
		_atten = tpw_soap_attenuation + random tpw_soap_attenuation;
		_vol = tpw_soap_volume * tpw_soap_musicvolume * tpw_soap_musicvolmult * tpw_soap_musicfactor * 0.75;
		
		// Music
		if (count tpw_soap_songplayed >= tpw_soap_songs) then
			{
			tpw_soap_songplayed = [];
			};
		waituntil
			{
			_sel = floor (random tpw_soap_songs);
			!(_sel in tpw_soap_songplayed) 
			};
		tpw_soap_songplayed pushback _sel;
		_clip = format ["%1s%2.ogg",tpw_soap_path,_sel + 1];	
		_len = tpw_soap_songlength select _sel;
			
		// Play user song from @TPW_MODS\music
		if ((tpw_soap_usermusic >0) && {random 10 < 5}) then
			{
			_clip = format ["@TPW_MODS\music\%1.ogg",floor (random tpw_soap_usermusic) + 1];
			_len = 180;
			};
		_finish = diag_ticktime + _len - 5;
		_house setvariable ["tpw_soap_musicflag",_finish,true];
		playsound3d [_clip,_house,false,_pos,_vol,_pitch,_atten];
		waituntil
			{
			sleep 5;
			(diag_ticktime > _house getvariable "tpw_soap_musicflag");
			};	
		_house setvariable ["tpw_soap_musicflag",0,true];
		tpw_soap_songsplaying = tpw_soap_songsplaying - 1;
		};
	};	
	
// PLAY ENVIROMENTAL AMBIENCE IN HOUSES
tpw_soap_fnc_ambientsounds =
	{
	private _house = _this select 0;
	[_house] spawn	
		{
		private ["_house","_sel","_len","_finish","_clip","_pos","_pitch","_atten","_vol"];
		sleep random 3;
		_house = _this select 0;
		_pitch = 0.9 + random 0.2;
		_pos = getposasl _house;
		_atten = tpw_soap_attenuation + random tpw_soap_attenuation;
		_vol = tpw_soap_volume * tpw_soap_ambientvolume * tpw_soap_soundvolmult * 1.25;
		
		// Inbuilt SFX
		if (count tpw_soap_soundplayed >=tpw_soap_sounds) then
			{
			tpw_soap_soundplayed = [];
			};
		waituntil
			{
			_sel = floor (random tpw_soap_sounds);
			!(_sel in tpw_soap_soundplayed) 
			};
		tpw_soap_soundplayed pushback _sel;
		_clip = format ["%1%2.ogg",tpw_soap_path,_sel + 1];	
		_len = tpw_soap_soundlength select _sel;

		// User SFX
		if ((tpw_soap_usersounds > 0) && {random 10 < 5}) then
			{
			_clip = format ["@TPW_MODS\sounds\%1.ogg",floor (random tpw_soap_usersounds) + 1];
			_len = 30;
			};
		_finish = diag_ticktime + _len - 15;
		_house setvariable ["tpw_soap_ambienceflag",_finish,true];
		playsound3d [_clip,_house,false,_pos,_vol,_pitch,_atten];
		waituntil
			{
			sleep 5;
			(diag_ticktime > _house getvariable "tpw_soap_ambienceflag");
			};	
		_house setvariable ["tpw_soap_ambienceflag",0,true];
		tpw_soap_soundsplaying = tpw_soap_soundsplaying - 1;
		};
	};	
	
// PLAY CONSTRUCTION NOISES IN HOUSES
tpw_soap_fnc_constructionsounds =
	{
	private _house = _this select 0;
	[_house] spawn	
		{
		private ["_house","_sel","_len","_finish","_clip","_pos","_pitch","_atten","_vol"];
		sleep random 3;
		_house = _this select 0;
		_pitch = 0.8 + random 0.3;
		_pos = getposasl _house;
		_atten = tpw_soap_attenuation + random tpw_soap_attenuation;
		_vol = tpw_soap_volume * tpw_soap_ambientvolume * tpw_soap_soundvolmult * 0.6;
		
		_sel = ceil random 12;
		_clip = format ["%1%2.ogg",'TPW_SOUNDS\sounds\construction\b',_sel];	
		_len = tpw_soap_constructionlength select _sel;
		_finish = diag_ticktime + _len - 5;
		_house setvariable ["tpw_soap_constructionflag",_finish,true];
		playsound3d [_clip,_house,false,_pos,_vol,_pitch,_atten];
		waituntil
			{
			sleep 5;
			(diag_ticktime > _house getvariable "tpw_soap_constructionflag");
			};	
		_house setvariable ["tpw_soap_constructionflag",0,true];
		tpw_soap_constructionplaying = tpw_soap_constructionplaying - 1;
		};
	};	

// PLAY TELEPHONE NOISES IN HOUSES
tpw_soap_fnc_phone =
	{
	private ["_house","_sel","_clip","_pos","_pitch","_atten","_pause","_rings","_vol"];
	while {tpw_soap_active} do
		{
		if (count tpw_soap_nearhouses > 4 && {daytime > tpw_core_morning && daytime < tpw_core_night}) then
			{	
			_house = tpw_soap_nearhouses select (floor (random (count tpw_soap_nearhouses)));
			_pitch = 0.8 + random 0.3;
			_pos = getposasl _house;
			_atten = tpw_soap_attenuation + random tpw_soap_attenuation;
			_sel = ceil random 13;
			_clip = format ["%1%2.ogg",'TPW_SOUNDS\sounds\phone\ringtone',_sel];	
			_vol = tpw_soap_volume * tpw_soap_ambientvolume * tpw_soap_soundvolmult * 0.05;
			_pause = 2 + random 1;
			_rings = 2 + random 6;
			for "_i" from 1 to _rings do
				{
				playsound3d [_clip,_house,false,_pos,_vol,_pitch,_atten];
				sleep _pause;
				};
			};	
		sleep random 90;	
		
		};
	};
	
// PLAY COUGHS AND SNEEZES
tpw_soap_fnc_resp =
	{
	private ["_house","_sel","_finish","_clip","_pos","_pitch","_atten","_vol"];
	while {tpw_soap_active} do
		{
		if (count tpw_soap_nearhouses > 4 && {daytime > tpw_core_morning && daytime < tpw_core_night}) then
			{
			waituntil
				{	
				_house = tpw_soap_nearhouses select (floor (random (count tpw_soap_nearhouses)));
				_house distance player  > 10
				};
			_pitch = 0.8 + random 0.3;
			_pos = getposasl _house;
			_atten = tpw_soap_attenuation + random tpw_soap_attenuation;
			_sel = ceil random 21;
			_clip = format ["%1%2.ogg",'TPW_SOUNDS\sounds\respiratory\resp',_sel];	
			_vol = tpw_soap_volume * tpw_soap_ambientvolume * tpw_soap_soundvolmult * 3;
			playsound3d [_clip,_house,false,_pos,_vol,_pitch,_atten];
			};	
		sleep random 60;	
		};
	};	

// PLAY AZAN IN NEARBY MOSQUE
tpw_soap_fnc_azanplay =
	{
	private _mosque = _this select 0;
	if (player distance _mosque > 250) exitwith {};
	[_mosque] spawn	
		{
		private ["_mosque","_sel","_len","_finish","_song","_vol","_pos"];
		_mosque = _this select 0;
		_sel = floor random 10;
		_len = tpw_soap_azanlength select _sel;
		_song = format ["TPW_SOUNDS\sounds\azan\%1.ogg",(_sel + 1)];
		_finish = diag_ticktime + _len;
		_mosque setvariable ["tpw_soap_azanflag",_finish,true];
		_vol = tpw_soap_volume * tpw_soap_azanvolume * 0.5 + random 0.5;
		_pos = getposasl _mosque;
		_pos = [_pos select 0, _pos select 1, (_pos select 2) + 50];
		playsound3d [_song,_mosque,false,_pos,_vol,1,0];
		tpw_soap_azanflag = 1;
		sleep 10;
		// Play prayer in nearest house
		playsound3d ["TPW_SOUNDS\sounds\mideast\18.ogg",nearestbuilding player];
		waituntil
			{
			sleep 10;
			(diag_ticktime > _mosque getvariable "tpw_soap_azanflag");
			};	
		_mosque setvariable ["tpw_soap_azanflag",0,true];
		tpw_soap_azanflag = 0;
		};
	};		
	
// CREAKING NOISES IN HOUSES
tpw_soap_fnc_housenoise = 
	{
	private ["_sound","_pitch","_vol"];
	while {tpw_soap_active} do
		{
		if (tpw_soap_active && {[] call tpw_soap_fnc_indoors} && {[] call tpw_soap_fnc_nearestbuilding < 10}) then
			{
			_pitch = 0.8 + random 0.4;
			_vol = tpw_soap_volume * tpw_soap_housefxvolume * windstr * 0.25; // louder creaking in the wind
			_sound = format ["TPW_SOUNDS\sounds\house\c%1.ogg",(ceil random 7)];
			playsound3d [_sound,player,false,getposasl player,_vol,_pitch,50];
			};
		sleep random 30;	
		};
	};
	
// CHAINSAWS
tpw_soap_fnc_chainsaws = 
	{
		private ["_thispos", "_radius","_dir","_posx","_posy","_randpos","_sound"];
	while {tpw_soap_active} do
		{		
		sleep random 120;	
		_thispos = getposasl player;
		_radius = 200 + random 100;
		_dir = random 360;
		_posx = ((_thispos select 0) + (_radius * sin(_dir)));
		_posy = ((_thispos select 1) + (_radius * cos(_dir)));
		_randpos = [_posx,_posy,0]; 
		if (tpw_soap_active && {daytime > tpw_soap_sunrise} && {daytime < tpw_soap_sunset}) then
			{
			if (count nearestTerrainObjects [_randpos, ["tree"], 50, false]> 50) then
				{
				_sound = format ["TPW_SOUNDS\sounds\chainsaw\chainsaw%1.ogg",(ceil random 4)];
				playsound3d [_sound,_randpos,false,_randpos,tpw_soap_chainsawvolume * (10+random 5),1,500];
				};
			};
		};
	};	
	
// FOREST AMBIENCE
tpw_soap_fnc_forest = 
{
	private ["_sound","_treepos","_rnd","_vol"];
    private _trees = [];
    
	while {tpw_soap_active} do
	{		
		sleep random 20;	
		
		if (tpw_soap_active) then
		{
			if (tpw_soap_lastpos distance position player > 25) then
			{
				_trees = nearestTerrainObjects [position player, ["tree"], 50, false];
				tpw_soap_lastpos = position player;
			};
			if (count _trees > 20) then
			{
				_vol = 1.5;
				_rnd = ceil random 22;
				if (_rnd in [1,2,3,4,5,10,11,20,21]) then {_vol= 0.75};
				if (tolower worldname == "chernarusredux") then {_vol = _vol * 2};		
				_sound = format ["TPW_SOUNDS\sounds\forest\forest%1.ogg",_rnd];
				_treepos = (getposasl (_trees select (floor random count _trees))) ;
				playsound3d [_sound,_treepos,false,_treepos,tpw_soap_volume * _vol,1 + random 0.2,300];
			};
		};
	};
};		
	
// TRAFFIC
tpw_soap_fnc_traffic = 
	{
	private ["_roads","_vol","_sound","_building","_buildings"];
	while {tpw_soap_active} do
		{		
		if (tpw_soap_active) then
			{
			//_building = nearestbuilding player;
			_buildings = nearestTerrainObjects [position player, ["house","building"], 50, true];
			if (count _buildings > 1) then
				{
				_building = _buildings select 1;
				_roads = count ((player nearroads 400) select {isonroad _x}) / 400;
				_vol = tpw_soap_volume * tpw_soap_mapfactor * tpw_soap_trafficmult * _roads * _roads * tpw_soap_soundvolmult;
				if (_vol > tpw_soap_trafficmult) then {_vol = tpw_soap_trafficmult};
				_sound = format ["TPW_SOUNDS\sounds\traffic\%1.ogg",(ceil random 3)];
				playsound3d [_sound, _building,false,getposasl _building vectoradd [0,0,20],_vol,1,200];
				};
			};
		sleep random 45;	
		};
	};		
	
	
// WIND NOISE IN HOUSES	
tpw_soap_fnc_windnoise = 
	{
	private ["_sound","_pitch","_vol"];
	while {tpw_soap_active} do
		{
		if (tpw_soap_active &&{[] call tpw_soap_fnc_indoors} && {[] call tpw_soap_fnc_nearestbuilding < 10} && {windstr > 0.2}) then
			{
			_pitch = 0.8 + random 0.4;
			_vol = (tpw_soap_volume * tpw_soap_housefxvolume * windstr * 0.5);
			_sound = format ["TPW_SOUNDS\sounds\house\w%1.ogg",(ceil random 9)];
			playsound3d [_sound,player,false,getposasl player,_vol,_pitch,50]; // wind
			sleep random 10;
			_sound = format ["TPW_SOUNDS\sounds\house\r%1.ogg",(ceil random 6)]; // rattle
			playsound3d [_sound,player,false,getposasl player,_vol * 2,_pitch,50];
			};
		sleep 30 + random 10;	
		};
	};	
	
// MONITOR DEATHS, LOWER MASTER VOLUME FOR A FEW MINUTES AFTER EACH NEW DEATH
tpw_soap_fnc_battle =
	{
	private ["_battletime","_orig_vol"];
	_battletime = 0;
	_orig_vol = tpw_soap_volume;
	while {tpw_soap_active} do
		{
		if (count alldeadmen > tpw_soap_dead) then
			{
			tpw_soap_dead = count alldead;
			_battletime = diag_ticktime + (random 120);
			tpw_soap_volume = _orig_vol * 0.5;
			};
		if  (diag_ticktime > _battletime) then
			{
			tpw_soap_volume = _orig_vol;
			};
		sleep 11.53;
		};
	};
	
// SCREAMS / BARKS / SIRENS IF NEARBY GUNFIRE
player addeventhandler ["firednear",{0 = [player] spawn tpw_soap_fnc_scream}];
tpw_soap_bulletcount = 0;
tpw_soap_nextcry = 0;
tpw_soap_fnc_scream =
	{
	private ["_sound","_pitch","_vol","_house","_nearhouses"];
	if ((tpw_soap_active) && {diag_ticktime > tpw_soap_nextcry} && {random 10 < 3}) then 
		{			
		tpw_soap_nextcry = diag_ticktime + random 15;	
		sleep 1 + random 5;
		_nearhouses = [tpw_soap_radius * 0.75] call tpw_core_fnc_screenhouses;
		if ((_nearhouses select 0 distance player  < tpw_soap_radius) && {!([] call tpw_soap_fnc_indoors)}) then
			{
			_house = _nearhouses select floor (random (count _nearhouses));
			_vol = tpw_soap_housefxvolume * 2;
			_pitch = 0.9 + random 0.2;
			if (random 10 < 5) then
				{
				_sound = format ["TPW_SOUNDS\sounds\fear\%1.ogg",(ceil random 12)]; // screams, babies
				} else
				{
				_sound = format ["TPW_SOUNDS\sounds\animal\dog%1.ogg",ceil (random 20)]; // barks
				};
			playsound3d [_sound,_house,false,getposasl _house,_vol,_pitch,100];
			
			if (count ([100] call tpw_core_fnc_screenhouses) > 20) then
				{
				sleep random 10;
				_sound = format ["TPW_SOUNDS\sounds\siren\siren%1.ogg",ceil (random 4)]; // sirens
				playsound3d [_sound,_house,false,getposasl _house,1.5,_pitch,250];
				};	
			};
		};
	};	
	
// RUN IT
[] spawn tpw_soap_fnc_battle;	
[] spawn tpw_soap_fnc_mainloop;
[] spawn tpw_soap_fnc_azanloop;
[] spawn tpw_soap_fnc_housenoise;
[] spawn tpw_soap_fnc_windnoise;
[] spawn tpw_soap_fnc_chainsaws;
[] spawn tpw_soap_fnc_forest;
[] spawn tpw_soap_fnc_phone;
[] spawn tpw_soap_fnc_resp;
tpw_soap_soundvolmult = 0;  
[] spawn tpw_soap_fnc_traffic;
