/* 
   File: fn_PrL_fillCompositions.sqf 
   Function: CT_fnc_PrL_fillCompositions 
   Folder: PrefabLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_tree","_groupCombo","_case","_catIndex","_objIndex"];
_dialog = findDisplay 25258;
_tree = _dialog displayCtrl 200;
_groupCombo = _dialog displayCtrl 301;
_index = lbCurSel _groupCombo;
if (_index == -1) exitWith {};
_case = _groupCombo lbText _index;
tvClear 200;
switch (_case) do {
	case "categories": {
		{
			if ((_x select 0) != "temporary") then {
				_catIndex = _tree tvAdd [[],(_x select 0)];
				{
					_objIndex = _tree tvAdd [[_catIndex],(_x select 0)];
					_tree tvSetData [[_catIndex, _objIndex], str _x];
				} forEach (_x select 1);
			};
		} forEach CT_var_compositions;
	};
	case "no grouping": {
		{
			if ((_x select 0) != "temporary") then {
				{
					_objIndex = _tree tvAdd [[],(_x select 0)];
					_tree tvSetData [[_objIndex], str _x];
				} forEach (_x select 1);
			};
		} forEach CT_var_compositions;
	};
};