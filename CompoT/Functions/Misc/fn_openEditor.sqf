/* 
   File: fn_openEditor.sqf 
   Function: CT_fnc_openEditor 
   Folder: Misc 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

(findDisplay 46) displayRemoveEventHandler ["KeyDown", CT_var_hookEH];
CT_var_cam = 'camera' camCreate [(getPos player) select 0, (getPos player) select 1, ((getPos player) select 2) + 2];
CT_var_cam cameraEffect ["internal","back"];
CT_var_cam setDir (getDir player);
CT_var_camIsMoving = false;
CT_var_camIsRotating = false;
player allowDamage false;
player enableSimulation false;
showCinemaBorder false;
cameraEffectEnableHUD true;
call CT_fnc_installAllEHs;
"buildTool" call CT_fnc_cursorChangeTool; "buildTool" call CT_fnc_cursorChangeTool;
"open" call CT_fnc_infoGUI;
"open" call CT_fnc_controlsGUI;