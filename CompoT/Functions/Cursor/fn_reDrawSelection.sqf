/* 
   File: fn_reDrawSelection.sqf 
   Function: CT_fnc_reDrawSelection 
   Folder: Cursor 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_id"];
if NOTHING_SELECTED exitWith {};
["clean"] call CT_fnc_drawSelection;
{
	_x set [1, []];
	_id = [SEL_LIB,(_x select 0)] call CT_fnc_drawSelection;
	_x set [1, _id];
} forEach SELECTION;