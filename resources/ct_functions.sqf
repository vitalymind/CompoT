#define PIVOT "Sign_Arrow_Large_F"
#define CENTER_PIVOT "Sign_Arrow_Large_Cyan_F"
If (!isServer) exitWith {};
CT_fnc_setPB = {
	private ["_obj","_pitch","_bank","_yaw","_vdir","_vup","_sign","_rotate"];
	_obj = _this select 0;
	_pitch = _this select 1;
	_bank = _this select 2;
	_yaw = 360-(getdir _obj);
	_rotate = {
		private ["_v","_d","_x","_y"];
		_v = +(_this select 0);
		_d = _this select 1;
		_x = _v select 0; 
		_y = _v select 1;
		_v set [0, (cos _d)*_x - (sin _d)*_y]; _v set [1, (sin _d)*_x + (cos _d)*_y];
		_v;
	};
	_sign = [1,-1] select (_pitch < 0);
	while {abs _pitch > 180} do {_pitch = _sign*(abs _pitch - 180)};
	if(abs _pitch == 90) then {_pitch = _sign*(89.9)};
	if(abs _pitch > 90) then {
		_obj setdir (getdir _obj)-180; _yaw = 360-(getdir _obj);
		_bank = _bank + 180;
		_pitch = (180 - abs _pitch)*_sign;
	};
	_vdir = [0, cos _pitch, sin _pitch];
	_vdir = [_vdir, _yaw] call _rotate;
	_sign = [1,-1] select (_bank < 0);
	while {abs _bank > 360} do {_bank = _sign*(abs _bank - 360)};
	if(abs _bank > 180) then {_sign = -1*_sign; _bank = (360-_bank)*_sign};
	_vup = [sin _bank, 0, cos _bank];
	_vup = [_vup select 0] + ([[_vup select 1, _vup select 2], _pitch] call _rotate);
	_vup = [_vup, _yaw] call _rotate;
	_obj setVectorDirAndUp [_vdir, _vup];
};
CT_fnc_getPB = {
	private ["_obj","_pitch","_bank","_yaw","_vdir","_vup","_sign", "_rotate"]; 
	_obj = _this; 
	_yaw = getdir _obj;
	_rotate = { 
		private ["_v","_d","_x","_ y"]; 
		_v = +(_this select 0); 
		_d = _this select 1; 
		_x = _v select 0; 
		_y = _v select 1; 
		_v set [0, (cos _d)*_x - (sin _d)*_y]; _v set [1, (sin _d)*_x + (cos _d)*_y]; 
		_v
	}; 
	_vdir = vectordir _obj; 
	_vdir = [_vdir, _yaw] call _rotate; 
	if ((_vdir select 1) != 0) then { 
		_pitch = atan ((_vdir select 2) / (_vdir select 1)); 
	} else {
		 if ((_vdir select 2) >= 0) then {_pitch = 90} else {_pitch = -90}; 
	 }; 
	 _vup = vectorup _obj; 
	 _vup = [_vup, _yaw] call _rotate; 
	 _vup = [_vup select 0] + ([[_vup select 1, _vup select 2], 360-_pitch] call _rotate); 
	 if ((_vup select 2) != 0) then { 
		_bank = atan ((_vup select 0) / (_vup select 2)); 
	} else { 
		if ((_vdir select 2) >= 0) then {_bank = 90} else {_bank = -90}; 
	}; 
	if((_vup select 2) < 0) then { 
		_sign = [1,-1] select (_bank < 0);
		_bank = _bank - _sign*180; 
	}; 
	[_pitch, _bank];
};
CT_fnc_alignWithSurface = {
	private ["_object","_vSide","_vUp","_vDir","_toLand","_toSea"];
	_object = _this select 0;
	_forced = [_this, 1, ""] call BIS_fnc_param;
	_toSea = {
		[_this, 0, 0] call CT_fnc_setPB
	};
	_toLand = {
		_vSide = vectorDirVisual _this vectorCrossProduct [0,0,1];  
		_vUp = surfaceNormal getPosVisual _this;  
		_vDir = _vUp vectorCrossProduct _vSide;  
		_this setVectorDirAndUp [_vDir, _vUp];
	};
	
	if (typeOf _object == PIVOT) exitWith {_object call _toSea};
	if (_forced == "land") exitWith {_object call _toLand};
	if (_forced == "sea") exitWith {_object call _toSea};
	_object setVariable ["alignment", (if (CT_var_slopeMode) then {"land"} else {"sea"})];
	if (CT_var_slopeMode) then {_object call _toLand} else {_object call _toSea};
};
CT_fnc_deleteAll = {
	{deleteVehicle _x} forEach CT_var_builtObjects;
	{deleteVehicle _x} forEach CT_var_builtPivots;
	CT_var_builtObjects = [];
	CT_var_builtPivots = [];
	CT_var_mainPivot setVariable ["name",""];
	CT_var_mainPivot setVariable ["size",0];
	CT_var_mainPivot setVariable ["forbidden",[]];
	CT_var_mainPivot setVariable ["childObjects",[]];
	CT_var_mainPivot setVariable ["childPivots",[]];
	["clean"] call CT_fnc_drawSelection;
	call CT_fnc_clearSelect;
};
CT_fnc_findBuildable = {
	private ["_searchType","_return"];
	_searchType = _this select 0;
	_return = [];
	switch (_searchType) do {
		case "normal": {
			private ["_libraryName","_elementName","_library","_tempCatData","_done"];
			_library = [];
			_done = false;
			
			_elementName = _this select 1;
			_libraryName = _this select 2;
			_library = switch (_libraryName) do {
				case "object": {CT_var_objects};
				case "collection": {CT_var_collections};
				case "composition": {CT_var_compositions};
				case "prefab": {CT_var_prefabs};
				default {[]};
			};
			if (isNIl "_library") exitWith {};
			if (typeName _library != "ARRAY") exitWith {};
			if (count _library == 0) exitWith {};
			
			{
				_tempCatData = _x select 1;
				{
					if (_elementName == (_x select 0)) exitWith {
						_return = _x;
						_done = true;
					};
				} forEach _tempCatData;
				if (_done) exitWith {};
			} forEach _library;
		};
	};
	_return;
};
CT_fnc_getRelPos = {
	private ["_parentPos", "_childRelPos","_parentDir", "_childPos","_relAngle","_result", "_distance","_height"];
	_childRelPos = _this select 0;
	_parentPos = _this select 1;
	_height = _parentPos select 2;
	_parentPos set [2,0];
	_parentDir = _this select 2;
	_result = [0,0,0];
	_childPos = [
		((_parentPos select 0) + (_childRelPos select 0)),
		((_parentPos select 1) + (_childRelPos select 1)),
		0
	];
	_distance = _parentPos distance2D _childPos;
	_relAngle = (((_childPos select 0) - (_parentPos select 0)) atan2 ((_childPos select 1) - (_parentPos select 1)));
	_result = [
		(_parentPos select 0) + ((sin (_parentDir + _relAngle)) * _distance),
		(_parentPos select 1) + ((cos (_parentDir + _relAngle)) * _distance),
		_height + (_childRelPos select 2)
	];
	_result;
};
CT_fnc_build = {
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
};
CT_fnc_changeCenterPos = {
	private ["_newPos"];
	_newPos = _this;
	_newPos set [2,0];
	"center" setMarkerPosLocal _newPos;
	CT_var_mainPivot setDir 0;
	CT_var_mainPivot setPosATL _newPos;
};
CT_fnc_importStructure = {
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
};
CT_fnc_saveElementAs = {
	private ["_catElements","_element","_libraryName","_library","_elementName","_found","_i","_saveAs","_index"];
	_element = _this select 0;
	_elementName = _element select 0;
	_libraryName = _this select 1;
	_saveAs = _this select 2;
	_catElements = [];
	_library = switch (_libraryName) do {
		case "collection": {CT_var_collections};
		case "composition": {CT_var_compositions};
		case "prefab": {CT_var_prefabs};
		default {[]};
	};
	_found = false;
	{
		if ((_x select 0) == _saveAs) exitWith {_catElements = _x select 1; _found = true;};
	} forEach _library;
	if (!_found) then {
		_i = _library pushBack [_saveAs,[]];
		_catElements = (_library select _i) select 1;
	};
	
	if ([_elementName] call CT_fnc_isNameUsed) then {
		_i = -1;
		{
			if (_elementName == (_x select 0)) exitWith {_i = _forEachIndex};
		} forEach _catElements;
		if (_i != -1) then {
			_catElements set [_i, _element];
		} else {
			if (_saveAs != "parts") then {_catElements pushBack _element};
		};
	} else {
		_catElements pushBack _element;
		[_elementName] call CT_fnc_addName;
	};
};
CT_fnc_buildMainPivot = {
	private ["_center"];
	if (!IsNull ct_var_mainPivot) then {deleteVehicle ct_var_mainPivot};
	
	if ((getMarkerType "center") == "") then {
		_center = (configfile >> "CfgWorlds" >> worldName >> "centerPosition") call BIS_fnc_getCfgData;
		_center set [2,0];
		createMarkerLocal ["center", _center];
		ct_var_mainPivot = CENTER_PIVOT createVehicleLocal _center;
		ct_var_mainPivot setDir 0;
		ct_var_mainPivot setPosATL _center;
	} else {
		_center = getMarkerPos "center";
		_center set [2,0];
		ct_var_mainPivot = CENTER_PIVOT createVehicleLocal _center;
		ct_var_mainPivot setDir 0;
		ct_var_mainPivot setPosATL _center;
	};
	[ct_var_mainPivot, 0, 0] call CT_fnc_setPB;
	ct_var_mainPivot setVariable ["name","Main"];
	ct_var_mainPivot setVariable ["size",0];
	ct_var_mainPivot setVariable ["forbidden",[]];
	ct_var_mainPivot setVariable ["childObjects",[]];
	ct_var_mainPivot setVariable ["childPivots",[]];
};
CT_fnc_isNameUsed = {
	private ["_name"];
	_name = [_this, 0, "", [""]] call BIS_fnc_param;
	if (_name == "") exitWith {false};
	if (_name in CT_var_usedNames) exitWith {true};
	false;
};
CT_fnc_addName = {
	private ["_name"];
	_name = [_this, 0, "", [""]] call BIS_fnc_param;
	if (_name == "") exitWith {false};
	if ([_name] call CT_fnc_isNameUsed) exitWith {false};
	CT_var_usedNames pushBack _name;
	true;
};
CT_fnc_errorMsg = {
	disableSerialization;
	if ((uiNameSpace getVariable ["CT_var_gui_runMode", "mission"]) == "editor") then {
		private ["_text","_dialog","_control","_textSize","_colorYellow","_resultText","_colorRed"];
		7 cutRsc ["message_GUI","PLAIN",0];
		_dialog = (uiNamespace getVariable 'CT_var_GUI_messageHandle');
		_control = _dialog displayCtrl 100;
		_textSize = (1 / (getResolution select 5));
		_colorYellow = "FFD30D";
		_colorRed = "FF5959";
		_resultText = parseText format ["<t size='%1' align='center' color='#%2'>ERROR: </t>", _textSize, _colorRed];
		_resultText = composeText [_resultText,(parseText format["<t size='%1' align='center' color='#%2'>%3</t>", _textSize, _colorYellow,(_this select 0)])];
		_control ctrlSetStructuredText _resultText;
	} else {
		diag_log format ["CT ERROR: %1",(_this select 0)];
	};
};
CT_fnc_initMission = {
	//INIT VARIABLE
	CT_var_usedNames = [];
	CT_var_slopeMode = "sea";
	CT_var_builtObjects = [];
	CT_var_builtPivots = [];
	CT_var_mainPivot = objNull;
	CT_var_objects = [];
	CT_var_collections = [];
	CT_var_compositions = [];
	CT_var_prefabs = [];
	CT_var_disableSim = false;
	ct_var_projects = [];
	ct_var_projects = call compile preprocessFileLineNumbers "ct_projects.sqf";
	
	//BUILDING
	call CT_fnc_buildMainPivot;
	((ct_var_projects select 0) select 5) call CT_fnc_importStructure;
	
	//HIDE PIVOTS
	{
		_x hideObject true;
	} forEach CT_var_builtPivots;
	ct_var_mainPivot hideObject true;
};
