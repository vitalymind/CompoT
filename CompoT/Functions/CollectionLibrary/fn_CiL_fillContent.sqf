/* 
   File: fn_CiL_fillContent.sqf 
   Function: CT_fnc_CiL_fillContent 
   Folder: CollectionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_collectionList","_contentList","_index","_data","_newColEdit"];
_dialog = findDisplay 25257;
_collectionList = _dialog displayCtrl 251;
_contentList = _dialog displayCtrl 252;
_newColEdit = _dialog displayCtrl 406;
lbClear _contentList;
_index = lbCurSel _collectionList;
if (_index == -1) exitWith {};
_newColEdit ctrlSetText (_collectionList lbText _index);
_names = _collectionList lbData _index;
_names = call compile _names;
_data = _names call CT_fnc_CiL_getObjectsData;
{
	if ((count _x == 2) AND (typeName (_x select 0) == "SCALAR")) then {
		if (_x select 0 == 0) then {
			_index = _contentList lbAdd (format ["%1 (no lib)",(_x select 1)]);
			_contentList lbSetData [_index, str [0, (_x select 1)]];
		};
		if (_x select 0 == -1) then {
			_index = _contentList lbAdd (format ["%1 (no addon)",(_x select 1)]);
			_contentList lbSetData [_index, str [-1, (_x select 1)]];
		};
	} else {
		_index = _contentList lbAdd (_x select 3);
		_contentList lbSetData [_index, str _x];
	};
} forEach _data;