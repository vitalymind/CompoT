/* 
   File: fn_PrL_renamePref.sqf 
   Function: CT_fnc_PrL_renamePref 
   Folder: PrefabLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_newName","_newPrefEdit","_allPrefabs","_prefabList","_oldName","_index","_pointer","_prefab",
"_prefabs","_name"];
_dialog = findDisplay 25258;
_newPrefEdit = _dialog displayCtrl 401;
_prefabList = _dialog displayCtrl 251;
_newName = ctrlText _newPrefEdit;
if (_newName == "") exitWith {};
_index = lbCurSel _prefabList;
if (_index == -1) exitWith {};
_oldName = _prefabList lbText _index;
if (_oldName == _newName) exitWith {};
_allPrefabs = []; _pointer = [];
{
	{
		_allPrefabs pushBack (_x select 0);
		if ((_x select 0) == _oldName) then {_pointer = _x};
	} forEach (_x select 1);
} forEach CT_var_prefabs;
if (_newName in _allPrefabs) exitWith {};
[CT_var_compositions, _oldName, _newName] call CT_fnc_replaceDeep;
[CT_var_prefabs, _oldName, _newName] call CT_fnc_replaceDeep;
_prefabs = [];
{
	_name = _x getVariable "name";
	_prefab = _x getVariable ["prefab","n/a"];
	if (typeName _prefab == "ARRAY") then {
		if (_oldName == _name) then {
			_prefabs pushBack _x;
		};
	};
} forEach CT_var_builtPivots;
{
	_x setVariable ["name", _newName];
	_prefab = _x getVariable "prefab";
	_prefab set [0, _newName];
} forEach _prefabs;

call CT_fnc_PrL_fillCategories;