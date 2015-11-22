/* 
   File: fn_IM_preloadInput.sqf 
   Function: CT_fnc_IM_preloadInput 
   Folder: ImportMenuGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_source","_fromClipCheck","_fromDispCheck","_fromfileCheck","_dropEdit","_import","_importList","_wrongImportFormat",
"_name","_index"];
_dialog = findDisplay 25261;
_fromClipCheck = _dialog displayCtrl 200;
_fromDispCheck = _dialog displayCtrl 201;
_fromfileCheck = _dialog displayCtrl 202;
_dropEdit = _dialog displayCtrl 300;
_importList = _dialog displayCtrl 400;
_source = if (cbChecked _fromClipCheck) then {0} else {if (cbChecked _fromDispCheck) then {1} else {if (cbChecked _fromfileCheck) then {2};};};
_import = "";
switch (_source) do {
	case 0: {_import = copyFromClipboard};
	case 1: {_import = ctrlText _dropEdit};
	case 2: {_import = preprocessFile (ctrlText _dropEdit)};
};
if (_import == "") exitWith {["Input source is empty."] call CT_fnc_errorMsg};
_import = '[' + _import + ']';
_import = call compile _import;
_wrongImportFormat = true;
{
	if (count _x == 6) then {_wrongImportFormat = false};
	if ((typeName(_x select 0) == "STRING") AND (typeName(_x select 1) == "STRING") AND (typeName(_x select 2) == "STRING") AND
		(typeName(_x select 3) == "STRING") AND (typeName(_x select 4) == "ARRAY") AND (typeName(_x select 5) == "ARRAY")) then {_wrongImportFormat = false};
	if (({typeName _x != "SCALAR"} count (_x select 4)) > 0) then {_wrongImportFormat = true};
} forEach _import;
if (_wrongImportFormat) exitWith {["Imported data is not compitable with composition tool"] call CT_fnc_errorMsg};
lbClear _importList;
CT_var_IM_importOptions = [];
{
	_name = ""; _name = switch true do {
		case ((_x select 4) isEqualTo [0]): {"All libraries"};
		case ((_x select 4) isEqualTo [1,0]): {"Library, object"};
		case ((_x select 4) isEqualTo [1,1]): {"Library, composition"};
		case ((_x select 4) isEqualTo [1,2]): {"Library, collection"};
		case ((_x select 4) isEqualTo [1,3]): {"Library, prefab"};
		case ((_x select 4) isEqualTo [2,0]): {"Element, object"};
		case ((_x select 4) isEqualTo [2,1]): {"Element, composition"};
		case ((_x select 4) isEqualTo [2,2]): {"Element, collection"};
		case ((_x select 4) isEqualTo [2,3]): {"Element, prefab"};
		case ((_x select 4) isEqualTo [3,0]): {"Project"};
	};
	_index = _importList lbAdd _name;
	_importList lbSetData [_index, str(_x select 5)];
	CT_var_IM_importOptions pushBack [(_x select 0),(_x select 1),(_x select 2),(_x select 3),(_x select 4),2];
} forEach _import;
_importList lbSetCurSel 0;