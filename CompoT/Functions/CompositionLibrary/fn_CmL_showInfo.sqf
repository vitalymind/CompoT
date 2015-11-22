/* 
   File: fn_CmL_showInfo.sqf 
   Function: CT_fnc_CmL_showInfo 
   Folder: CompositionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_list","_index","_sizeText","_objectsText","_compositionsText","_collectionsText","_prefabsText",
"_objects","_compositions","_collections","_prefabs","_data","_objectsList","_compositionsList","_collectionsList",
"_prefabsList","_nameEdit"];
_dialog = findDisplay 25256;
_sizeText = _dialog displayCtrl 600;
_objectsText = _dialog displayCtrl 601;
_compositionsText = _dialog displayCtrl 602;
_collectionsText = _dialog displayCtrl 603;
_prefabsText = _dialog displayCtrl 604;
_objectsList = _dialog displayCtrl 102;
_compositionsList = _dialog displayCtrl 103;
_collectionsList = _dialog displayCtrl 104;
_prefabsList = _dialog displayCtrl 105;
_nameEdit = _dialog displayCtrl 400;
lbClear _objectsList;
lbClear _compositionsList;
lbClear _collectionsList;
lbClear _prefabsList;
_list = controlNull;
if (_this == "left") then {
	_list = _dialog displayCtrl 100;
	CT_var_CmL_selection set [2, "left"];
};
if (_this == "right") then {
	_list = _dialog displayCtrl 101;
	CT_var_CmL_selection set [2, "right"];
};
if (_this == "category") exitWith {
	CT_var_CmL_selection set [2, "category"];
};
_index = lbCurSel _list;
if (_index == -1) exitWith {
	_sizeText ctrlSetText "";
	_objectsText ctrlSetText "";
	_compositionsText ctrlSetText "";
	_collectionsText ctrlSetText "";
	_prefabsText ctrlSetText "";
};
_data = _list lbData _index;
_data = call compile _data;
if (typename _data != "ARRAY") exitWith {};
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
_nameEdit ctrlSetText (_data select 0);
call CT_fnc_CmL_preview;