/* 
   File: fn_initMouseCursor.sqf 
   Function: CT_fnc_initMouseCursor 
   Folder: MouseCursor 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;

if (CT_var_mouseCursorActive) exitWith {
	CT_var_mouseCursorActive = false;
	(findDisplay 25252) closeDisplay 0;
	CT_var_mousePos = [0.5,0.5];
};

private ["_dialog","_screen"];
createDialog "mouse_cursor";
CT_var_mouseCursorActive = true;

_dialog = findDisplay 25252;
_dialog displayAddEventHandler ["unload", "CT_var_mousePos = [0.5,0.5]; CT_var_mouseCursorActive = false;"];
_dialog displayAddEventHandler ["keyDown", "_this call CT_fnc_handleKeyDown"];
_dialog displayAddEventHandler ["keyUp", "_this call CT_fnc_handleKeyUp"];
_screen = _dialog displayCtrl 100;
_screen ctrlAddEventHandler ["mouseMoving", "CT_var_mousePos set [0, (_this select 1)]; CT_var_mousePos set [1, (_this select 2)];"];
_screen ctrlAddEventHandler ["mouseZChanged", "_this call CT_fnc_handleMouseWheel"];
ctrlEnable [100, true];
CT_var_mousePos = [0.5,0.5];