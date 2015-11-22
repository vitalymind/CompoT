/* 
   File: fn_PrL_preview.sqf 
   Function: CT_fnc_PrL_preview 
   Folder: PrefabLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_list","_index","_tree","_contentList","_data"];
_dialog = findDisplay 25258;
_tree = _dialog displayCtrl 200;
_contentList = _dialog displayCtrl 252;
_data = [];
if (_this == "tree") then {
	_index = tvCurSel _tree;
	_data = _tree tvData _index;
	if (_data != "") then {_data = call compile _data} else {_data = []};
};
if (_this == "list") then {
	_index = lbCurSel _contentList;
	if (_index == -1) exitWith {};
	_data = _contentList lbData _index;
	if (_data != "") then {_data = call compile _data} else {_data = []};
};
if (count _data == 0) exitWith {};
[_data, "composition"] call CT_fnc_makePreview;
[(_data select 1)] call CT_fnc_CmL_setCam;