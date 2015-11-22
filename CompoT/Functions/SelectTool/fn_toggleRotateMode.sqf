/* 
   File: fn_toggleRotateMode.sqf 
   Function: CT_fnc_toggleRotateMode 
   Folder: SelectTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

if (CT_var_rotateMode == "individual") then {
	CT_var_rotateMode = "common";
	["Rotating mode is set to common orientation"] call CT_fnc_notification;
} else {
	if (CT_var_rotateMode == "common") then {
		CT_var_rotateMode = "individual";
		["Rotating mode is set to individual orientation"] call CT_fnc_notification;
	};
};