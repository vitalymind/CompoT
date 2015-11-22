/* 
   File: fn_isPivotCloned.sqf 
   Function: CT_fnc_isPivotCloned 
   Folder: Library 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_name","_count"];
if (typeOf _this == CENTER_PIVOT) exitWith {false};
_name = _this getVariable "name";
_count = {(_name == (_x getVariable "name"))} count CT_var_builtPivots;
if (_count == 1) exitWith {false};
if (_count != 1) exitWith {true};