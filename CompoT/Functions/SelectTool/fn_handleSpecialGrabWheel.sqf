/* 
   File: fn_handleSpecialGrabWheel.sqf 
   Function: CT_fnc_handleSpecialGrabWheel 
   Folder: SelectTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_direction","_object","_dirOffset","_distanceOffset","_heightOffset","_shift","_ctrl","_alt"];
_direction = _this;
_handled = false;
_shift = CT_var_holdenKeys select 6;
_ctrl = CT_var_holdenKeys select 7;
_alt = CT_var_holdenKeys select 8;
if SOMETHING_SELECTED then {
	if (SEL_STATE == "busySpecial") then {
		_handled = true;
		_object = FIRST_SELECTION;
		_data = _object getVariable ["specialGrab", [0,0,0]];
		_dirOffset = _data select 0;
		_distanceOffset = _data select 1;
		_heightOffset = _data select 2;
		if (!_shift AND _ctrl AND !_alt) then {
			_dirOffset = _dirOffset + (CT_var_rotateAngle * _direction);
		};
		if (_shift AND !_ctrl AND !_alt) then {
			_distanceOffset = [_distanceOffset, _direction] call CT_fnc_getSpecialGrabDistance;
		};
		if (!_shift AND !_ctrl AND _alt) then {
			_heightOffset = _heightOffset + (CT_var_heightChange * _direction);
		};
		if (!_shift AND !_ctrl AND !_alt) then {
			_direction call CT_fnc_adjustCamSpeed
		};
		_object setVariable ["specialGrab", [_dirOffset, _distanceOffset, _heightOffset]];
	};
};
_handled;