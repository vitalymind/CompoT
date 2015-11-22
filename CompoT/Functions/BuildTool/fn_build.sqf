/* 
   File: fn_build.sqf 
   Function: CT_fnc_build 
   Folder: BuildTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_buildMode","_buildLibrary","_buildable","_parentPos","_parentDir","_parentPivot",
"_return","_naming"];
_buildMode = [_this, 0, "", [""]] call BIS_fnc_param; //preview, normal
_buildLibrary = [_this, 1, "", [""]] call BIS_fnc_param; //object, collection, composition, prefab
_buildable = [_this, 2, [], [[]]] call BIS_fnc_param; //Info about what to build
_parentPos = [_this, 3, [], [[]]] call BIS_fnc_param; //Where to build
_parentDir = [_this, 4, 0, [0]] call BIS_fnc_param; //What direction to build
_parentPivot = [_this, 5, CT_var_mainPivot, [objNull]] call BIS_fnc_param; //What is parent pivot
_naming = [_this, 6, "exact", [""]] call BIS_fnc_param; //Name randomization for compositions 
if ((_buildMode == "") OR (_buildLibrary == "") OR (count _buildable == 0) OR (count _parentPos == 0)) exitWith {
	[format["Input is missing %1-%2-%3-%4-%5",_buildMode, _buildLibrary, _buildable, _parentPos, _parentDir]] call CT_fnc_errorMsg;
};
_return = objNull;

//BUILDING OBJECTS
if (_buildLibrary in ["object","collection"]) then {
	private ["_buildableType","_buildableData","_objClassname","_objRelPos","_objRelDir","_collectionData","_collectionName",
	"_objPos","_objDir","_object","_parentPivotChildObjects","_collection","_alignment"];

	_buildableType = _buildable select 0;
	_buildableData = _buildable select 1;
	_collection = [];
	_alignment = "";
	if (_buildLibrary == "collection") then {
		if (_buildableType == "asParent") then {
			_collection = _buildableData;
			_collectionName = _collection select 0;
			_collectionData = _collection select 1;
			_objClassname = _collectionData select (floor (random (count _collectionData)));
			if (count _collectionData == 0) then {_objClassname = ""};
			_objRelPos = [0,0,0];
			_objRelDir = 0;
			_alignment = if (CT_var_slopeMode) then {"land"} else {"sea"};
		};
		if (_buildableType == "asChild") then {
			_collection = _buildableData select 0;
			_collectionName = _collection select 0;
			_collectionData = _collection select 1;
			_objClassname = _collectionData select (floor (random (count _collectionData)));
			if (count _collectionData == 0) then {_objClassname = ""};
			_objRelPos = _buildableData select 1;
			_objRelDir = _buildableData select 2;
			_alignment = _buildableData select 3;
		};
	};
	if (_buildLibrary == "object") then {
		_objClassname = _buildableData select 0;
		if (_buildableType == "asParent") then {
			_objRelPos = [0,0,0];
			_objRelDir = 0;
			_alignment = if (CT_var_slopeMode) then {"land"} else {"sea"};
		};
		if (_buildableType == "asChild") then {
			_objRelPos = _buildableData select 1;
			_objRelDir = _buildableData select 2;
			_alignment = _buildableData select 3;
		};
	};
	if (_objClassname == "") exitWith {};

	_objPos = [_objRelPos, _parentPos, _parentDir] call CT_fnc_getRelPos;
	_objDir = _objRelDir + _parentDir;
	_object = createVehicle [_objClassname, _objPos, [], 0, "CAN_COLLIDE"];
	if (CT_var_disableSim) then {
		_object enableSimulation false;
		_object allowDamage false;
	};
	_return = _object;
	[_object,0,0] call CT_fnc_setPB;
	_object setDir _objDir;
	_object setPosATL _objPos;
	
	if (_alignment == "land") then {
		[_object, "land"] call CT_fnc_alignWithSurface;
	};

	if (_buildMode == "preview") then {
		CT_var_builtPreview pushBack _object;
	};
	if (_buildMode == "normal") then {CT_var_builtObjects pushBack _object};
	
	_object setVariable ["pivot", _parentPivot];
	_object setVariable ["name", _objClassname];
	_object setVariable ["alignment", _alignment];
	_parentPivotChildObjects = _parentPivot getVariable "childObjects";
	_parentPivotChildObjects pushBack _object;
	_parentPivot setVariable ["childObjects", _parentPivotChildObjects];
	if (_buildLibrary == "collection") then { 
		_object setVariable ["collection", _collection];
		_object setVariable ["name", _collectionName];
	};
};

//BUILDING PIVOTS
if (_buildLibrary in ["composition","prefab"]) then {
	private ["_buildableType","_buildableData","_objRelPos","_objRelDir","_prefab","_composition","_compositionName","_prefabData",
	"_compositionName","_compositionSize","_elements","_pivot","_objPos","_objDir", "_parentChildPivots","_prefabName",
	"_elementLib","_elementName","_elementRelPos","_elementRelDir","_elementData","_forbidden","_forbiddenPrefabData","_searchResult"];

	_forbiddenPrefabData = [];
	_buildableType = _buildable select 0;
	_buildableData = _buildable select 1;
	_prefab = []; _composition = [];
	if (_buildLibrary == "prefab") then {
		if (_buildableType == "asParent") then {
			_prefab = _buildableData;
			_prefabName = _prefab select 0;
			_prefabData = _prefab select 1;
			_forbiddenPrefabData = _prefabData;
			_compositionName = _prefabData select (floor (random (count _prefabData)));
			_composition = ["normal",_compositionName,"composition"] call CT_fnc_findBuildable;
			_objRelPos = [0,0,0];
			_objRelDir = 0;
		};
		if (_buildableType == "asChild") then {
			_prefab = _buildableData select 0;
			_prefabName = _prefab select 0;
			_prefabData = _prefab select 1;
			if (count _prefabData != 0) then {
				if (typeName (_prefabData select 0) == "STRING") then {
					_compositionName = _prefabData select (floor (random (count _prefabData)));
					_composition = ["normal",_compositionName,"composition"] call CT_fnc_findBuildable;
					_forbiddenPrefabData = _prefabData;
				};
				if (typeName (_prefabData select 0) == "ARRAY") then {
					_composition = _prefabData select (floor (random (count _prefabData)));
					{
						_forbiddenPrefabData pushBack (_x select 0);
					} forEach _prefabData;
				};
			};
			_objRelPos = _buildableData select 1;
			_objRelDir = _buildableData select 2;
		};
	};
	if (_buildLibrary == "composition") then {
		if (_buildableType == "asParent") then {
			_composition = _buildableData;
			_objRelPos = [0,0,0];
			_objRelDir = 0;
		};
		if (_buildableType == "asChild") then {
			_composition = _buildableData select 0;
			_objRelPos = _buildableData select 1;
			_objRelDir = _buildableData select 2;
		};
	};
	if ((count _composition) == 0) exitWith {};
	_compositionName = _composition select 0;
	
	if ((_buildLibrary == "composition") AND (_naming == "random")) then {
		private ["_rndName"];
		_rndName = call CT_fnc_makeName;
		[_rndName] call CT_fnc_addName;
		_compositionName = _rndName;
	};
	
	_compositionSize = _composition select 1;
	_elements = _composition select 2;
	
	_forbidden = [];
	_forbidden append (_parentPivot getVariable "forbidden");
	if (_compositionName in _forbidden) exitWith {
		[(format ["Composition %1 is parent to composition %2", _compositionName, (_parentPivot getVariable "name")])] call CT_fnc_errorMsg;
	};

	_objPos = [_objRelPos, _parentPos, _parentDir] call CT_fnc_getRelPos;
	_objDir = _objRelDir + _parentDir;
	_pivot = PIVOT createVehicleLocal _objPos;
	_return = _pivot;
	_pivot setDir _objDir;
	_pivot setPosATL _objPos;
	_pivot setVariable ["size",_compositionSize];
	_pivot setVariable ["childObjects",[]];
	_pivot setVariable ["childPivots",[]];
	_pivot setVariable ["pivot", _parentPivot];
	_pivot setVariable ["name", _compositionName];
	
	_parentChildPivots = _parentPivot getVariable "childPivots";
	_parentChildPivots pushBack _pivot;
	_parentPivot setVariable ["childPivots",_parentChildPivots];
	
	_forbidden pushBack _compositionName;
	if (_buildLibrary == "prefab") then {
		{
			if (!(_x in _forbidden)) then {
				_forbidden pushBack _x;
			};
		} forEach _forbiddenPrefabData;
		_pivot setVariable ["prefab", _prefab];
		_pivot setVariable ["name", _compositionName];
	};
	_pivot setVariable ["forbidden", _forbidden];

	if (_buildMode == "preview") then {CT_var_builtPreview pushBack _pivot};
	if (_buildMode == "normal") then {CT_var_builtPivots pushBack _pivot};

	{
		_elementLib = _x select 0;
		_elementName = _x select 1;
		_elementRelPos = _x select 2;
		_elementRelDir = _x select 3;
		_alignment = [_x, 4, "sea"] call BIS_fnc_param;
		_elementData = [];
		
		
		if (_elementLib in ["collection","prefab","composition"]) then {
			_searchResult = + (["normal",_elementName,_elementLib] call CT_fnc_findBuildable);
			_elementData = [_searchResult,_elementRelPos,_elementRelDir,_alignment];
		};
		
		if (_elementLib == "object") then {
			_elementData = [_elementName,_elementRelPos,_elementRelDir,_alignment];
		};

		if (count _elementData != 0) then {
			[_buildMode, _elementLib, ["asChild", _elementData],_objPos,_objDir,_pivot,_naming] call CT_fnc_build;
		};
		
	} forEach _elements;
	if ((_buildLibrary == "composition") AND (_naming == "random") AND (_buildMode == "normal")) then {
		[_pivot] call CT_fnc_saveElement;
	};
};
_return;