/* 
   File: fn_getRelPos.sqf 
   Function: CT_fnc_getRelPos 
   Folder: BuildTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_parentPos", "_childRelPos","_parentDir", "_childPos","_relAngle","_result", "_distance","_height"];
_childRelPos = _this select 0;
_parentPos = _this select 1;
_height = _parentPos select 2;
_parentPos set [2,0];
_parentDir = _this select 2;
_result = [0,0,0];
_childPos = [
	((_parentPos select 0) + (_childRelPos select 0)),
	((_parentPos select 1) + (_childRelPos select 1)),
	0
];
_distance = _parentPos distance2D _childPos;
_relAngle = (((_childPos select 0) - (_parentPos select 0)) atan2 ((_childPos select 1) - (_parentPos select 1)));
_result = [
	(_parentPos select 0) + ((sin (_parentDir + _relAngle)) * _distance),
	(_parentPos select 1) + ((cos (_parentDir + _relAngle)) * _distance),
	_height + (_childRelPos select 2)
];
_result;