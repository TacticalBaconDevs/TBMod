# TBMod Stealth Heli
## Info
Stealth Helis von TB

## Maintainer
- [Eric Ruhland](https://github.com/Er1807)

## Developer:
- [shukari](https://github.com/shukari)
- [Eron](https://github.com/E-for-Eron)

## Contributors:
[Contributors](https://github.com/TacticalBaconDevs/TBMod/graphs/contributors)

### Deaktivieren in der Mission
(vehicle player) setVariable ["TBmod_stealthvehicle_activateStealth", false, true];
{
    [_x, false] remoteExecCall ["setCaptive", _x];
} forEach (crew (vehicle player));
