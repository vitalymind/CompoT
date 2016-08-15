/* 
   File: fn_handleMouseButtonDown.sqf 
   Function: CT_fnc_handleMouseButtonDown 
   Folder: KeyboardMouseHandling 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_button","_shift","_ctrl","_alt"];

if (CT_var_openedGUI) exitWith {false};

_button = _this select 1;
_shift = _this select 4;
_ctrl = _this select 5;
_alt = _this select 6;

switch (CT_var_cursorTool) do {
	case "buildTool": {
		if (_button == DIK_LMB) then {
			if (!_shift AND !_ctrl AND !_alt) then {
				[DIK_LMB,"default"] call CT_fnc_handleBuildToolMouseButton;
			};
			if (_shift AND !_ctrl AND !_alt) then {
				[DIK_LMB,"clone"] call CT_fnc_handleBuildToolMouseButton;
			};
			if (!_shift AND _ctrl AND !_alt) then {
				[DIK_LMB,"multy"] call CT_fnc_handleBuildToolMouseButton;
			};
		};
		if (_button == DIK_RMB) then {
			if (_shift AND !_ctrl AND !_alt) then {
				"open" call CT_fnc_buildToolGUI;
			};
		};
	};
	case "selectTool": {
		if (_button == DIK_LMB) then {
			if (!CT_var_mouseCursorActive) then {
				if (!_shift AND !_ctrl AND !_alt) then {["single","default"] call CT_fnc_cursorSelect};
				if (_shift AND !_ctrl AND !_alt) then {["multi","default"] call CT_fnc_cursorSelect};
				if (!_shift AND _ctrl AND !_alt) then {["single","pivot"] call CT_fnc_cursorSelect};
			};
		};
		if (_button == DIK_RMB) then {
			if (!_shift AND !_ctrl AND !_alt) then {["grab", "mass"] call CT_fnc_cursorGrab};
			if (_shift AND !_ctrl AND !_alt) then {["grab", "multi"] call CT_fnc_cursorGrab};
			if (_shift AND _ctrl AND !_alt) then {["grab", "single"] call CT_fnc_cursorGrab};
			if (!_shift AND !_ctrl AND _alt) then {["grabSpecial"] call CT_fnc_cursorGrab};
			if (!_shift AND _ctrl AND !_alt) then {["grab", "mass", true] call CT_fnc_cursorGrab};
		};
	};
	case "removeTool": {
		if (_button == DIK_LMB) then {
			if (!CT_var_mouseCursorActive) then {
				if (!_shift AND !_ctrl AND !_alt) then {["none"] call CT_fnc_hideObject};
				if (_shift AND !_ctrl AND !_alt) then {["shift"] call CT_fnc_hideObject};
				if (!_shift AND _ctrl AND !_alt) then {["ctrl"] call CT_fnc_hideObject};
			};
		};
	};
};

true;