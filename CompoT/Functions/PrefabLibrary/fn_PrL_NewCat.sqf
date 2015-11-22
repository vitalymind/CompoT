/* 
   File: fn_PrL_NewCat.sqf 
   Function: CT_fnc_PrL_NewCat 
   Folder: PrefabLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_categoryList","_dialog","_text","_newcatEdit","_allCategories"];
_dialog = findDisplay 25258;
_newcatEdit = _dialog displayCtrl 400;
_categoryList = _dialog displayCtrl 250;
_text = ctrlText _newcatEdit;
if (_text == "") exitWith {};
_allCategories = [];
{
	_allCategories pushBack (_x select 0);
} forEach CT_var_prefabs;
if (_text in _allCategories) exitWith {};
CT_var_prefabs pushBack [_text, []];
call CT_fnc_PrL_fillCategories;
_categoryList lbSetCurSel (lbSize _categoryList);