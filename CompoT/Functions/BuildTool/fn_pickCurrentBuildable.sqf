/* 
   File: fn_pickCurrentBuildable.sqf 
   Function: CT_fnc_pickCurrentBuildable 
   Folder: BuildTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_library","_categoryIndex","_elementIndex","_searhResult","_element","_pos"];
if (CT_var_cursorTool != "buildTool") exitWith {};
_library = (CT_var_buildMode select 0) select 0;
_categoryIndex = (CT_var_buildMode select 0) select 1;
_elementIndex = (CT_var_buildMode select 0) select 2;
CT_var_buildMode set [0, [_library,_categoryIndex,_elementIndex]];
_searhResult = [_library,_categoryIndex,_elementIndex] call CT_fnc_getBuildable;
if (count _searhResult == 0) exitWith {};
_element = _searhResult select 2;
call CT_fnc_clearPreview;
[_element, _library] call CT_fnc_makePreview;