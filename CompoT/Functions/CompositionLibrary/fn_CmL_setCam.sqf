/* 
   File: fn_CmL_setCam.sqf 
   Function: CT_fnc_CmL_setCam 
   Folder: CompositionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_size","_center","_height","_camPos","_offsetX","_offsetY"];
_size = _this select 0;
_size = _size max 10 min 100;
_center = getMarkerPos "center";
CT_var_cam setDir 0;
[CT_var_cam, -40, 0] call BIS_fnc_setPitchbank;
_height = _size * 1.6;
_offsetY = _size * 1.7;
_offsetX = _size * 0.9;
_camPos = [
	(_center select 0) - _offsetX,
	(_center select 1) - _offsetY,
	_height
];
CT_var_cam setPosATL _camPos;