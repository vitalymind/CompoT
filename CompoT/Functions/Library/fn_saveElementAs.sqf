/* 
   File: fn_saveElementAs.sqf 
   Function: CT_fnc_saveElementAs 
   Folder: Library 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_catElements","_element","_libraryName","_library","_elementName","_found","_i","_saveAs","_index"];
_element = _this select 0;
_elementName = _element select 0;
_libraryName = _this select 1;
_saveAs = _this select 2;
_catElements = [];
_library = switch (_libraryName) do {
	case "collection": {CT_var_collections};
	case "composition": {CT_var_compositions};
	case "prefab": {CT_var_prefabs};
	default {[]};
};
_found = false;
{
	if ((_x select 0) == _saveAs) exitWith {_catElements = _x select 1; _found = true;};
} forEach _library;
if (!_found) then {
	_i = _library pushBack [_saveAs,[]];
	_catElements = (_library select _i) select 1;
};

if ([_elementName] call CT_fnc_isNameUsed) then {
	_i = -1;
	{
		if (_elementName == (_x select 0)) exitWith {_i = _forEachIndex};
	} forEach _catElements;
	if (_i != -1) then {
		_catElements set [_i, _element];
	} else {
		if (_saveAs != "parts") then {_catElements pushBack _element};
	};
} else {
	_catElements pushBack _element;
	[_elementName] call CT_fnc_addName;
};
