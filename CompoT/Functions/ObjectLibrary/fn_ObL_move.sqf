/* 
   File: fn_ObL_move.sqf 
   Function: CT_fnc_ObL_move 
   Folder: ObjectLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_curList","_categoryList","_index","_direction","_pointer","_name","_currentPos",
"_targetPos","_shift","_contentList"];
_dialog = findDisplay 25250;
_direction = _this;
_curList = CT_var_ObL_selection;
_categoryList = _dialog displayCtrl 251;
_contentList = _dialog displayCtrl 250;
_pointer = [];	_currentPos = -1;

_index = lbCurSel _categoryList;
_name = _categoryList lbText _index;
if (_curList == "content") then {
	_index = lbCurSel _contentList;
};
if (_index == -1) exitWith {};

{
	if (_curList == "category") then {
		if ((_x select 0) == _name) then {
			_currentPos = _forEachIndex;
		};
	};
	if (_curList == "content") then {
		if ((_x select 0) == _name) then {
			_pointer = _x select 1;
			_currentPos = _index;
		};
	};
} forEach CT_var_objects;
if (_currentPos == -1) exitWith {};

_targetPos = _currentPos + _direction;

if (_curList == "category") then {
	_targetPos = _targetPos max 0 min (count CT_var_objects - 1);
};
if (_curList == "content") then {
	_targetPos = _targetPos max 0 min (count _pointer - 1);
};
if (_targetPos == _currentPos) exitWith {};

_shift = {
	private ["_arr","_oldPos","_newPos","_elem","_tmpArr"];
	_arr = _this select 0;
	_oldPos = _this select 1;
	_newPos = _this select 2;
	_elem = _arr deleteAt _oldPos;
	_tmpArr = + _arr;
	_arr deleteRange [0, count _arr];
	if (_newPos > 0) then {_arr append (_tmpArr select [0, _newPos])};
	_arr pushBack _elem;
	_arr append (_tmpArr select [_newPos, count _tmpArr]);
};
if (_curList == "category") then {
	[CT_var_objects, _currentPos, _targetPos] call _shift;
};
if (_curList == "content") then {
	[_pointer, _currentPos, _targetPos] call _shift;
};
call CT_fnc_ObL_fillCategories;