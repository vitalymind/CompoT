/* 
   File: fn_PrL_getCompositionData.sqf 
   Function: CT_fnc_PrL_getCompositionData 
   Folder: PrefabLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_result","_name","_index"];
_result = [];
{
	_index = (CT_var_PrL_compositions select 0) find _x;
	if (_index != -1) then {
		_result pushBack ((CT_var_PrL_compositions select 1) select _index);
	} else {
		_result pushBack [0, _x];
	};
} forEach _this;
_result;