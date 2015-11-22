/* 
   File: fn_drawLine.sqf 
   Function: CT_fnc_drawLine 
   Folder: Draw 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_from","_to","_color"];
_from = (_this select 0) select 0;
_from = [_from select 0, _from select 1, (_from select 2) + 2];
_to = (_this select 0) select 1;
_to = [_to select 0, _to select 1, (_to select 2) + 2];
_color = _this select 1;
drawLine3D [_from, _to, _color];