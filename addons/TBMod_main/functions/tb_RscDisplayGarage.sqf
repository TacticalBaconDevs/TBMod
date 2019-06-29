#include "../script_macros.hpp"
_mode = _this select 0;
_params = _this select 1;
_class = _this select 2;

switch _mode do {
    case "onLoad": {
        if (isnil {missionnamespace getvariable "bis_fnc_arsenal_data"}) then {
            startloadingscreen [""];
            ['Init',_params] spawn (uinamespace getvariable QFUNC(garage));
        } else {
            ['Init',_params] call (uinamespace getvariable QFUNC(garage));
        };
    };
    case "onUnload": {
        ['Exit',_params] call (uinamespace getvariable QFUNC(garage));
    };
};