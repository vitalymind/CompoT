/* 
   File: fn_MC_init.sqf 
   Function: CT_fnc_MC_init
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
	CT_var_forceCamRotate = false;
};

private ["_dialog","_screen"];
createDialog "ct_mouseCursor";
CT_var_mouseCursorActive = true;

_dialog = findDisplay 25252;
_dialog displayAddEventHandler ["unload", "CT_var_mousePos = [0.5,0.5]; CT_var_mouseCursorActive = false;CT_var_forceCamRotate = false;"];
_dialog displayAddEventHandler ["keyDown", "_this call CT_fnc_handleKeyDown"];
_dialog displayAddEventHandler ["keyUp", "_this call CT_fnc_handleKeyUp"];
_screen = _dialog displayCtrl 100;
_screen ctrlAddEventHandler ["mouseMoving", "_this call CT_fnc_MC_handleMouseMove"];
_screen ctrlAddEventHandler ["mouseZChanged", "_this call CT_fnc_handleMouseWheel"];
_screen ctrlAddEventHandler ["MouseButtonDown", "_this call CT_fnc_MC_handleMouseButtonDown"];
_screen ctrlAddEventHandler ["MouseButtonUp", "_this call CT_fnc_MC_handleMouseButtonUp"];
ctrlEnable [100, true];
CT_var_mousePos = [0.5,0.5];






