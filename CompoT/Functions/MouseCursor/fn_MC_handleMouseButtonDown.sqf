/* 
   File: fn_MC_handleMouseButtonDown.sqf 
   Function: CT_fnc_MC_handleMouseButtonDown
   Folder: MouseCursor 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_button"];
_button = _this select 1;
if (CT_var_cursorTool == "selectTool") then {
	if (_button == DIK_LMB) then {
		if (count ct_var_frameSelect == 0) then {
			ct_var_frameSelect = [[(CT_var_mousePos select 0),(CT_var_mousePos select 1)], [0,0]];
		};
	};
};
if (_button == DIK_RMB) then {
	CT_var_forceCamRotate = true;
};