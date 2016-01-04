/* 
   File: fn_checkMods.sqf 
   Function: CT_fnc_checkMods 
   Folder: Misc 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

if (isClass (configfile >> "CfgPatches" >> "CUP_Worlds")) then {CT_var_mods pushBack "CUP"};
if (isClass (configfile >> "CfgPatches" >> "plp_beachobjects")) then {CT_var_mods pushBack "PLP Beach objects"};
if (isClass (configfile >> "CfgPatches" >> "plp_containers")) then {CT_var_mods pushBack "PLP Containers"};
if (isClass (configfile >> "CfgPatches" >> "mbg_killhouses_a3")) then {CT_var_mods pushBack "MBG Killhouses"};
if (
	isClass (configfile >> "CfgPatches" >> "A3_Bush") OR
	isClass (configfile >> "CfgPatches" >> "A3_Plants") OR
	isClass (configfile >> "CfgPatches" >> "A3_rocks") OR
	isClass (configfile >> "CfgPatches" >> "A3_Trees")
) then {CT_var_mods pushBack "ArmA nature"};