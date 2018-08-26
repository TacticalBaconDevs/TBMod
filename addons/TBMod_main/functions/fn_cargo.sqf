params ["_save", "_vehicle", "_value"];
    
    if (_save) then {
        [
            getBackpackCargo _vehicle,
            getItemCargo _vehicle,
            getMagazineCargo _vehicle,
            getWeaponCargo _vehicle
        ]
    } else {
        _value params ["_backpack", "_item", "_mags", "_items"];
        {
            _vehicle addBackpackCargoGlobal [_x, (_backpack select 1) select _forEachIndex];
        } forEach (_backpack select 0);
        {
            _vehicle addItemCargoGlobal [_x, (_item select 1) select _forEachIndex];
        } forEach (_item select 0);
        {
            _vehicle addMagazineCargoGlobal [_x, (_mags select 1) select _forEachIndex];
        } forEach (_mags select 0);
        {
            _vehicle addItemCargoGlobal [_x, (_items select 1) select _forEachIndex];
        } forEach (_items select 0);
    };