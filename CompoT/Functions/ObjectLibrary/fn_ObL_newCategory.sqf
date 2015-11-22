/* 
   File: fn_ObL_newCategory.sqf 
   Function: CT_fnc_ObL_newCategory 
   Folder: ObjectLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_categoryList","_newCatEdit","_index"];
_dialog = findDisplay 25250;
_categoryList = _dialog displayCtrl 251;
_newCatEdit = _dialog displayCtrl 401;

_name = ctrlText _newCatEdit;
if (_name == "") exitWith {};
_sameName = false;
{
	if (_name == _x select 0) exitWith {_sameName = true};
} forEach CT_var_objects;
if (_sameName) exitWith {};

CT_var_objects pushBack [_name, []];
call CT_fnc_ObL_fillCategories;
_categoryList lbSetCurSel (lbSize _categoryList);