/* 
   File: fn_infoGUI.sqf 
   Function: CT_fnc_infoGUI 
   Folder: InfoGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

if (_this == "open") then {
	if (CT_var_curGUIMode in ["info+cursorControls","info+basicControls","info"]) then {
		CT_var_infoGuiVisible = true; 5 cutRsc ["info_GUI","PLAIN",0];
	};
};
if (_this == "close") then {CT_var_infoGuiVisible = false; 5 cutText ["","PLAIN",0]};