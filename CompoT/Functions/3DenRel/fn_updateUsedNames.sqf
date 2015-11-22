/* 
   File: fn_updateUsedNames.sqf 
   Function: CT_fnc_updateUsedNames
   Folder: 3DenRel 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp"

CT_var_usedNames deleteRange [0, count CT_var_usedNames];
{
	{
		{
			CT_var_usedNames pushBack (_x select 0);
		} forEach (_x select 1);
	} forEach _x;
} forEach [CT_var_compositions, CT_var_collections, CT_var_prefabs];
