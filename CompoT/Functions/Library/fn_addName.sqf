/* 
   File: fn_addName.sqf 
   Function: CT_fnc_addName 
   Folder: Library 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_name"];
_name = [_this, 0, "", [""]] call BIS_fnc_param;
if (_name == "") exitWith {false};
if ([_name] call CT_fnc_isNameUsed) exitWith {false};
CT_var_usedNames pushBack _name;
true;