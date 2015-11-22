/* 
   File: fn_cursorLift.sqf 
   Function: CT_fnc_cursorLift 
   Folder: SelectTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_direction","_mode","_object","_pivot","_pivots"];
_direction = _this select 0;
_mode = _this select 1;
_pivots = [];
if NOTHING_SELECTED exitWith {};
{
	_object = _x select 0;
	[_mode, SEL_LIB, _object, (CT_var_heightChange * _direction)] call CT_fnc_liftObject;
	if (SEL_LIB == "pivot") then {
		[_object] call CT_fnc_saveElement;
		[_object] call CT_fnc_cloneComposition;
	};
	if (SEL_LIB == "object") then {
		_pivot = _object getVariable "pivot";
		if (!(_pivot in _pivots)) then {_pivots pushBack _pivot};
	};
} forEach SELECTION;
if (SEL_LIB == "object") then {
	{[_x] call CT_fnc_saveElement} forEach _pivots;
	_pivots call CT_fnc_cloneComposition;
};
call CT_fnc_reDrawSelection;