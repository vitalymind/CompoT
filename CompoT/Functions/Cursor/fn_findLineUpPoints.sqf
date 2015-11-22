/* 
   File: fn_findLineUpPoints.sqf 
   Function: CT_fnc_findLineUpPoints 
   Folder: Cursor 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_objects", "_result"];
_objects = _this;
_result = [];
{
	_result pushBack [(getPosASL _x) select 0, (getPosASL _x) select 1, 0];
} forEach _objects;
_result;