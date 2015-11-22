/* 
   File: fn_importStructure.sqf 
   Function: CT_fnc_importStructure 
   Folder: Library 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_setup","_mainComposition","_compositions","_collections","_prefabs","_possiblePrefabs","_possibleCompositions",
"_possibleCollections","_topElements","_elementLib","_elementName","_elementRelPos","_elementRelDir","_elementData","_pivot",
"_pivotPos","_pivotDir","_newPos","_alignment","_projectName"];

//TODO: move to project manager
if (count _this == 0) exitWith {};

_projectName = _this select 0;
_newPos = _this select 1;
_setup = _this select 2;
if (count _newPos != 0) then {
	_newPos call CT_fnc_changeCenterPos;
};
_pivot = ct_var_mainPivot;
if (count _setup == 0) exitWith {};

_mainComposition = _setup select 0;
_compositions = _setup select 1;
_collections = _setup select 2;
_prefabs = _setup select 3;
_possiblePrefabs = _setup select 4;
_possibleCompositions = _setup select 5;
_possibleCollections = _setup select 6;

{
	_name = _x select 0;
	if (!(_name call CT_fnc_isNameUsed)) then {
		[_x, "composition","parts"] call CT_fnc_saveElementAs;
	};
} forEach (_compositions + _possibleCompositions);
{
	_name = _x select 0;
	if (!(_name call CT_fnc_isNameUsed)) then {
		[_x, "collection","parts"] call CT_fnc_saveElementAs;
	};
} forEach (_collections + _possibleCollections);
{
	_name = _x select 0;
	if (!(_name call CT_fnc_isNameUsed)) then {
		[_x, "prefab","parts"] call CT_fnc_saveElementAs;
	};
} forEach (_prefabs + _possiblePrefabs);

_topElements = _mainComposition select 2;
_pivotPos = getPosATL _pivot;
_pivotDir = getDir _pivot;
{
	_elementLib = _x select 0;
	_elementName = _x select 1;
	_elementRelPos = _x select 2;
	_elementRelDir = _x select 3;
	_alignment =  [_x, 4, "sea"] call BIS_fnc_param;
	_elementData = [];
	
	if (_elementLib in ["collection","prefab","composition"]) then {
		_elementData = [(["normal",_elementName,_elementLib] call CT_fnc_findBuildable),_elementRelPos,_elementRelDir,_alignment];
	};
	if (_elementLib == "object") then {
		_elementData = [_elementName,_elementRelPos,_elementRelDir,_alignment];
	};
	if (count _elementData != 0) then {
		["normal", _elementLib, ["asChild", _elementData],_pivotPos,_pivotDir,_pivot,"exact"] call CT_fnc_build;
	};
} forEach _topElements;
