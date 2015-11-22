/* 
   File: fn_rotateBuildTool.sqf 
   Function: CT_fnc_rotateBuildTool 
   Folder: BuildTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_direction","_angle","_newAngle"];
_direction = _this select 0;
_angle = CT_var_rotateAngle * _direction;
_angle = _angle max -359 min 359;
_newAngle = CT_var_buildToolAngle + _angle;
if (_newAngle >= 360) then {_newAngle = _newAngle - 360};
if (_newAngle < 0) then {_newAngle = 360 + _newAngle};
CT_var_buildToolAngle = _newAngle;
if (!CT_var_buildToolEmpty) then {
	call CT_fnc_pickCurrentBuildable;
};