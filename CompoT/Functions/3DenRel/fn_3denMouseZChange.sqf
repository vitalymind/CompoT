/* 
   File: fn_3denMouseZChange.sqf 
   Function: CT_fnc_3denMouseZChange
   Folder: 3DenRel 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 

*/ 
#include "defines.hpp"
	
if (!(uinamespace getVariable ["CT_var_gui_editorLoaded", false])) exitWith {};

private ["_direction","_shift","_ctrl","_alt","_handled"];

_shift = CT_var_holdenKeys select 7;
_ctrl = CT_var_holdenKeys select 6;
_alt = CT_var_holdenKeys select 8;
_handled = false;

_direction = _this select 1;
if (_direction > 0) then {_direction = 1};
if (_direction < 0) then {_direction = -1};

if (!_shift AND !_ctrl) then {
	if (uinamespace getVariable ["CT_var_gui_OSMopened", false]) then {
		_handled = true;
		[8,_direction] call CT_fnc_OS_scroll;
	};
};

if (_shift AND !_ctrl) then {
	if (uinamespace getVariable ["CT_var_gui_OSMopened", false]) then {
		_handled = true;
		[32,_direction] call CT_fnc_OS_scroll;
	};
};
_handled;