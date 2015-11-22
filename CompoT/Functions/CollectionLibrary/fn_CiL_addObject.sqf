/* 
   File: fn_CiL_addObject.sqf 
   Function: CT_fnc_CiL_addObject 
   Folder: CollectionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_tree","_collectionList","_data","_index","_collectionName","_pointer","_exit"];
_dialog = findDisplay 25257;
_tree = _dialog displayCtrl 200;
_collectionList = _dialog displayCtrl 251;
_index = tvCurSel _tree;
if (count _index == 0) exitWith {};
_data = [];
_data = _tree tvData _index;
if (_data != "") then {_data = call compile _data} else {_data = []};
if (count _data == 0) exitWith {};
_index = lbCurSel _collectionList;
if (_index == -1) exitWith {};
_collectionName = _collectionList lbText _index;
_pointer = []; _exit = false;
{
	{
		if ((_x select 0) == _collectionName) exitWith {
			_exit = true;
			_pointer = (_x select 1);
		};
	} forEach (_x select 1);
	if (_exit) exitWith {};
} forEach CT_var_collections;
_pointer pushBack (_data select 0);
call CT_fnc_CiL_fillCategories;