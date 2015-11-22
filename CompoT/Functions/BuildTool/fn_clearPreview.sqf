/* 
   File: fn_clearPreview.sqf 
   Function: CT_fnc_clearPreview 
   Folder: BuildTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

if (count CT_var_builtPreview != 0) then {
	{deleteVehicle _x} forEach CT_var_builtPreview;
	CT_var_builtPreview = [];
};