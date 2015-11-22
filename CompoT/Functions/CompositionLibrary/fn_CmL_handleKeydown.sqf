/* 
   File: fn_CmL_handleKeydown.sqf 
   Function: CT_fnc_CmL_handleKeydown 
   Folder: CompositionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_key","_list"];
_key = _this select 1;
_list = CT_var_CmL_selection select 2;
if (_key == DIK_DELETE) then {
	if (_list == "category") then {call CT_fnc_CmL_deleteCat};
	if (_list in ["left","right"]) then {_list call CT_fnc_CmL_deleteCom};
};
if ((_key == DIK_ARROWUP) AND HK_SHIFT) then {
	-1 call CT_fnc_CmL_move;
};
if ((_key == DIK_ARROWDOWN) AND HK_SHIFT) then {
	1 call CT_fnc_CmL_move;
};