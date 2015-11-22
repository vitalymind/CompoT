/* 
   File: fn_IM_importLibrary.sqf 
   Function: CT_fnc_IM_importLibrary 
   Folder: ImportMenuGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_libraryName","_collision","_import","_library","_catName","_catData","_index","_elemAddress","_elemMap","_catMap",
"_catIndex","_elemIndex","_namesToChange","_nameIsGood","_i","_newName"];
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
_catMap = []; _index = -1;
if (_libraryName == "object") then {
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
_elemAddress = []; _elemMap = []; _catMap = [];
if (_libraryName in ["composition","collection","prefab"]) then {
	//MAKE MAP OF CATEGORIES AND ELEMENTS IN LIBRARY
	{
		_catMap pushBack (_x select 0);
		_index = _forEachIndex;
		{
			_elemMap pushBack (_x select 0);
			_elemAddress pushBack _index;
		} forEach (_x select 1);
	} forEach _library;
	
	//IF ADD COLLISION OPTION, RENAME ALL ELEMENTS IN IMPORT BEFORE IMPORTING
	_namesToChange = [];
	if (_collision == 1) then {
		{
			{
				if ((_x select 0) in _elemMap) then {
					_namesToChange pushBack (_x select 0);
				};
			} forEach (_x select 1);
		} forEach _import;
		{
			_nameIsGood = false;
			_i = 0;
			_newName = "";
			while {!_nameIsGood} do {
				_i = _i + 1;
				_newName = format ["%1_%2",_x,_i];
				if (!(_newName in _elemMap)) then {_nameIsGood = true};
			};
			[_import, _x, _newName] call CT_fnc_replaceDeep;
		} forEach _namesToChange;
	};
	
	//PERFORM IMPORTING TO LIBRARY
	{
		_catName = _x select 0;
		{
			_catIndex = _catMap find _catName;
			_elemIndex = _elemMap find (_x select 0);
			
			if ((_catIndex == -1) AND (_elemIndex == -1)) then { //NO ELEMENT, NO CATEGORY
				_library pushBack [_catName, [_x]]; _catMap pushBack _catName;
			};
			if ((_catIndex != -1) AND (_elemIndex != -1)) then { //ELEMENT AND CATEGORY FOUND
				if (_collision == 0) then {
					((_library select _catIndex) select 1) set [_elemIndex, _x];
				};
			};
			if ((_catIndex != -1) AND (_elemIndex == -1)) then { //NO ELEMENT, CATEGORY FOUND
				((_library select _catIndex) select 1) pushBack _x;
			};
			if ((_catIndex == -1) AND (_elemIndex != -1)) then { //NO CATEGORY, ELEMENT FOUND
				if (_collision == 0) then {
					((_library select (_elemAddress select _elemIndex)) select 1) set [_elemIndex, _x];
				};
			};
		} forEach (_x select 1);
	} forEach _import;
};