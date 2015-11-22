/* 
   File: fn_CiL_handleKeydown.sqf 
   Function: CT_fnc_CiL_handleKeydown 
   Folder: CollectionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_key","_case","_categoryList","_collectionList","_contentList","_index","_name","_pointer","_found","_cancel"];
_dialog = findDisplay 25257;
_key = (_this select 0) select 1;
_case = _this select 1;
_categoryList = _dialog displayCtrl 250;
_collectionList = _dialog displayCtrl 251;
_contentList = _dialog displayCtrl 252;
_index = -1; _cancel = true; _pointer = [];
if (_key == DIK_DELETE) then {
	if (_case == "category") then {
		_index = lbCurSel _categoryList;
		if (_index == -1) exitWith {_cancel = true};
		_name = _categoryList lbText _index;
		if (_name == "temporary") exitWith {_cancel = true};
		_pointer = CT_var_collections;
		_index = -1;
	};
	if (_case == "collection") then {
		_index = lbCurSel _collectionList;
		if (_index == -1) exitWith {_cancel = true};
		_name = _collectionList lbText _index;
		_index = -1;
	};
	if (_case == "content") then {
		_index = lbCurSel _collectionList;
		if (_index == -1) exitWith {_cancel = true};
		_name = _collectionList lbText _index;
		_index = lbCurSel _contentList;
		if (_index == -1) exitWith {_cancel = true};
	};
	{
		if ((_name == (_x select 0)) AND (_case == "category")) exitWith {_index = _forEachindex};
		{
			if ((_name == (_x select 0)) AND (_case == "collection")) exitWith {_index = _forEachindex};
			if ((_name == (_x select 0)) AND (_case == "content")) exitWith {_pointer = (_x select 1)};
		} forEach (_x select 1);
		if ((_index != -1) AND (_case == "collection")) exitWith {_pointer = (_x select 1)};
	} forEach CT_var_collections;
	if (_index != -1) then {
		_pointer deleteAt _index;
		call CT_fnc_CiL_fillCategories;
	};
};
if ((_key == DIK_ARROWUP) AND HK_SHIFT) then {
	-1 call CT_fnc_CiL_move;
};
if ((_key == DIK_ARROWDOWN) AND HK_SHIFT) then {
	1 call CT_fnc_CiL_move;
};