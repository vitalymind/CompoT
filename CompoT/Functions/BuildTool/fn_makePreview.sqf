/* 
   File: fn_makePreview.sqf 
   Function: CT_fnc_makePreview 
   Folder: BuildTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_pos"];
CT_var_buildToolEmpty = false;
_pos = getPosATL CT_var_cursor; _pos set [2,0];
		
if (((CT_var_buildMode select 0) select 0) in ["object","collection"]) then {
	_pos set [2,CT_var_buildToolHeight];
};

["preview",(_this select 1),["asParent",(_this select 0)],_pos,CT_var_buildToolAngle,CT_var_cursor,"random"] call CT_fnc_build;