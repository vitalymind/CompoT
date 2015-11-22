/* 
   File: fn_replaceDeep.sqf 
   Function: CT_fnc_replaceDeep 
   Folder: Library 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_arr","_search","_replace","_count","_scanArray"];
_arr = param [0, [], [[]]];
_search = param [1, "", [""]];
_replace = param [2, "", [""]];
if (count _arr == 0) exitWith {0};
if (_search == "") exitWith {-1};
if (_replace == "") exitWith {-1};
_count = 0;
_scanArray = {
	{
		if (typeName _x == "STRING") then {
			if (_x isEqualTo _search) then {
				_this set [_forEachIndex, _replace];
				_count = _count + 1;
			};
		};
		if (typeName _x == "ARRAY") then {
			_x call _scanArray;
		};
	} forEach _this;
};
_arr call _scanArray;
_count;