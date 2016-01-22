/* 
   File: fn_CiL_fillCollections.sqf 
   Function: CT_fnc_CiL_fillCollections 
   Folder: CollectionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_collectionList","_categoryList","_contentList","_index","_data","_newcatEdit"];
_dialog = findDisplay 25257;
_categoryList = _dialog displayCtrl 250;
_collectionList = _dialog displayCtrl 251;
_contentList = _dialog displayCtrl 252;
_newcatEdit = _dialog displayCtrl 400;
lbClear _collectionList;
lbClear _contentList;
_index = lbCurSel _categoryList;
if (_index == -1) exitWith {};
_data = _categoryList lbData _index;
_data = call compile _data;
{
	_index = _collectionList lbAdd (_x select 0);
	_collectionList lbSetData [_index, str(_x select 1)];
} forEach _data;
call CT_fnc_CiL_fillContent;

_newCatEdit ctrlSetText (_categoryList lbText (lbCurSel _categoryList));
