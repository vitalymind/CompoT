/* 
   File: fn_handleBuildToolMouseWheel.sqf 
   Function: CT_fnc_handleBuildToolMouseWheel 
   Folder: BuildTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_direction", "_case","_libraryName","_element","_task","_index",
"_categoryIndex","_elementIndex","_pos","_newCategoryIndex","_newElementIndex"];
_direction = _this select 0;
_case = _this select 1;
_task = "";

_libraryName = (CT_var_buildMode select 0) select 0;
_categoryIndex = (CT_var_buildMode select 0) select 1;
_elementIndex = (CT_var_buildMode select 0) select 2;

//Temp solution to block element/category switching vai mousewheel for objects. Except ObjectSelection GUI Whole system of element selection due to change later on
if ((!CT_var_openedGUI) AND (((CT_var_buildMode select 0) select 0) == "object")) exitWith {};

switch (_case) do {
	case "element": {_task = if (_direction == 1) then {"nextElem"} else {"prevElem"}};
	case "category": {_task = if (_direction == 1) then {"nextCat"} else {"prevCat"}};
};

_searhResult = [_libraryName,_categoryIndex,_elementIndex,_task] call CT_fnc_getBuildable;
if (count _searhResult == 0) exitWith {};
_newCategoryIndex = _searhResult select 0;
_newElementIndex = _searhResult select 1;
_element = _searhResult select 2;
_index = switch (_libraryName) do {case "object": {1}; case "composition": {2}; case "collection": {3}; case "prefab": {4};default {-1};};
if (_index == -1) exitWith {};
CT_var_buildMode set [0, [_libraryName,_newCategoryIndex,_newElementIndex]];
CT_var_buildMode set [_index, [_newCategoryIndex,_newElementIndex]];
call CT_fnc_clearPreview;
if (count _element != 0) then {
	[_element, _libraryName] call CT_fnc_makePreview;
};