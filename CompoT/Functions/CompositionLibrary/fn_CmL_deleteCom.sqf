/* 
   File: fn_CmL_deleteCom.sqf 
   Function: CT_fnc_CmL_deleteCom 
   Folder: CompositionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_list","_name","_index","_pointer"];
_dialog = findDisplay 25256;
_list = controlNull;
if (_this == "left") then {
	_list = _dialog displayCtrl 100;
};
if (_this == "right") then {
	_list = _dialog displayCtrl 101;
};
_name = _list lbText (lbCurSel _list);
_index = -1;
_pointer = [];
{
	{
		if ((_x select 0) == _name) exitWith {_index = _forEachindex};
	} forEach (_x select 1);
	if (_index != -1) exitWith {_pointer = _x};
} forEach CT_var_compositions;

if (_index != -1) then {
	(_pointer select 1) deleteAt _index;
	call CT_fnc_CmL_fillCategories;
};