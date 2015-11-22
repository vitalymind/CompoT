/* 
   File: fn_ObL_deleteObject.sqf 
   Function: CT_fnc_ObL_deleteObject 
   Folder: ObjectLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_categoryList","_categoryCombo","_configTree","_selData","_selCatName","_array","_index","_category"];
_dialog = findDisplay 25250;
_categoryList = _dialog displayCtrl 250;
_categoryCombo = _dialog displayCtrl 302;
_configTree = _dialog displayCtrl 200;

_index = lbCurSel _categoryList;
if (_index == -1) exitWith {["No item selected"] call CT_fnc_errorMsg};
_selData = _categoryList lbData _index;
_selData = call compile _selData;
_selCatName = _categoryCombo lbText (lbCurSel _categoryCombo);

{
	if (_selCatName == _x select 0) exitWith {
		_category = _x;
		_array = _category select 1;
		_array set [_index, "delMe"];
		_array = _array - ["delMe"];
		_category set [1, _array];
		CT_var_objects set [_forEachIndex, _category];
		_array = _categoryCombo lbData (lbCurSel _categoryCombo);
		_array = call compile _array;
		_array set [_index, "delMe"];
		_array = _array - ["delMe"];
		_categoryCombo lbSetData [(lbCurSel _categoryCombo), str(_array)];
	};
} forEach CT_var_objects;
_categoryCombo lbSetCurSel (lbCurSel _categoryCombo);