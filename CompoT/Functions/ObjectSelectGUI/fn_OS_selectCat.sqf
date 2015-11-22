/* 
   File: fn_OS_selectCat.sqf 
   Function: CT_fnc_OS_selectCat
   Folder: ObjectSelectGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_libraryName","_categoryIndex","_elementIndex","_task","_searhResult","_newCategoryIndex","_newElementIndex","_index"];
_libraryName = "object";
_categoryIndex = _this;
_elementIndex = 0;
_task = "default";
_searhResult = [_libraryName,_categoryIndex,_elementIndex,_task] call CT_fnc_getBuildable;
if (count _searhResult == 0) exitWith {};
_newCategoryIndex = _searhResult select 0;
_newElementIndex = _searhResult select 1;
_index = switch (_libraryName) do {case "object": {1}; case "composition": {2}; case "collection": {3}; case "prefab": {4};default {-1};};
if (_index == -1) exitWith {};
CT_var_buildMode set [0, [_libraryName,_newCategoryIndex,_newElementIndex]];
CT_var_buildMode set [_index, [_newCategoryIndex,_newElementIndex]];

[true] call CT_fnc_OS_groupBy;