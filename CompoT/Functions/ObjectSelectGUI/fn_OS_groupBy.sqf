/* 
   File: fn_OS_groupBy.sqf 
   Function: CT_fnc_OS_groupBy 
   Folder: ObjectSelectGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_groupByCombo","_catIndex","_elements","_arr","_grouping","_index","_catCombo","_resetScrollPos","_catNameText",
"_searchEdit"];
_resetScrollPos = [_this, 0, true] call BIS_fnc_param;
_dialog = displayNull;
_groupByCombo = controlNull;
_catCombo = controlNull;
_searchEdit = controlNull;
_catNameText = controlNull;

if ((uinameSpace getVariable ["CT_var_gui_runMode",""]) == "3den") then {
	_dialog = findDisplay 313;
	_groupByCombo = _dialog displayCtrl CT_OSMGROUPBY_IDC;
	_catCombo = _dialog displayCtrl CT_OSMCATCOMBO_IDC;
	_catNameText = _dialog displayCtrl CT_OSMCATNAMETEXT_IDC;
	_searchEdit = _dialog displayCtrl CT_OSMSEARCH_IDC;
} else {
	_dialog = findDisplay 25259;
	_groupByCombo = _dialog displayCtrl 350;
	_catCombo = _dialog displayCtrl 351;
	_catNameText = _dialog displayCtrl 301;
	_searchEdit = _dialog displayCtrl 360;
};

_index = lbCurSel _groupByCombo;
if (_index == -1) exitWith {};
_grouping = _groupByCombo lbText _index;

CT_var_OS_shownObjects = [];
if (_resetScrollPos) then {
	CT_var_OS_scrollPos = 0;
	CT_var_OS_searchScrollPos = 0;
	CT_var_OS_searchText = "";
	_searchEdit ctrlSetText "";
};
if (_grouping == "category") then {
	CT_var_OS_grouping = "category";
	_catIndex = (CT_var_buildMode select 0) select 1;
	_catCombo ctrlShow true;
	_catNameText ctrlShow true;
	_catCombo ctrlSetText ((CT_var_objects select _catIndex) select 0);
	{
		if (isClass (configFile >> "CfgVehicles" >> (_x select 0))) then {
			_arr = [];
			_arr append _x;
			_arr pushback _catIndex;
			_arr pushback _forEachIndex;
			CT_var_OS_shownObjects pushBack _arr;
		};
	} forEach ((CT_var_objects select _catIndex) select 1);
	_elements = CT_var_OS_shownObjects select [CT_var_OS_scrollPos,32];
	_elements call CT_fnc_OS_draw;
};
if (_grouping == "no grouping") then {
	CT_var_OS_grouping = "no grouping";
	_catCombo ctrlShow false;
	_catNameText ctrlShow false;
	{
		_catIndex = _forEachIndex;
		{
			if (isClass (configFile >> "CfgVehicles" >> (_x select 0))) then {
				_arr = [];
				_arr append _x;
				_arr pushback _catIndex;
				_arr pushback _forEachIndex;
				CT_var_OS_shownObjects pushBack _arr;
			};
		} forEach (_x select 1);
	} forEach CT_var_objects;
	_elements = CT_var_OS_shownObjects select [CT_var_OS_scrollPos,32];
	_elements call CT_fnc_OS_draw;
};