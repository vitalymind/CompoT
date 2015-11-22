/* 
   File: fn_CiL_NewCol.sqf 
   Function: CT_fnc_CiL_NewCol 
   Folder: CollectionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_text","_newColEdit","_allCategories","_categoryList","_index","_name","_pointer","_collectionList"];
_dialog = findDisplay 25257;
_newColEdit = _dialog displayCtrl 406;
_categoryList = _dialog displayCtrl 250;
_collectionList = _dialog displayCtrl 251;
_index = lbCurSel _categoryList;
if (_index == -1) exitWith {};
_name = _categoryList lbText _index;
_text = ctrlText _newColEdit;
if (_text == "") exitWith {};
_allCollections = []; _pointer = [];
{
	if ((_x select 0) == _name) then {_pointer = (_x select 1)};
	{
		_allCollections pushBack (_x select 0);
	} forEach (_x select 1);
} forEach CT_var_collections;
if (_text in _allCollections) exitWith {};
_pointer pushBack [_text, []];
call CT_fnc_CiL_fillCategories;
_collectionList lbSetCurSel (lbSize _collectionList);