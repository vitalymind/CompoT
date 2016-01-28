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
	if (_case == "circle") then {_points call CT_fnc_drawCircle;};
	//if (_case == "lineUp") then {_points call CT_fnc_drawLineUp;};
	if (_case == "clones") then {_points call CT_fnc_drawCloneLines;};
	if (_case == "parentToChildLine") then {[_points, COLOR_CYAN] call CT_fnc_drawline;};
	if (_case == "childToParentLine") then {[_points, COLOR_BLUE] call CT_fnc_drawline;};
} forEach CT_var_drawOrders;

{
	_color = [0.98,0.87,0.15,0.6];
	if (_x in ct_var_selDrawIcons) then {_color = [0.25,0.88,0,0.8]};
	if ((CT_var_cam distance _x) < 750) then {
		drawIcon3D [
			"composition_tool_data\data\ui\ct_object.paa", 
			_color, getPosVisual _x, 0.5, 0.5, 0
		];
	};
} forEach ct_var_builtObjects;

