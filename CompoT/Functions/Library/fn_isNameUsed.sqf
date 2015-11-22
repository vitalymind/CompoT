/* 
   File: fn_isNameUsed.sqf 
   Function: CT_fnc_isNameUsed 
   Folder: Library 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_name"];
_name = [_this, 0, "", [""]] call BIS_fnc_param;
if (_name == "") exitWith {false};
if (_name in CT_var_usedNames) exitWith {true};
false;