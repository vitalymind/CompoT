/* 
   File: fn_saveElement.sqf 
   Function: CT_fnc_saveElement 
   Folder: Library 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_pivot","_map","_composition","_categoryName","_categoryData","_found","_newName","_newSize","_newElements",
"_pointer"];
_pivot = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
if (isNull _pivot) exitWith {};
if (typeOf _pivot == CENTER_PIVOT) exitWith {};
_map = [_pivot] call CT_fnc_mapComposition;
_composition = call compile (_map select 0);
_newName = _composition select 0;
_newSize = _composition select 1;
_newElements = _composition select 2;
_found = false; _pointer = [];
{
	_categoryName = _x select 0;
	_categoryData = _x select 1;
	{
		_elementName = _x select 0;
		if (_elementName == _newName) exitWith {_pointer = _x;_found = true;};
	} forEach _categoryData;
	if (_found) exitWith {};
} forEach CT_var_compositions;
if (_found) then {
	_pointer set [0, _newName];
	_pointer set [1, _newSize];
	_pointer set [2, _newElements];
} else {
	[_composition, "composition","temporary"] call CT_fnc_saveElementAs;
};