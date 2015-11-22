/* 
   File: fn_drawCloneLines.sqf 
   Function: CT_fnc_drawCloneLines 
   Folder: Draw 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_count", "_firstPoint","_point"];
_count = count _this;
_firstPoint = _this select 0;
_firstPoint = [_firstPoint select 0, _firstPoint select 1, (_firstPoint select 2) + 2];
{
	_point = _x;
	_point = [_point select 0, _point select 1, (_point select 2) + 2];
	if (_forEachIndex != 0) then {
		drawLine3D [_point, _firstPoint, COLOR_VIOLET];
	};
} forEach _this;