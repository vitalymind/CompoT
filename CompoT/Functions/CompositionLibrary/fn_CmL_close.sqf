/* 
   File: fn_CmL_close.sqf 
   Function: CT_fnc_CmL_close 
   Folder: CompositionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_pitch","_bank"];
'open' call CT_fnc_infoGUI; 
'open' call CT_fnc_controlsGUI; 
CT_var_openedGUI = false;
call CT_fnc_clearPreview;
_pitch = (CT_var_CmL_camPos select 2) select 0;
_bank = (CT_var_CmL_camPos select 2) select 1;
CT_var_cam setDir (CT_var_CmL_camPos select 1);
[CT_var_cam, _pitch, _bank] call BIS_fnc_setPitchBank;
CT_var_cam setPosATL (CT_var_CmL_camPos select 0);