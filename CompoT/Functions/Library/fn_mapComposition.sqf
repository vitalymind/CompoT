/* 
   File: fn_mapComposition.sqf 
   Function: CT_fnc_mapComposition 
   Folder: Library 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_pivot","_childObjects","_text","_subText","_relPos","_relDir","_compositionName","_compositionSize","_objectPos",
"_pivotDirZeroing","_getRelPos","_pivotPos","_newChildPos","_childPivots","_prefab","_name","_collection","_alignment",
"_collections","_prefabs","_result"];
_pivot = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
if (isNull _pivot) exitWith {"error"};
_childObjects = _pivot getVariable "childObjects";
_childPivots = _pivot getVariable "childPivots";
_relPos = []; _relDir = 0;
_collections = []; _prefabs = []; _result = [];
_compositionName = _pivot getVariable "name";
_compositionSize = _pivot getVariable "size";
_pivotDirZeroing = 360 - (getDir _pivot);

_getRelPos = {
	private ["_parentPos", "_childPos","_parentDir","_relAngle","_result", "_distance","_parentHeight","_childHeight"];
	_childPos = _this select 0;	_childHeight = _childPos select 2;_childPos set [2,0];
	_parentPos = _this select 1;_parentHeight = _parentPos select 2;_parentPos set [2,0];
	_parentDir = _this select 2;_result = [0,0,0];
	_distance = _parentPos distance2D _childPos;
	_relAngle = (((_childPos select 0) - (_parentPos select 0)) atan2 ((_childPos select 1) - (_parentPos select 1)));
	_result = [
		(_parentPos select 0) + ((sin (_parentDir + _relAngle)) * _distance),
		(_parentPos select 1) + ((cos (_parentDir + _relAngle)) * _distance),
		_parentHeight + _childHeight
	];
	_result;
};

_text = format ['["%1", %2,[', _compositionName,_compositionSize];
{
	_subText = "";
	_name = _x getVariable "name";
	_alignment = _x getVariable ["alignment","sea"];
	_collection = _x getVariable ["collection", "n/a"];
	_pivotPos = getPosATL _pivot;
	_objectPos = getPosATL _x;

	_newChildPos = [_objectPos, _pivotPos, _pivotDirZeroing] call _getRelPos;
	_relPos = [
		 (_newChildPos select 0) - (_pivotPos select 0),
		 (_newChildPos select 1) - (_pivotPos select 1),
		 (_newChildPos select 2) - (_pivotPos select 2)
	];
	
	_relDir = (getDir _x) - (getDir _pivot);
	_relDir = if (_relDir > 0) then {_relDir} else {360 + _relDir};
	if (_relDir < 0.1) then {_relDir = 0.1};
	
	if (typeName _collection == "ARRAY") then {
		_subText = format ['["collection","%1",%2,%3,"%4"]', _name, _relPos,_relDir,_alignment];
		if (_forEachIndex != ((count _childObjects) - 1)) then {_subText = _subText + ","};
		_collections pushBack _collection;
	} else {
		_subText = format ['["object","%1",%2,%3,"%4"]', _name, _relPos,_relDir,_alignment];
		if (_forEachIndex != ((count _childObjects) - 1)) then {_subText = _subText + ","};
	};
	_text = _text + _subText;
} forEach _childObjects;
if ((count _childPivots != 0) AND (count _childObjects != 0)) then {_text = _text + ","};
{
	_subText = "";
	_name = _x getVariable "name";
	_prefab = _x getVariable ["prefab", "n/a"];
	_pivotPos = getPosATL _pivot;
	_objectPos = getPosATL _x;
	_newChildPos = [_objectPos, _pivotPos, _pivotDirZeroing] call _getRelPos;
	_relPos = [
		 (_newChildPos select 0) - (_pivotPos select 0),
		 (_newChildPos select 1) - (_pivotPos select 1),
		 (_newChildPos select 2) - (_pivotPos select 2)
	];
	
	_relDir = (getDir _x) - (getDir _pivot);
	_relDir = if (_relDir > 0) then {_relDir} else {360 + _relDir};
	if (_relDir < 0.1) then {_relDir == 0.1};
	
	if (typeName _prefab == "ARRAY") then {
		_subText = format ['["prefab","%1", %2, %3]', (_prefab select 0), _relPos,_relDir];
		if (_forEachIndex != ((count _childPivots) - 1)) then {_subText = _subText + ","};
		_prefabs pushBack _prefab;
	} else {
		_subText = format ['["composition","%1",%2, %3]', _name, _relPos,_relDir];
		if (_forEachIndex != ((count _childPivots) - 1)) then {_subText = _subText + ","};
	};
	_text = _text + _subText;
} forEach _childPivots;
_text = _text + "]]";
_result = [_text, _collections, _prefabs];
_result;