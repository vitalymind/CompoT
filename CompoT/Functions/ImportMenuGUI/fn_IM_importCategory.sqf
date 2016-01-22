/* 
   File: fn_IM_importCategory.sqf 
   Function: CT_fnc_IM_importCategory
   Folder: ImportMenuGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_libraryName","_collision","_import","_library","_libMap","_categoryPointer","_catIndex"];
_libraryName = _this select 0;
_collision = _this select 1;
_import = _this select 2;
_libMap = param [3,[]];

_library = switch (_libraryName) do {
	case "object": {CT_var_objects};
	case "composition": {CT_var_compositions};
	case "collection": {CT_var_collections};
	case "prefab": {CT_var_prefabs};
	default {[]};
};

//MAKE MAP IF NOTHING PROVIDED
if (count _libMap == 0) then {
	{
		_catIndex = _forEachIndex;
		{
			_libMap pushBack (_x select 0);
			_libMap pushBack [_catIndex, _forEachIndex];
		} forEach (_x select 1);
	} forEach _library;
};

//SEE IF IMPORT CATEGORY ALREADY EXIST AND POINT IT, OTHERWISE CREATE AND POINT IT
_categoryPointer = [];
{
	if ((_x select 0) == (_import select 0)) then {_categoryPointer = _x};
} forEach _library;
if (count _categoryPointer == 0) then {_categoryPointer = (_library select (_library pushBack [(_import select 0), []]))};

{
	[_libraryName,_collision,_x,_libMap,_categoryPointer] call CT_fnc_IM_importElement;
} forEach (_import select 1);










