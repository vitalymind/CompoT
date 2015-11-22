/* 
   File: fn_PrL_fillContent.sqf 
   Function: CT_fnc_PrL_fillContent 
   Folder: PrefabLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_prefabList","_contentList","_index","_data","_names"];
_dialog = findDisplay 25258;
_prefabList = _dialog displayCtrl 251;
_contentList = _dialog displayCtrl 252;
_newPrefEdit = _dialog displayCtrl 401;
lbClear _contentList;
_index = lbCurSel _prefabList;
if (_index == -1) exitWith {};
_newPrefEdit ctrlSetText (_prefabList lbText _index);
_names = _prefabList lbData _index;
_names = call compile _names;
_data = _names call CT_fnc_PrL_getCompositionData;
{
	if ((count _x == 2) AND (typeName (_x select 0) == "SCALAR")) then {
			_index = _contentList lbAdd (format ["%1 (missing)",(_x select 1)]);
			_contentList lbSetData [_index, str [0, (_x select 1)]];
	} else {
		_index = _contentList lbAdd (_x select 0);
		_contentList lbSetData [_index, str _x];
	};
} forEach _data;