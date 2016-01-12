/* 
   File: fn_controlsGUI.sqf 
   Function: CT_fnc_controlsGUI 
   Folder: InfoGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

if (_this == "open") then {
	if (CT_var_curGUIMode in ["info+cursorControls","info+basicControls"]) then {
		CT_var_controlsGuiVisible = true; 6 cutRsc ["ct_controls_GUI","PLAIN",0];
	};
};
if (_this == "close") then {CT_var_controlsGuiVisible = false; 6 cutText ["","PLAIN",0]};