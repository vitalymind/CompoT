/* 
   File: fn_buildPivot.sqf 
   Function: CT_fnc_buildPivot 
   Folder: BuildTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_pivot","_pos","_name","_built"];
if (CT_var_cursorTool != "buildTool") exitWith {};
_pivot = CT_var_mainPivot;
if SOMETHING_SELECTED then {
	if (SEL_LIB == "pivot") then {
		_pivot = FIRST_SELECTION;
	};
};
_pos = getPosATL CT_var_cursor;
_pos set [2,0];
_name = call CT_fnc_makeName;
[_name] call CT_fnc_addName;
_built = ["normal","composition",["asParent", [_name,5,[]]],_pos,CT_var_buildToolAngle,_pivot,"random"] call CT_fnc_build;
[_built] call CT_fnc_saveElement;
[_pivot] call CT_fnc_saveElement;
[_pivot] call CT_fnc_cloneComposition;
["single","default",_built] call CT_fnc_cursorSelect;