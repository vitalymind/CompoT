/* 
   File: fn_handleMouseButtonUp.sqf 
   Function: CT_fnc_handleMouseButtonUp 
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
	};
	case "selectTool": {
	};
};

true;