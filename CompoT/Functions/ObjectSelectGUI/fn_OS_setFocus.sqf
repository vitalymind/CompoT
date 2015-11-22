/* 
   File: fn_OS_setFocus.sqf 
   Function: CT_fnc_OS_setFocus 
   Folder: ObjectSelectGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_case","_ctrl"];
_case = _this select 0;
_ctrl = (_this select 1) select 0;
if (_case == "in") then {
	_ctrl ctrlSetTextColor [1,0.8,0.2,1];
};
if (_case == "out") then {
	_ctrl ctrlSetTextColor [1,1,1,1];
};