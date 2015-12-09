/* 
   File: fn_toggleStickToObjectMode.sqf
   Function: CT_fnc_toggleStickToObjectMode
   Folder: Cursor
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

if (CT_var_stickToObjectMode) then {
	CT_var_stickToObjectMode = false;
	["Stick to object mode de-activated"] call CT_fnc_notification;
} else {
	if (!CT_var_stickToObjectMode) then {
		CT_var_stickToObjectMode = true;
		["Stick to object mode activated"] call CT_fnc_notification;
	};
};