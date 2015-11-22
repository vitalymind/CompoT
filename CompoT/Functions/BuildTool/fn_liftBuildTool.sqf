/* 
   File: fn_liftBuildTool.sqf 
   Function: CT_fnc_liftBuildTool 
   Folder: BuildTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_direction","_height","_newHeight"];
_direction = _this select 0;
_height = CT_var_heightChange * _direction;
_height = _height max -200 min 2000;
_newHeight = CT_var_buildToolHeight + _height;
CT_var_buildToolHeight = _newHeight;
if (!CT_var_buildToolEmpty) then {
	call CT_fnc_pickCurrentBuildable;
};