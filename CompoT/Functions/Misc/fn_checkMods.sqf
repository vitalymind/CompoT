/* 
   File: fn_checkMods.sqf 
   Function: CT_fnc_checkMods 
   Folder: Misc 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

if (isClass (configfile >> "CfgPatches" >> "CUP_Worlds")) then {
	CT_var_mods pushBack "CUP";
};