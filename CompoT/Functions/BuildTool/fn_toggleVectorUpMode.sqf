/* 
   File: fn_toggleVectorUpMode.sqf 
   Function: CT_fnc_toggleVectorUpMode
   Folder: BuildTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

ct_var_vectorUpMode = ct_var_vectorUpMode + 1;
if (ct_var_vectorUpMode == 2) then {ct_var_vectorUpMode = 0};

if (ct_var_vectorUpMode == 0) then {["Reset vectorUp mode"] call CT_fnc_notification};
if (ct_var_vectorUpMode == 1) then {["Freeze vectorUp mode"] call CT_fnc_notification};