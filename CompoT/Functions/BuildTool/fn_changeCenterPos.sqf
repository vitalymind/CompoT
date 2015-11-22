/* 
   File: fn_changeCenterPos.sqf 
   Function: CT_fnc_changeCenterPos 
   Folder: BuildTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_newPos"];
_newPos = _this;
_newPos set [2,0];
"center" setMarkerPosLocal _newPos;
CT_var_mainPivot setDir 0;
CT_var_mainPivot setPosATL _newPos;