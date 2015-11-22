/* 
   File: fn_CiL_showInfo.sqf 
   Function: CT_fnc_CiL_showInfo 
   Folder: CollectionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_tree","_contentList","_data","_index","_modelText","_classText","_displayText","_sizeText"];
_dialog = findDisplay 25257;
_tree = _dialog displayCtrl 200;
_contentList = _dialog displayCtrl 252;
_modelText = _dialog displayCtrl 401;
_classText = _dialog displayCtrl 403;
_displayText = _dialog displayCtrl 404;
_sizeText = _dialog displayCtrl 405;
_3dPreview = _dialog displayCtrl 600;
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
	_data = call compile _data;
};
if (count _data == 0) exitWith {
	_modelText ctrlSetText "";
	_classText ctrlSetText "";
	_displayText ctrlSetText "";
	_sizeText ctrlSetText "";
	_3dPreview ctrlSetModel "\A3\Weapons_F\empty.p3d";
};
if ((count _data == 2) AND (typeName (_data select 0) == "SCALAR")) exitWith {
	if ((_data select 0) == -1) then {
		_modelText ctrlSetText format ["Addon with classname %1 is not loaded", (_data select 1)];
	};
	if ((_data select 0) == 0) then {
		_modelText ctrlSetText format ["Classname %1 is not found in library", (_data select 1)];
	};
	_classText ctrlSetText "";
	_displayText ctrlSetText "";
	_sizeText ctrlSetText "";
	_3dPreview ctrlSetModel "\A3\Weapons_F\empty.p3d";
};
if ((_data select 0) == "") exitWith {};
_modelText ctrlSetText (_data select 2);
_classText ctrlSetText (_data select 0);
_displayText ctrlSetText (_data select 3);
_sizeText ctrlSetText str(_data select 4);
_mapsize = (_data select 4);
_3dPreview ctrlSetModel (_data select 2);
_3dPreview ctrlSetModelDirAndUp [[0.1,1,0.2],[0,0,1]];
_3dPreview ctrlSetPosition [1,(_mapsize * 2),0.8];
_3dPreview ctrlCommit 0;