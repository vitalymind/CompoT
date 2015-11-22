/* 
   File: fn_copy.sqf 
   Function: CT_fnc_copy 
   Folder: Clipboard 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_objects","_type","_libraryName","_elementName","_collection","_prefab","_dir","_object","_relPos",
"_closestObject","_simpleRelPos","_height"];
_type = _this select 0;
_objects = [_this, 1, [], [[]]] call BIS_fnc_param;
_closestObject = _objects select 0;
_relPos = [];
_simpleRelPos = {
	private ["_res","_pos1","_pos2"];
	_pos1 = _this select 0;
	_pos2 = _this select 1;
	_res = [
		(_pos1 select 0) - (_pos2 select 0),
		(_pos1 select 1) - (_pos2 select 1),
		(_pos1 select 2) - (_pos2 select 2)
	];
	_res;
};
if (count _objects == 0) then {
	if SOMETHING_SELECTED then {
		ALL_SELECTED(_objects);
		_closestObject = [_objects,"unlimited"] call CT_fnc_cursorFindClosestObject;
	};
};
if (count _objects == 0) exitWith {};
CT_var_clipboard = [_type, []];
{
	_object = _x;
	_libraryName = ""; _elementName = ""; _collection = []; _prefab = [];
	_dir = getDir _object;
	if (typeOf _object != PIVOT) then {
		_collection = _object getVariable ["collection", "n/a"];
		if (typeName _collection == "STRING") then {_libraryName = "object"} else {_libraryName = "collection"};
	};
	if (typeOf _object == PIVOT) then {
		_prefab = _object getVariable ["prefab", "n/a"];
		if (typeName _prefab == "STRING") then {_libraryName = "composition"} else {_libraryName = "prefab"};
	};
	switch (_libraryName) do {
		case "object": {
			_elementName = _object getVariable "name";
		};
		case "collection": {
			_elementName = _collection select 0;
		};
		case "composition": {
			_elementName = _object getVariable "name";
		};
		case "prefab": {
			_elementName = _prefab select 0;
		};
	};
	if (_object == _closestObject) then {
		_height = (getPosATL _object) select 2;
		_relPos = [0,0,0];
	} else {
		_relPos = ([getPosATL _closestObject, getPosATL _object] call _simpleRelPos);
	};
	(CT_var_clipboard select 1) pushBack [_elementName,_libraryName,_dir,_relPos];
} forEach _objects;
CT_var_clipboard pushBack _height;
if ((_type == "normalCopy") AND (SEL_LIB == "object")) then {[format ["%1 object(s) copied", count _objects]] call CT_fnc_notification};
if ((_type == "normalCopy") AND (SEL_LIB == "pivot")) then {["Pivot copied to clipboard"] call CT_fnc_notification};
if ((_type == "cloneCopy") AND (SEL_LIB == "pivot")) then {["Pivot copied to clipboard as clone"] call CT_fnc_notification};
