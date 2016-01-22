/* 
   File: fn_PrL_fillCategories.sqf 
   Function: CT_fnc_PrL_fillCategories 
   Folder: PrefabLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_categoryList","_prefabList","_contentList","_index"];
_dialog = findDisplay 25258;
_categoryList = _dialog displayCtrl 250;
_prefabList = _dialog displayCtrl 251;
_contentList = _dialog displayCtrl 252;
lbClear _categoryList;
lbClear _prefabList;
lbClear _contentList;
{
	_name = _x select 0;
	_data = _x select 1;
	_index = _categoryList lbAdd _name;
	_categoryList lbSetData [_index, str _data];
} forEach CT_var_prefabs;
call CT_fnc_PrL_fillPrefabs;
