/* 
   File: fn_IM_importLibrary.sqf 
   Function: CT_fnc_IM_importLibrary 
   Folder: ImportMenuGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_libraryName","_collision","_import","_library","_libMap","_catData","_catIndex"];
_libraryName = _this select 0;
_collision = _this select 1;
_import = _this select 2;

_library = switch (_libraryName) do {
	case "object": {CT_var_objects};
	case "composition": {CT_var_compositions};
	case "collection": {CT_var_collections};
	case "prefab": {CT_var_prefabs};
	default {[]};
};

//EXEPTIONAL SHORTCUT FOR OBJECT LIBRARY
if (_libraryName == "object") exitWith {
	_catMap = [];
	{
		_catMap pushBack (_x select 0);
	} forEach _library;
	{
		_catName = _x select 0;
		_catData = _x select 1;
		if (_catName in _catMap) then {
			_index = _catMap find _catName;
			if (_collision == 0) then {
				(_library select _index) set [1, _catData];
			};
		} else {
			_library pushBack _x;
		};
	} forEach _import;
};

//MAKE MAP OF ELEMENTS IN LIBRARY
_libMap = [];
{
	_catIndex = _forEachIndex;
	{
		_libMap pushBack (_x select 0);
		_libMap pushBack [_catIndex, _forEachIndex];
	} forEach (_x select 1);
} forEach _library;

{
	[_libraryName,_collision,_x,_libMap] call CT_fnc_IM_importCategory;
} forEach _import;