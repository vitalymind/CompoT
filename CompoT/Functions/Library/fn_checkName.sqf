/* 
   File: fn_checkName.sqf 
   Function: CT_fnc_checkName 
   Folder: Library 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_pivot","_newName","_composition","_oldName","_element","_forbidden","_pivots","_allChildNames","_result","_getAllPivots",
"_allChildPivots","_getChildPivots","_allNames","_nameFound","_count"];
_pivot = _this select 0;
_newName = _this select 1;
if (typeOf _pivot != PIVOT) exitWith {"wrong"};

_oldName = _pivot getVariable "name";
_forbidden = _pivot getVariable "forbidden";
_forbidden = _forbidden - [_oldName];

if (_newName == _oldName) exitWith {"same"};
if (_newName in _forbidden) exitWith {"parent"};

_allChildPivots = [];
_allChildNames = [];
_getChildPivots = {
	private ["_prefab","_pivots"];
	_pivots = _this getVariable "childPivots";
	if (count _pivots == 0) exitWith {};
	{
		_allChildPivots pushBack _x;
		_allChildNames pushBack (_x getVariable "name");
		_prefab = _x getVariable ["prefab","n/a"];
		if (typeName _prefab == "ARRAY") then {
			_prefab = _prefab select 1;
			{
				_allChildNames pushBack _x;
			} forEach _prefab;
		};
		_x call _getChildPivots;
	} forEach _pivots;
};
_pivot call _getChildPivots;
if (_newName in _allChildNames) exitWith {"child"};

_allPivots = [];
_allNames = [];
_getAllPivots = {
	private ["_prefab","_pivots"];
	_pivots = _this getVariable "childPivots";
	if (count _pivots == 0) exitWith {};
	{
		_allPivots pushBack _x;
		_allNames pushBack (_x getVariable "name");
		_x call _getAllPivots;
		_prefab = _x getVariable ["prefab","n/a"];
		if (typeName _prefab == "ARRAY") then {
			_prefab = _prefab select 1;
			{
				_allNames pushBack _x;
			} forEach _prefab;
		};
		_x call _getChildPivots;
	} forEach _pivots;
};
CT_var_mainPivot call _getAllPivots;
_nameFound = false; _nameFound = if (_newName in _allNames) then {true} else {false};

_count = {(_x getVariable "name") == _oldName} count CT_var_builtPivots;

if ((_count != 1) AND _nameFound) exitWith {"illegal"};
if (_count != 1) exitWith {"clone"};
if (_nameFound) exitWith {"illegal"};

"vocant";