/* 
   File: fn_exportStructure.sqf 
   Function: CT_fnc_exportStructure 
   Folder: Library 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_exportText","_childPivots","_result","_getPivots","_pivots","_allPivots","_br","_name","_names","_subT","_data","_pivotPos",
"_collections","_prefabs","_isPrefab","_possiblePrefabs","_possibleCollections","_possibleCompositions","_tempArray","_pivot"];
//GETTING ALL PIVOTS
_pivot = [_this, 0, CT_var_mainPivot, [objNull]] call BIS_fnc_param;
_pivotPos = [];
if (typeOf _pivot == CENTER_PIVOT) then {_pivotPos = getPosATL _pivot; _pivotPos set [2,0];};
_allPivots = []; _collections = []; _prefabs = [];
_possiblePrefabs = []; _possibleCollections = []; _possibleCompositions = []; 
_names = [];
_childPivots = _pivot getVariable "childPivots";
if (count _childPivots != 0) then {
	_result = [];
	_getPivots = {
		_pivots = _this getVariable "childPivots";
		if (count _pivots == 0) exitWith {};
		{
			_result pushBack _x;
			_x call _getPivots;
		} forEach _pivots;
		_result;
	};
	_allPivots = _pivot call _getPivots;
};

//FUNCTIONS
_processPrefab = {
	private ["_name","_data","_composition"];
	if (count _this == 0) exitWith {};
	_name = _this select 0;
	_data = _this select 1;
	if (!(_name in _names)) then {
		_names pushBack _name;
		_possiblePrefabs pushBack _this;
	};
	{
		_composition = ["normal",_x,"composition"] call CT_fnc_findBuildable;
		_composition call _processComposition;
	} forEach _data;
};
_processComposition = {
	private ["_name","_elements","_composition","_type","_prefab","_collection"];
	if (count _this == 0) exitWith {};
	_name = _this select 0;
	_elements = _this select 2;
	if (!(_name in _names)) then {
		_names pushBack _name;
		_possibleCompositions pushBack _this;
	};
	{
		_type = _x select 0;
		_name = _x select 1;
		switch (_type) do {
			case "composition": {
				_composition = ["normal",_name,"composition"] call CT_fnc_findBuildable;
				_composition call _processComposition;
			};
			case "collection": {
				_collection = ["normal",_name,"collection"] call CT_fnc_findBuildable;
				_collection call _processCollection;
			};
			case "prefab": {
				_prefab = ["normal",_name,"prefab"] call CT_fnc_findBuildable;
				_prefab call _processPrefab;
			};
		};

	} forEach _elements;
};
_processCollection = {
	private ["_name"];
	if (count _this == 0) exitWith {};
	_name = _this select 0;
	if (!(_name in _names)) then {
		_names pushBack _name;
		_possibleCollections pushBack _this;
	};
};

//EXPORTING MAIN COMPOSITION
_br = "";
_exportText = "";
_data = [_pivot] call CT_fnc_mapComposition;

_subT = _data select 0;
_collections = _collections + (_data select 1);
_prefabs = _prefabs + (_data select 2);
_exportText = _exportText + '["PROJECT_NAME",' + (str _pivotPos) + ',[' + _subT + ',' + _br;

//EXPORTING SUB COMPOSITIONS
_exportText = _exportText + '[' + _br;
_tempArray = [];
{
	_name = _x getVariable "name";
	_isPrefab = if (typeName (_x getVariable ["prefab","n/a"]) == "ARRAY") then {true} else {false};
	if ((!(_name in _names)) AND (! _isPrefab)) then {
		_names pushBack _name;
		_tempArray pushBack _x;
	};
} forEach _allPivots;
_allPivots = + _tempArray;
{
	_isPrefab = if (typeName (_x getVariable ["prefab","n/a"]) == "ARRAY") then {true} else {false};
	if (! _isPrefab) then {
		_data = [_x] call CT_fnc_mapComposition;
		_subT = _data select 0;
		_collections = _collections + (_data select 1);
		_prefabs = _prefabs + (_data select 2);
		if (_subT != "error") then {
			if (_forEachIndex != ((count _allPivots) - 1)) then {_subT = _subT + ","};
			_exportText = _exportText + _subT + _br;
		};
	};
} forEach _allPivots;
_exportText = _exportText + '],' + _br;

//EXPORTING COLLECTIONS
_exportText = _exportText + '[' + _br;
_tempArray = [];
{
	_name = _x select 0;
	if (!(_name in _names)) then {
		_names pushBack _name;
		_tempArray pushBack _x;
	};
} forEach _collections;
_collections = + _tempArray;
{
	_subT = str _x;
	if (_forEachIndex != ((count _collections) - 1)) then {_subT = _subT + ","};
	_exportText = _exportText + _subT + _br;
} forEach _collections;
_exportText = _exportText + '],' + _br;

//EXPORTING PREFABS
_exportText = _exportText + '[' + _br;
_tempArray = [];
{
	_name = _x select 0;
	if (!(_name in _names)) then {
		_names pushBack _name;
		_tempArray pushBack _x;
	};
} forEach _prefabs;
_prefabs = + _tempArray;
{
	_subT = str _x;
	if (_forEachIndex != ((count _prefabs) - 1)) then {_subT = _subT + ","};
	_exportText = _exportText + _subT + _br;
} forEach _prefabs;
_exportText = _exportText + '],' + _br;

//PROCESSING POSSIBLE ENTITIES
{_x call _processPrefab} forEach _prefabs;

//EXPORTING POSIBLE PREFABS
_exportText = _exportText + '[' + _br;
{
	_subT = str _x;
	if (_forEachIndex != ((count _possiblePrefabs) - 1)) then {_subT = _subT + ","};
	_exportText = _exportText + _subT + _br;
} forEach _possiblePrefabs;
_exportText = _exportText + '],' + _br;

//EXPORTING POSIBLE COMPOSITIONS
_exportText = _exportText + '[' + _br;
{
	_subT = str _x;
	if (_forEachIndex != ((count _possibleCompositions) - 1)) then {_subT = _subT + ","};
	_exportText = _exportText + _subT + _br;
} forEach _possibleCompositions;
_exportText = _exportText + '],' + _br;

//EXPORTING POSIBLE COLLECTIONS
_exportText = _exportText + '[' + _br;
{
	_subT = str _x;
	if (_forEachIndex != ((count _possibleCollections) - 1)) then {_subT = _subT + ","};
	_exportText = _exportText + _subT + _br;
} forEach _possibleCollections;
_exportText = _exportText + ']]]' + _br;

//EXTRACTING RESULT
_exportText;