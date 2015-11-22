/* 
   File: fn_PrL_NewPref.sqf 
   Function: CT_fnc_PrL_NewPref 
   Folder: PrefabLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_text","_newPrefEdit","_allPrefabs","_categoryList","_index","_name","_pointer","_prefabsList"];
_dialog = findDisplay 25258;
_newPrefEdit = _dialog displayCtrl 401;
_categoryList = _dialog displayCtrl 250;
_prefabsList = _dialog displayCtrl 251;
_index = lbCurSel _categoryList;
if (_index == -1) exitWith {};
_name = _categoryList lbText _index;
_text = ctrlText _newPrefEdit;
if (_text == "") exitWith {};
_allPrefabs = []; _pointer = [];
{
	if ((_x select 0) == _name) then {_pointer = (_x select 1)};
	{
		_allPrefabs pushBack (_x select 0);
	} forEach (_x select 1);
} forEach CT_var_prefabs;
if (_text in _allPrefabs) exitWith {};
_pointer pushBack [_text, []];
call CT_fnc_PrL_fillCategories;
_prefabsList lbSetCurSel (lbSize _prefabsList);