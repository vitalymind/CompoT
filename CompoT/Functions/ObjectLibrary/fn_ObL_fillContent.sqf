/* 
   File: fn_ObL_fillContent.sqf 
   Function: CT_fnc_ObL_fillContent 
   Folder: ObjectLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_categoryList","_contentList","_index","_data"];
_dialog = findDisplay 25250;
_categoryList = _dialog displayCtrl 251;
_contentList = _dialog displayCtrl 250;
lbClear _contentList;
_index = lbCurSel _categoryList;
if (_index == -1) exitWith {};
_data = _categoryList lbData _index;
_data = call compile _data;
{
	_index = _contentList lbAdd (_x select 0);
	_contentList lbSetData [_index, str _x];
} forEach _data;