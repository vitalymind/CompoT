/* 
   File: fn_CiL_fillObjects.sqf 
   Function: CT_fnc_CiL_fillObjects 
   Folder: CollectionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_tree","_groupCombo","_case","_catIndex","_objIndex"];
_dialog = findDisplay 25257;
_tree = _dialog displayCtrl 200;
_groupCombo = _dialog displayCtrl 301;
_index = lbCurSel _groupCombo;
if (_index == -1) exitWith {};
_case = _groupCombo lbText _index;
tvClear 200;
switch (_case) do {
	case "categories": {
		{
			_catIndex = _tree tvAdd [[],(_x select 0)];
			{
				_classname = _x select 0;
				if (isClass (configFile >> "CfgVehicles" >> _classname)) then {
					_objIndex = _tree tvAdd [[_catIndex],_classname];
					_tree tvSetData [[_catIndex, _objIndex], str _x];
				};
			} forEach (_x select 1);
		} forEach CT_var_objects;
		{
			ctrlShow [_x, false];
		} forEach [407, 700];
	};
	case "no grouping": {
		{
			{
				_classname = _x select 0;
				if (isClass (configFile >> "CfgVehicles" >> _classname)) then {
					_objIndex = _tree tvAdd [[],_classname];
					_tree tvSetData [[_objIndex], str _x];
				};
			} forEach (_x select 1);
		} forEach CT_var_objects;
		{
			ctrlShow [_x, true];
		} forEach [407, 700];
	};
};