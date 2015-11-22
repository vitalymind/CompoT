/* 
   File: fn_CiL_NewCat.sqf 
   Function: CT_fnc_CiL_NewCat 
   Folder: CollectionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_text","_newcatEdit","_allCategories","_categoryList"];
_dialog = findDisplay 25257;
_newcatEdit = _dialog displayCtrl 400;
_categoryList = _dialog displayCtrl 250;
_text = ctrlText _newcatEdit;
if (_text == "") exitWith {};
_allCategories = [];
{
	_allCategories pushBack (_x select 0);
} forEach CT_var_collections;
if (_text in _allCategories) exitWith {};
CT_var_collections pushBack [_text, []];
call CT_fnc_CiL_fillCategories;
_categoryList lbSetCurSel (lbSize _categoryList);