/* 
   File: fn_changeBuildLib.sqf 
   Function: CT_fnc_changeBuildLib 
   Folder: BuildTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_newLibrary","_index","_categoryIndex","_elementIndex","_searhResult","_element","_pos"];
if (CT_var_cursorTool != "buildTool") exitWith {};
_newLibrary = _this select 0;
_index = switch (_newLibrary) do {case "object": {1}; case "composition": {2}; case "collection": {3}; case "prefab": {4};default {-1};};
if (_index == -1) exitWith {};

_categoryIndex = (CT_var_buildMode select _index) select 0;
_elementIndex = (CT_var_buildMode select _index) select 1;
CT_var_buildMode set [0, [_newLibrary,_categoryIndex,_elementIndex]];
_searhResult = [_newLibrary,_categoryIndex,_elementIndex] call CT_fnc_getBuildable;
call CT_fnc_clearPreview;
if (count _searhResult == 0) exitWith {};
_element = _searhResult select 2;
[_element, _newLibrary] call CT_fnc_makePreview;