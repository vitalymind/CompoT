/* 
   File: fn_camRotate.sqf 
   Function: CT_fnc_camRotate 
   Folder: Camera 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_horizontal", "_vertical","_pitchBank","_fps"];
_fps = diag_fps;
_horizontal = ((_this select 1) / (_fps / 60));
_vertical = ((_this select 2) / (_fps / 60));
_pitchBank = CT_var_cam call CT_fnc_getPB;
CT_var_cam setDir ((getDir CT_var_cam) + _horizontal);
[CT_var_cam, (_pitchBank select 0) + (_vertical*-1), 0] call CT_fnc_setPB;