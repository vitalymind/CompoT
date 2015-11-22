/* 
   File: fn_EM_closeGUI.sqf 
   Function: CT_fnc_EM_closeGUI 
   Folder: ExportMenuGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

CT_var_openedGUI = false;
"open" call CT_fnc_infoGUI;
"open" call CT_fnc_controlsGUI;