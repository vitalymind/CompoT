/* 
   File: fn_CmL_fillList.sqf 
   Function: CT_fnc_CmL_fillList 
   Folder: CompositionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_list","_catCombo","_data","_index"];
_dialog = findDisplay 25256;
_list = controlNull; _catCombo = controlNull;
if (_this == "left") then {
	_list = _dialog displayCtrl 100;
	_catCombo = _dialog displayCtrl 200;
	CT_var_CmL_selection set [0, (lbCurSel _catCombo)];
};
if (_this == "right") then {
	_list = _dialog displayCtrl 101;
	_catCombo = _dialog displayCtrl 201;
	CT_var_CmL_selection set [1, (lbCurSel _catCombo)];
};
lbClear _list;
if ((lbCurSel _catCombo) == -1) exitWith {};
_data = _catCombo lbData (lbCurSel _catCombo);
_data = call compile _data;
if (typename _data != "ARRAY") exitWith {};
{
	_index = _list lbAdd (_x select 0);
	_list lbSetData [_index, str _x];
} forEach _data;