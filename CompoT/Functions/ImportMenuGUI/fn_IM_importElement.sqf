/* 
   File: fn_IM_importElement.sqf 
   Function: CT_fnc_IM_importElement 
   Folder: ImportMenuGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_libraryName","_collision","_import","_library","_libMap","_categoryPointer"];
_libraryName = _this select 0;
_collision = _this select 1;
_import = _this select 2;
_libMap = _this select 3;
_categoryPointer = _this select 4;

_library = switch (_libraryName) do {
	case "object": {CT_var_objects};
	case "composition": {CT_var_compositions};
	case "collection": {CT_var_collections};
	case "prefab": {CT_var_prefabs};
	default {[]};
};

//OBJECTS SIMPLY ADDED TO TARGET CATEGORY
if (_libraryName == "object") then {
	(_categoryPointer select 1) pushback _import;
};

//OTHER ELEMENTS CHECKED ACCORDING TO COLLISION OPTIONS
if (_libraryName in ["composition","collection","prefab"]) then {
	_elementName = _import select 0;
	
	//LETS SEE IF ELEMENT EXIST IN LIBRARY ALREADY
	_index = _libMap find _elementName;
	
	//OVERWRITE
	if (_collision == 0) then {
		if (_index != -1) then {
			_catIndex = (_libMap select (_index + 1)) select 0;
			_elemIndex = (_libMap select (_index + 1)) select 1;
			((_library select _catIndex) select 1) set [_elemIndex, _import];
		} else {
			(_categoryPointer select 1) pushBack _import;
		};
	};
	
	//ADD
	if (_collision == 1) then {
		if (_index != -1) then {
			_isNameGood = false; _i = 0; _newName = "";
			while {!_isNameGood} do {
				_i = _i + 1;
				_newName = format ["%1_%2",_elementName,_i];
				if (!(_newName in _libMap)) then {_isNameGood = true};
			};
			
			_import set [0, _newName];
			_elemIndex = (_categoryPointer select 1) pushBack _import;
			_catIndex = _library find _categoryPointer;
			
			_libMap pushBack [_newName, [_catIndex,_elemIndex]];
		} else {
			(_categoryPointer select 1) pushBack _import;
		};
	};
	//SKIP
	if (_collision == 2) then {
		if (_index == -1) then {
			(_categoryPointer select 1) pushBack _import;
		};
	};
};











