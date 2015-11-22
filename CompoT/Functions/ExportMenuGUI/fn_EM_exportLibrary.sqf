/* 
   File: fn_EM_exportLibrary.sqf 
   Function: CT_fnc_EM_exportLibrary 
   Folder: ExportMenuGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_libraryName","_composition","_library","_icludeTemp","_index","_temp","_allNonTempCompositionData","_allNonTempCompositionNames",
"_name","_partNames","_type","_parts"];
_libraryName = _this Select 0;
_icludeTemp = _this Select 1;
_library = switch (_libraryName) do {
	case "object": {CT_var_objects};
	case "composition": {CT_var_compositions};
	case "collection": {CT_var_collections};
	case "prefab": {CT_var_prefabs};
	default {[]};
};
if (_icludeTemp) exitWith {_library};
if (_libraryName != "composition") exitWith {_library};

_composition = + _library;
_index = -1; _temp = [];
_parts = ["parts",[]];
{
	if ((_x select 0) == "temporary") exitWith {_index = _forEachIndex};
} forEach _composition;
if (_index != -1) then {_temp = (_composition deleteAt _index) select 1};

if (count _temp != 0) then {
	_allNonTempCompositionNames = [];
	_allNonTempCompositionData = [];
	{
		{
			_allNonTempCompositionNames pushBack (_x select 0);
			_allNonTempCompositionData append (_x select 2);
		} forEach (_x select 1);
	} forEach _composition;
	_partNames = [];
	{
		_type = _x select 0;
		_name = _x select 1;
		if (_type == "composition") then {
			if (!(_name in _allNonTempCompositionNames)) then {
				if (!(_name in _partNames)) then {
					_partNames pushBack _name;
				};
			};
		};
	} forEach _allNonTempCompositionData;
	
	{
		_name = _x select 0;
		if (_name in _partNames) then {
			(_parts select 1) pushBack _x;
		};
	} forEach _temp;
	_composition pushBack _parts;
};
_composition;