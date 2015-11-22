/* 
   File: fn_CiL_close.sqf 
   Function: CT_fnc_CiL_close 
   Folder: CollectionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

CT_var_openedGUI = false;
(findDisplay 25257) closeDisplay 0;
"open" call CT_fnc_infoGUI;
"open" call CT_fnc_controlsGUI;
CT_var_CiL_objects = [[],[]];