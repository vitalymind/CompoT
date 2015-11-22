/* 
   File: fn_PrL_addObject.sqf 
   Function: CT_fnc_PrL_addObject 
   Folder: PrefabLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_tree","_prefabsList","_data","_index","_prefabName","_pointer","_exit"];
_dialog = findDisplay 25258;
_tree = _dialog displayCtrl 200;
_prefabsList = _dialog displayCtrl 251;
_index = tvCurSel _tree;
if (count _index == 0) exitWith {};
_data = [];
_data = _tree tvData _index;
if (_data != "") then {_data = call compile _data} else {_data = []};
if (count _data == 0) exitWith {};
_index = lbCurSel _prefabsList;
if (_index == -1) exitWith {};
_prefabName = _prefabsList lbText _index;
_pointer = []; _exit = false;
{
	{
		if ((_x select 0) == _prefabName) exitWith {
			_exit = true;
			_pointer = (_x select 1);
		};
	} forEach (_x select 1);
	if (_exit) exitWith {};
} forEach CT_var_prefabs;
_pointer pushBack (_data select 0);
call CT_fnc_PrL_fillCategories;