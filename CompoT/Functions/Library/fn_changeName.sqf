/* 
   File: fn_changeName.sqf 
   Function: CT_fnc_changeName 
   Folder: Library 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_case","_cancel","_pivot","_checkResult","_updateNameChildPivots","_newName","_oldName","_forbidden",
"_clones","_cloningMethod"];
_case = _this select 0;
_cloningMethod = "normal";
_cancel = false;

_pivot = objNull; _newName = ""; _oldName = "";
if (_case == "gui") then {	
	if NOTHING_SELECTED exitWith {_cancel = true};
	if (SEL_LIB != "pivot") exitWith {_cancel = true};
	_pivot = FIRST_SELECTION;
	_newName = uiNamespace getVariable "CT_var_GUI_enteredName";
};
if (_case == "silent") then {
	_pivot = _this select 1;
	_newName = _this select 2;
};
if (_cancel) exitWith {};
_updateNameChildPivots = {
	private ["_pivots","_forbidden"];
	_pivots = _this getVariable "childPivots";
	if (count _pivots == 0) exitWith {};
	{
		_forbidden = _x getVariable "forbidden";
		{
			if (_x == _oldName) then {_forbidden set [_forEachIndex, _newName]};
		} forEach _forbidden;
		_x call _updateNameChildPivots;
	} forEach _pivots;
};

_checkResult = [_pivot, _newName] call CT_fnc_checkName;
switch (_checkResult) do {
	case "illegal": {["This name is illegal. It is used elsewhere."] call CT_fnc_errorMsg};
	case "parent": {["This name is illegal. It belongs to one of parent compositions."] call CT_fnc_errorMsg};
	case "child": {["This name is illegal. It belongs to one of child compositions."] call CT_fnc_errorMsg};
	case "clone": {
		_oldName = _pivot getVariable "name";
		_clones = [];
		{
			if ((_x getVariable "name") == _oldName) then {_clones pushBack _x};
		} forEach CT_var_builtPivots;
		{
			_x call _updateNameChildPivots;
			_forbidden = _x getVariable "forbidden";
			{if (_x == _oldName) then {_forbidden set [_forEachIndex, _newName]}} forEach _forbidden;
			_x setVariable ["name", _newName];
		} forEach _clones;
		[_pivot] call CT_fnc_saveElement;
	};
	case "vocant": {
		_oldName = _pivot getVariable "name";
		_pivot call _updateNameChildPivots;
		_forbidden = _pivot getVariable "forbidden";
		{if (_x == _oldName) then {_forbidden set [_forEachIndex, _newName]}} forEach _forbidden;
		_pivot setVariable ["name", _newName];
		[_pivot] call CT_fnc_saveElement;
	};
};