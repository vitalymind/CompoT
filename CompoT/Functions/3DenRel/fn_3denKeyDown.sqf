/* 
   File: fn_3denKeyDown.sqf 
   Function: CT_fnc_3denKeyDown
   Folder: 3DenRel 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 

*/ 
#include "defines.hpp"

if (!(uinamespace getVariable ["CT_var_gui_editorLoaded", false])) exitWith {};
private ["_handled", "_dikCode", "_shift", "_ctrlKey", "_alt"];

_dikCode = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_handled = false;

["shift", _shift] call CT_fnc_toggleKeys;
["ctrl", _ctrlKey] call CT_fnc_toggleKeys;
["alt", _alt] call CT_fnc_toggleKeys;

if (_shift AND !_ctrlKey AND !_alt) then {
	if (_dikCode == DIK_SPACE) then {
		_handled = true;
		if (!(uinamespace getVariable ["CT_var_gui_OSMopened", false])) then {
			call CT_fnc_OS_openGUI;
		} else {
			call CT_fnc_OS_closeGUI;
		};
	};
	if (_dikCode == DIK_ESC) then {
		if (uinamespace getVariable ["CT_var_gui_OSMopened", false]) then {
			_handled = true;
			call CT_fnc_OS_closeGUI;
		};
	};
};
if (!_shift AND !_ctrlKey AND !_alt) then {
	if (uinamespace getVariable ["CT_var_gui_OSMopened", false]) then {
		if (_key == OS_FAST_FORWARD) then {_handled = true;[32,-1] call CT_fnc_OS_scroll;};
		if (_key == OS_FAST_BACKWARD) then {_handled = true;[32,1] call CT_fnc_OS_scroll;};
		if ((_key == DIK_ARROW_UP) AND !_shift) then {_handled = true;[8,1] call CT_fnc_OS_scroll;};
		if ((_key == DIK_ARROW_UP) AND _shift) then {_handled = true;[32,1] call CT_fnc_OS_scroll;};
		if ((_key == DIK_ARROW_DOWN) AND !_shift) then {_handled = true;[8,-1] call CT_fnc_OS_scroll;};
		if ((_key == DIK_ARROW_DOWN) AND _shift) then {_handled = true;[32,-1] call CT_fnc_OS_scroll;};
	};
};
_handled;