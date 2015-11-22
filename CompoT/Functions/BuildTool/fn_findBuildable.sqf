/* 
   File: fn_findBuildable.sqf 
   Function: CT_fnc_findBuildable 
   Folder: BuildTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_searchType","_return"];
_searchType = _this select 0;
_return = [];
switch (_searchType) do {
	case "normal": {
		private ["_libraryName","_elementName","_library","_tempCatData","_done"];
		_library = [];
		_done = false;
		
		_elementName = _this select 1;
		_libraryName = _this select 2;
		_library = switch (_libraryName) do {
			case "object": {CT_var_objects};
			case "collection": {CT_var_collections};
			case "composition": {CT_var_compositions};
			case "prefab": {CT_var_prefabs};
			default {[]};
		};
		if (isNIl "_library") exitWith {};
		if (typeName _library != "ARRAY") exitWith {};
		if (count _library == 0) exitWith {};
		
		{
			_tempCatData = _x select 1;
			{
				if (_elementName == (_x select 0)) exitWith {
					_return = _x;
					_done = true;
				};
			} forEach _tempCatData;
			if (_done) exitWith {};
		} forEach _library;
	};
};
_return;