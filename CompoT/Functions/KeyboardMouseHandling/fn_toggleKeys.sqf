/* 
   File: fn_toggleKeys.sqf 
   Function: CT_fnc_toggleKeys 
   Folder: KeyboardMouseHandling 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_toggle", "_case","_index"];
_case = _this select 0;
_toggle = _this select 1;
_index = switch (_case) do {
	case "up": {0};case "down": {1};case "forw": 
	{2};case "back": {3};case "left": {4};case "rght": {5};
	case "ctrl": {6};case "shift": {7};case "alt": {8}
};
if ((!(CT_var_holdenKeys select _index)) && _toggle) then {CT_var_holdenKeys set [_index,true]};
if ((CT_var_holdenKeys select _index) && !_toggle) then {CT_var_holdenKeys set [_index,false]};