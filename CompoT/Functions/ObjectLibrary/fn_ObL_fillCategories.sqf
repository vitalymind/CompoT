/* 
   File: fn_ObL_fillCategories.sqf 
   Function: CT_fnc_ObL_fillCategories 
   Folder: ObjectLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_categoryList","_collectionList","_contentList","_index"];
_dialog = findDisplay 25250;
_categoryList = _dialog displayCtrl 251;
_contentList = _dialog displayCtrl 250;
lbClear _categoryList;
lbClear _contentList;
{
	_index = _categoryList lbAdd (_x select 0);
	_categoryList lbSetData [_index, str(_x select 1)];
} forEach CT_var_objects;
call CT_fnc_ObL_fillContent;