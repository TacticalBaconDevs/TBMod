/*
    Author: Eric Ruhland
    Add AAttach Action to vehicle
    Parameter:
    1: Target
    Rückgabe:
       
*/
params["_target"];
_target addAction  
    [ 
    "Attach Rope",  
    {
        (_this select 0) call TB_fnc_attach;
       }, 
    [], 
    1.5,  
    true,  
    true,  
    "", 
    "!isNull (player getvariable['TB_Rope_source',objNull])", // _target _this 
    10, 
    false, 
    "", 
    "" 
];