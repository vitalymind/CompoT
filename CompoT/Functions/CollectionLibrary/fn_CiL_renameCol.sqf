/* 
   File: fn_CiL_renameCol.sqf 
   Function: CT_fnc_CiL_renameCol 
   Folder: CollectionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_newName","_newColEdit","_allCollections","_collectionList","_oldName","_index","_pointer","_collection",
"_collections","_name"];
_dialog = findDisplay 25257;
_newColEdit = _dialog displayCtrl 406;
_collectionList = _dialog displayCtrl 251;
_newName = ctrlText _newColEdit;
if (_newName == "") exitWith {};
_index = lbCurSel _collectionList;
if (_index == -1) exitWith {};
_oldName = _collectionList lbText _index;
if (_oldName == _newName) exitWith {};
_allCollections = []; _pointer = [];
{
	{
		_allCollections pushBack (_x select 0);
		if ((_x select 0) == _oldName) then {_pointer = _x};
	} forEach (_x select 1);
} forEach CT_var_collections;
if (_newName in _allCollections) exitWith {};
[CT_var_compositions, _oldName, _newName] call CT_fnc_replaceDeep;
[CT_var_collections, _oldName, _newName] call CT_fnc_replaceDeep;
_collections = [];
{
	_name = _x getVariable "name";
	_collection = _x getVariable ["collection","n/a"];
	if (typeName _collection == "ARRAY") then {
		if (_oldName == _name) then {
			_collections pushBack _x;
		};
	};
} forEach CT_var_builtObjects;
{
	_x setVariable ["name", _newName];
	_collection = _x getVariable "collection";
	_collection set [0, _newName];
} forEach _collections;

call CT_fnc_CiL_fillCategories;