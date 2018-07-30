//ARMA3Alpha function LV_fnc_getPlayers v1.0 - by SPUn / lostvar
//Returns array of all alive non-captive players
playableUnits select {
	isPlayer _x && alive _x && !captive _x
};
