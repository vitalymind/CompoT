/* 
   File: fn_buildToolresetHeight.sqf 
   Function: CT_fnc_buildToolresetHeight 
   Folder: SelectTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

if (CT_var_cursorTool != "buildTool") exitWith {};
CT_var_buildToolHeight = 0;
if (!CT_var_buildToolEmpty) then {
	call CT_fnc_pickCurrentBuildable;
};