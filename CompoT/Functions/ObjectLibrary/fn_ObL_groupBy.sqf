/* 
   File: fn_ObL_groupBy.sqf 
   Function: CT_fnc_ObL_groupBy 
   Folder: ObjectLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_case","_ctrl","_index","_dialog","_tree","_sortByCombo","_sort","_checkModandScope",
"_checkBoxScope0","_checkBoxScope1","_checkBoxModelEmpty","_checkBoxModelEmpty2"];
disableSerialization;
_dialog = findDisplay 25250;
_ctrl = _dialog displayCtrl 301;
_index = lbCurSel _ctrl;
_case = _ctrl lbText _index;
_tree = _dialog displayCtrl 200;
_sortByCombo = _dialog displayCtrl 300;
_index = lbCurSel _sortByCombo;
_sort = "no sorting";
if (_index != -1) then {_sort = _sortByCombo lbData _index};
_checkBoxScope0 = cbChecked (_dialog displayCtrl 500);
_checkBoxScope1 = cbChecked (_dialog displayCtrl 501);
_checkBoxModelEmpty = cbChecked (_dialog displayCtrl 502);
_checkBoxModelEmpty2 = cbChecked (_dialog displayCtrl 503);

_checkModandScope = {
	if (_sort != "no sorting") then {
		if (_sort == "CUP") then {
			if (_mod != "CUP") then {_skip = true};
		};
		if (_sort == "STD") then {
			if (!(_mod in ["STD","kart","heli","mark","curator"])) then {_skip = true};
		};
		if (_sort == "PLP Beach objects") then {
			if (_mod != "PLP Beach objects") then {_skip = true};
		};
		if (_sort == "PLP Containers") then {
			if (_mod != "PLP Containers") then {_skip = true};
		};
		if (_sort == "MBG Killhouses") then {
			if (_mod != "MBG Killhouses") then {_skip = true};
		};
		if (_sort == "ArmA nature") then {
			if (_mod != "ArmA nature") then {_skip = true};
		};
		if (_sort == "other mods") then {
			if (_mod in (ct_var_mods + ["kart","heli","mark","curator"])) then {_skip = true};
		};
	};
	if (_displayName == "") then {_displayName = "no display name"};

	if (_checkBoxScope0) then {if (_scope == 0) then {_skip = true};};
	if (_checkBoxScope1) then {if (_scope == 1) then {_skip = true};};
	if (_checkBoxModelEmpty) then {if (_model in ["\A3\Weapons_F\empty.p3d","","\core\default\default.p3d","\A3\Weapons_f\empty","\A3\Weapons_f\dummyweapon.p3d"]) then {_skip = true};};
};

switch (_case) do {
	case "default": {
		private ["_mapSize","_model","_vehicleClass","_scope","_className","_displayName","_skip","_data","_parentLayer","_count"];
		tvClear 200;
		{
			_vehicleClass = _x select 0;
			_data = _x select 1;
			_parentLayer = _forEachIndex;
			
			_tree tvAdd [[], _vehicleClass];
			{
				_skip = false;
				_className = _x select 0;
				_scope = _x select 1;
				if (typeName _scope != "SCALAR") then {_scope = 0};
				_model = _x select 2;
				_displayName = _x select 3;
				_mapSize = _x select 4;
				_mod = _x select 5;
				call _checkModandScope;

				if (!_skip) then {
					_index = _tree tvAdd [[_parentLayer], _className];
					_tree tvSetData [[_parentLayer,_index], format ['["%1",%2,"%3","%4",%5,"%6"]',_className,_scope,_model,_displayName,_mapSize,_mod]];
				};
			} forEach _data;
		} forEach (uinamespace getVariable ["CT_var_GUI_ObL_configContent",[]]);
		_count = _tree tvCount [];
		for "_i" from 0 to _count - 1 do {
			_count = _tree tvCount [_i];
			if (_count == 0) then {_tree tvDelete [_i]};
		};
		{
			ctrlShow [_x, false];
		} forEach [400, 701];
	};
	case "no grouping": {
		private ["_mapSize","_model","_scope","_className","_displayName","_skip","_data"];
		tvClear 200;
		{
			_data = _x select 1;
			{
				_skip = false;
				_className = _x select 0;
				_scope = _x select 1;
				if (typeName _scope != "SCALAR") then {_scope = 0};
				_model = _x select 2;
				_displayName = _x select 3;
				_mapSize = _x select 4;
				_mod = _x select 5;
				call _checkModandScope;
				
				if (!_skip) then {
					_index = _tree tvAdd [[], _className];
					_tree tvSetData [[_index], format ['["%1",%2,"%3","%4",%5,"%6"]',_className,_scope,_model,_displayName,_mapSize,_mod]];
				};
			} forEach _data;
		} forEach (uinamespace getVariable ["CT_var_GUI_ObL_configContent",[]]);
		{
			ctrlShow [_x, true];
		} forEach [400, 701];
	};
};