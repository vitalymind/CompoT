/* 
   File: fn_getBuildable.sqf 
   Function: CT_fnc_getBuildable 
   Folder: BuildTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_libraryName","_categoryIndex","_elementIndex","_task","_return","_library"];
_libraryName = _this select 0;
_categoryIndex = _this select 1;
_elementIndex = _this select 2;
_task = [_this, 3, "default", [""]] call BIS_fnc_param;
_return = []; _element = [];

_library = []; _library = switch (_libraryName) do {
	case "object": {CT_var_objects};
	case "collection": {CT_var_collections};
	case "composition": {CT_var_compositions};
	case "prefab": {CT_var_prefabs};
	default {[]};
};
if (isNIl "_library") exitWith {[]};
if (typeName _library != "ARRAY") exitWith {[]};
if (count _library == 0) exitWith {[]};

_categoryIndex = _categoryIndex max 0 min ((count _library) - 1);
_elementIndex = _elementIndex max 0 min ((count ((_library select _categoryIndex) select 1)) - 1);
if (_elementIndex == -1) then {_elementIndex = 0};

switch true do {
	case (_task == "default"): {
		private ["_element","_categoryData"];
		_categoryData = ((_library select _categoryIndex) select 1);
		if (count _categoryData == 0) exitWith {};
		_element = _categoryData select _elementIndex;
		_return = [_categoryIndex, _elementIndex, _element];
	};
	case (_task in ["nextElem","prevElem"]): {
		private ["_count","_newElementIndex","_element","_categoryData"];
		_categoryData = ((_library select _categoryIndex) select 1);
		_count = count _categoryData;
		if (_count == 0) exitWith {};
		if ((_libraryName == "composition") AND (((_library select _categoryIndex) select 0) == "temporary")) exitWith {};
		_newElementIndex = switch (_task) do {case "nextElem": {_elementIndex + 1}; case "prevElem": {_elementIndex - 1};};
		_newElementIndex = _newElementIndex max 0 min (_count - 1);
		_element = _categoryData select _newElementIndex;
		_return = [_categoryIndex, _newElementIndex, _element];
	};
	case (_task in ["nextCat","prevCat"]): {
		private ["_count","_newCategoryIndex","_element","_exit"];
		_count = count _library;
		_newCategoryIndex = switch (_task) do {case "nextCat": {_categoryIndex + 1}; case "prevCat": {_categoryIndex - 1};};
		_newCategoryIndex = _newCategoryIndex max 0 min (_count - 1);
		_exit = false;
		if ((_libraryName == "composition") AND (((_library select _newCategoryIndex) select 0) == "temporary")) then {
			if (_task == "nextCat") then {_newCategoryIndex = _newCategoryIndex + 1};
			if (_task == "prevCat") then {_newCategoryIndex = _newCategoryIndex - 1};
			if (_newCategoryIndex > (_count -1)) then {_exit = true};
			if (_newCategoryIndex < 0) then {_exit = true};
		};
		if (_exit) exitWith {};
		if (count ((_library select _newCategoryIndex) select 1) == 0) exitWith {
			_return = [_newCategoryIndex, 0, []];
		};
		_element = ((_library select _newCategoryIndex) select 1) select 0;
		_return = [_newCategoryIndex, 0, _element];
		CT_var_OS_scrollPos = 0;
	};
};
_return;