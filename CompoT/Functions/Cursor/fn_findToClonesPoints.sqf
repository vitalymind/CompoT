/* 
   File: fn_findToClonesPoints.sqf 
   Function: CT_fnc_findToClonesPoints 
   Folder: Cursor 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_object", "_result","_name"];
_object = _this;
_name = _object getVariable "name";
_result = [];
_result pushBack (getPosATL _object);
{
	if ((_x getVariable "name") == _name) then {
		if (_x != _object) then {
			_result pushBack (getPosATL _x);
		};
	};
} forEach CT_var_builtPivots;
_result;