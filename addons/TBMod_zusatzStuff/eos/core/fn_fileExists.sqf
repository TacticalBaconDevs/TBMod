params ["_file"];

private _return = false;
private _control = (uiNamespace getVariable ["RscDisplayMain", displayNull]) ctrlCreate ["RscHTML", -1];
if (isNull _control) then {
    _return = loadFile _file != "";
} else {
    _control htmlLoad _file;
    _return = ctrlHTMLLoaded _control;
    ctrlDelete _control;
};

_return
    