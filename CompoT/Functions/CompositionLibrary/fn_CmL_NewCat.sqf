/* 
   File: fn_CmL_NewCat.sqf 
   Function: CT_fnc_CmL_NewCat 
   Folder: CompositionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_text","_newcatEdit","_allCategories","_categoriesList"];
_dialog = findDisplay 25256;
_newcatEdit = _dialog displayCtrl 401;
_categoriesList = _dialog displayCtrl 106;
_text = ctrlText _newcatEdit;
if (_text == "") exitWith {};
_allCategories = [];
{
	_allCategories pushBack (_x select 0);
} forEach CT_var_compositions;
if (_text in _allCategories) exitWith {};
CT_var_compositions pushBack [_text, []];
call CT_fnc_CmL_fillCategories;
_categoriesList lbSetCurSel (lbSize _categoriesList);