/* 
   File: fn_closeEditor.sqf 
   Function: CT_fnc_closeEditor 
   Folder: Misc 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_pos"];
"close" call CT_fnc_infoGUI;
"close" call CT_fnc_controlsGUI;
_pos = getPosATL CT_var_cam;
player setDir (getDir CT_var_cam);
player setPosATL _pos;
player allowDamage false;
player enableSimulation true;
call CT_fnc_disableAllEHs;
CT_var_cam cameraEffect ["terminate","back"];
CT_var_hookEH = (findDisplay 46) displayAddEventHandler ["keyDown", {
	_handled = false;
	if ((_this select 1) == DIK_F11) then {_handled = true; call CT_fnc_openEditor;};
	_handled;
}];