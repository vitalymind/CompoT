/* 
   File: fn_ObL_handleKeydown.sqf 
   Function: CT_fnc_ObL_handleKeydown 
   Folder: ObjectLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_key","_case","_categoryList","_contentList","_index","_name","_pointer",
"_found","_configTree"];
_dialog = findDisplay 25250;
_key = (_this select 0) select 1;
_case = _this select 1;

_configTree = _dialog displayCtrl 200;
_categoryList = _dialog displayCtrl 251;
_contentList = _dialog displayCtrl 250;

_index = -1; _pointer = [];
if (_key == DIK_DELETE) then {
	if (_case == "category") then {
		_index = lbCurSel _categoryList;
		if (_index == -1) exitWith {};
		_name = _categoryList lbText _index;
		_pointer = CT_var_objects;
		_index = -1;
	};
	if (_case == "content") then {
		_index = lbCurSel _categoryList;
		if (_index == -1) exitWith {};
		_name = _categoryList lbText _index;
		_index = lbCurSel _contentList;
		if (_index == -1) exitWith {};
	};
	{
		if ((_name == (_x select 0)) AND (_case == "category")) exitWith {_index = _forEachindex};
		if ((_name == (_x select 0)) AND (_case == "content")) exitWith {_pointer = (_x select 1)};
	} forEach CT_var_objects;
	if (_index != -1) then {
		_pointer deleteAt _index;
		call CT_fnc_ObL_fillCategories;
	};
};
if ((_key == DIK_ARROWUP) AND HK_SHIFT) then {
	-1 call CT_fnc_ObL_move;
};
if ((_key == DIK_ARROWDOWN) AND HK_SHIFT) then {
	1 call CT_fnc_ObL_move;
};
if (_key == DIK_ENTER) then {
	call CT_fnc_ObL_addObject;
};