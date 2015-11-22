/* 
   File: fn_CmL_rename.sqf 
   Function: CT_fnc_CmL_rename 
   Folder: CompositionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_list","_nameEdit","_index","_oldName","_allCompositions","_pCom","_pCat","_curList","_allCategories"];
_dialog = findDisplay 25256;
_nameEdit = _dialog displayCtrl 400;
_list = controlNull;
_curList = (CT_var_CmL_selection select 2);
if (_curList == "left") then {
	_list = _dialog displayCtrl 100;
};
if (_curList == "right") then {
	_list = _dialog displayCtrl 101;
};
if (_curList == "category") then {
	_list = _dialog displayCtrl 106;
	_nameEdit = _dialog displayCtrl 401;
};
_index = lbCurSel _list;
if (_index == -1) exitWith {};
_newName = ctrlText _nameEdit;
if (_newName == "") exitWith {};
_allCompositions = []; _allCategories = []; _pCom = []; _pCat = [];
_oldName = _list lbText _index;
{
	_allCategories pushBack (_x select 0);
	if ((_x select 0) == _oldName) then {_pCat = _x};
	{
		_allCompositions pushBack (_x select 0);
		if ((_x select 0) == _oldName) then {_pCom = _x};
	} forEach (_x select 1);
} forEach CT_var_compositions;
if (_oldName == _newName) exitWith {};

if ((_newName in _allCategories) AND (_curList == "category")) exitWith {};
if ((_newName in _allCompositions) AND (_curList != "category")) exitWith {};
if (_curList == "category") then {
	_pCat set [0,_newName]
} else {
	[CT_var_compositions, _oldName, _newName] call CT_fnc_replaceDeep;
	[CT_var_prefabs, _oldName, _newName] call CT_fnc_replaceDeep;
};
call CT_fnc_CmL_fillCategories;
{
	if ((_x getVariable "name") == _oldName) exitWith {
		["silent",_x,_newname] call CT_fnc_changeName;
	};
} forEach CT_var_builtPivots;