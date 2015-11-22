/* 
   File: fn_handleDraw3D.sqf 
   Function: CT_fnc_handleDraw3D 
   Folder: Draw 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_case","_points"];
{
	_case = _x select 1;
	_points = _x select 2;
	switch (_case) do {
		case "circle": {_points call CT_fnc_drawCircle;};
		case "lineUp": {_points call CT_fnc_drawLineUp;};
		case "clones": {_points call CT_fnc_drawCloneLines;};
		case "parentToChildLine": {[_points, COLOR_CYAN] call CT_fnc_drawline;};
		case "childToParentLine": {[_points, COLOR_BLUE] call CT_fnc_drawline;};
	};
} forEach CT_var_drawOrders;