// Hide all objects local on a Map
private _hideLocaly = true;
private _hidingCode = switch (true) do
{
	case (_hideLocaly && isServer):
	{
		{_x hideObject true;_x allowDamage false;};
	};
	case (_hideLocaly && !isServer):
	{
		{_x hideObject true;};
	};
	default
	{
		{_x hideObjectGlobal true;_x allowDamage false;};
	};
};

_hidingCode spawn {
    params ["_hidingCode"];

    uiSleep 2;
    private _cats = ["BUILDING","HOUSE","CHURCH","CHAPEL","FUELSTATION","HOSPITAL","FENCE","VIEW-TOWER","LIGHTHOUSE","BUSSTOP","TRANSMITTER","TOURISM",
        "WATERTOWER","POWER LINES","RAILWAY","POWERSOLAR","POWERWAVE","POWERWIND","SHIPWRECK","QUAY","HIDE","STACK","FENCE","WALL"];
    _hidingCode forEach (nearestTerrainObjects [
        [worldSize / 2, worldSize / 2],
        _cats,
        worldSize * sqrt 2 / 2,
        false,
        true
    ]);
};
