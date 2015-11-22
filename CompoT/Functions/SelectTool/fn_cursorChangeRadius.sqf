/* 
   File: fn_cursorChangeRadius.sqf 
   Function: CT_fnc_cursorChangeRadius 
   Folder: SelectTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_direction","_object","_size","_newRadius","_currentRadius","_id"];
_direction = _this;
if SOMETHING_SELECTED then {
	if (SEL_STATE == "empty") then {
		if (SEL_LIB == "pivot") then {
			_object = FIRST_SELECTION;
			_size = _object getVariable "size";
			_newRadius = _size + (CT_var_radiusChange * _direction);
			_newRadius = _newRadius max 0;
			_object setVariable ["size", _newRadius];
			call CT_fnc_reDrawSelection;
			[_object] call CT_fnc_saveElement;
			[_object] call CT_fnc_cloneComposition;
		};
	};
};