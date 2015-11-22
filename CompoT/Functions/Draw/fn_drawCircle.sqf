/* 
   File: fn_drawCircle.sqf 
   Function: CT_fnc_drawCircle 
   Folder: Draw 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_count", "_firstPoint","_nextPoint","_point"];
_count = count _this;
_firstPoint = _this select 0;
_firstPoint = [_firstPoint select 0, _firstPoint select 1, (_firstPoint select 2) + 1];
{
	_point = _x;
	_point = [_point select 0, _point select 1, (_point select 2) + 1];
	if (_forEachIndex == (_count - 1)) then {
		drawLine3D [_point, _firstPoint, COLOR_RED];
	} else {
		_nextPoint = _this select (_forEachIndex + 1);
		_nextPoint = [_nextPoint select 0, _nextPoint select 1, (_nextPoint select 2) + 1];
		drawLine3D [_point, _nextPoint, COLOR_RED];
	};
} forEach _this;