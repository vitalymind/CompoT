/* 
   File: fn_drawLineUp.sqf 
   Function: CT_fnc_drawLineUp 
   Folder: Draw 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

{
	drawLine3D [_x, [_x select 0, _x select 1, (_x select 2) + 35], COLOR_WHITE];
} forEach _this;