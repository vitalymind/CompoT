/* 
   File: fn_ObL_addObject.sqf 
   Function: CT_fnc_ObL_addObject 
   Folder: ObjectLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_configTree","_selData","_selCatName","_pointer","_index","_categoryList"];
_dialog = findDisplay 25250;
_categoryList = _dialog displayCtrl 251;
_configTree = _dialog displayCtrl 200;
_pointer = [];

if ((count (tvCurSel _configTree)) == 0) exitWith {};
_selData = _configTree tvData (tvCurSel _configTree);
if (_selData == "") exitWith {};
_selData = call compile _selData;

_index = lbCurSel _categoryList;
if (_index == -1) exitWith {};
_selCatName = _categoryList lbText _index;

{
	if (_selCatName == (_x select 0)) exitWith {
		_pointer = (_x select 1);
	};
} forEach CT_var_objects;
_pointer pushBack _selData;
call CT_fnc_ObL_fillCategories;