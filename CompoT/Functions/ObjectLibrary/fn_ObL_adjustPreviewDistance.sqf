/* 
   File: fn_ObL_adjustPreviewDistance.sqf 
   Function: CT_fnc_ObL_adjustPreviewDistance 
   Folder: ObjectLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_direction","_shift","_newDis"];
_direction = _this select 1;
_shift = CT_var_holdenKeys select 7;
if (_shift) then {
	_newDis = CT_var_ObL_previewDistance + (-2 * _direction);
	_newDis = _newDis max 0 min 100;
	CT_var_ObL_previewDistance = _newDis;
};
CT_var_ObL_activeCtrl call CT_fnc_ObL_showInfo;