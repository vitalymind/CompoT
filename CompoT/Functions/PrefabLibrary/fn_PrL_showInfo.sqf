/* 
   File: fn_PrL_showInfo.sqf 
   Function: CT_fnc_PrL_showInfo 
   Folder: PrefabLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_tree","_contentList","_data","_index","_objectsList","_compositionsList","_collectionsList",
"_prefabsList","_objects","_compositions","_collections","_prefabs","_sizeText","_objectsText","_compositionsText",
"_collectionsText","_prefabsText"];
_dialog = findDisplay 25258;
_tree = _dialog displayCtrl 200;
_contentList = _dialog displayCtrl 252;
_data = [];
_objectsList = _dialog displayCtrl 253;
_compositionsList = _dialog displayCtrl 254;
_collectionsList = _dialog displayCtrl 255;
_prefabsList = _dialog displayCtrl 256;

_sizeText = _dialog displayCtrl 600;
_objectsText = _dialog displayCtrl 601;
_compositionsText = _dialog displayCtrl 602;
_collectionsText = _dialog displayCtrl 603;
_prefabsText = _dialog displayCtrl 604;

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
lbClear _objectsList;
lbClear _compositionsList;
lbClear _collectionsList;
lbClear _prefabsList;
call CT_fnc_clearPreview;
_sizeText ctrlSetText "";
_objectsText ctrlSetText "";
_compositionsText ctrlSetText "";
_collectionsText ctrlSetText "";
_prefabsText ctrlSetText "";
if (typename _data != "ARRAY") exitWith {};
if (count _data == 0) exitWith {};
if (count _data == 2) exitWith {};

_objects = 0; _compositions = 0; _collections = 0; _prefabs = 0;
{
	if ((_x select 0) == "object") then {_objects = _objects + 1; _objectsList lbAdd (_x select 1);};
	if ((_x select 0) == "composition") then {_compositions = _compositions + 1; _compositionsList lbAdd (_x select 1);};
	if ((_x select 0) == "collection") then {_collections = _collections + 1; _collectionsList lbAdd (_x select 1);};
	if ((_x select 0) == "prefab") then {_prefabs = _prefabs + 1; _prefabsList lbAdd (_x select 1);};
} forEach (_data select 2);
_sizeText ctrlSetText format ["%1 %2",(_data select 1),(localize "STR_A3_composition_library_meters")];
_objectsText ctrlSetText format ["%1 %2",_objects,(localize "STR_A3_composition_library_pcs")];
_compositionsText ctrlSetText format ["%1 %2",_compositions,(localize "STR_A3_composition_library_pcs")];
_collectionsText ctrlSetText format ["%1 %2",_collections,(localize "STR_A3_composition_library_pcs")];
_prefabsText ctrlSetText format ["%1 %2",_prefabs,(localize "STR_A3_composition_library_pcs")];
_this call CT_fnc_PrL_preview;