/* 
   File: fn_reDrawSelection.sqf 
   Function: CT_fnc_reDrawSelection 
   Folder: Cursor 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_id","_object"];
if NOTHING_SELECTED exitWith {};
["clean"] call CT_fnc_drawSelection;
ct_var_selDrawIcons deleteRange [0, count ct_var_selDrawIcons];
{
	_object = _x select 0;
	_id = [SEL_LIB,_object] call CT_fnc_drawSelection;
	_x set [1, _id];
	
	if (SEL_LIB == "pivot") then {
		{
			ct_var_selDrawIcons pushBack _x;
		} forEach (_object getVariable "childObjects");
	} else {
		ct_var_selDrawIcons pushBack _object;
	};
} forEach SELECTION;
