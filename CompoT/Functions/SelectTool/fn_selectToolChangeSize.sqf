/* 
   File: fn_selectToolChangeSize.sqf 
   Function: CT_fnc_selectToolChangeSize 
   Folder: SelectTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

if (CT_var_cursorTool != "selectTool") exitWith {};
if (CT_var_selectToolSize == "big") then {
	CT_var_selectToolSize = "small";
	"selectTool" call CT_fnc_cursorChangeTool;
} else {
	CT_var_selectToolSize = "big";
	"selectTool" call CT_fnc_cursorChangeTool;
};