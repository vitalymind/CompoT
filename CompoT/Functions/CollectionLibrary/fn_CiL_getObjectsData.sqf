/* 
   File: fn_CiL_getObjectsData.sqf 
   Function: CT_fnc_CiL_getObjectsData 
   Folder: CollectionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_result","_names","_name","_index","_found"];
_result = [];
_names = _this;
{
	_index = (CT_var_CiL_objects select 0) find _x;
	if (_index != -1) then {
		_result pushBack ((CT_var_CiL_objects select 1) select _index);
	} else {
		_found = isClass (configFile >> "CfgVehicles" >> _x);
		if (_found) then {
			_result pushBack [0, _x]
		} else {
			_result pushBack [-1, _x]
		};
	};
} forEach _names;
_result;