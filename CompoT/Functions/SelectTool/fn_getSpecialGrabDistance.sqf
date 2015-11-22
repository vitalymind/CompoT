/* 
   File: fn_getSpecialGrabDistance.sqf 
   Function: CT_fnc_getSpecialGrabDistance 
   Folder: SelectTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_direction","_currentOffset","_newOffset","_speed"];
_currentOffset = _this select 0;
_direction = _this select 1;
_speed = 0; _newOffset = 0;
switch true do {
	case (_currentOffset <= 1 AND _currentOffset >= 0.1): {_speed = 0.1};
	case (_currentOffset <= 10 AND _currentOffset > 1): {_speed = 1};
	case (_currentOffset > 10): {_speed = 2};
};
_newOffset = _currentOffset + (_speed * _direction);
_newOffset = _newOffset max 0.1 min 100;
_newOffset;