/* 
   File: fn_cursorGrab.sqf 
   Function: CT_fnc_cursorGrab 
   Folder: SelectTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_case","_type","_simpleRelPos","_cursorPos","_objectPos","_objects","_closestObject","_object","_originalPos",
"_originalMode","_pivots","_pivot","_pointer","_cancel","_forceGrab"];
_case = _this select 0;
_type = param [1, "single"];
_forceGrab = param [2, false];
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
switch (_case) do {
	case "grab": {
		//START GRABBING
		if NOTHING_SELECTED exitWith {
			["single","default"] call CT_fnc_cursorSelect;
			if (!HK_CTRL AND !HK_SHIFT) then {_type = "mass"};
			if (!HK_CTRL AND HK_SHIFT) then {_type = "multi"};
			if (HK_CTRL AND HK_SHIFT) then {_type = "single"};
			if SOMETHING_SELECTED then {["grab",_type] call CT_fnc_cursorGrab};
		};
		if SOMETHING_SELECTED exitWith {
			//CHECK IF SOMETHING IS GRABBED
			if (SEL_STATE == "busy") exitWith {["place"] call CT_fnc_cursorGrab};
			if (SEL_STATE in ["busySpecial","emptySpecial"]) exitWith {};
			_objects = []; ALL_SELECTED(_objects);
			_closestObject = [] call CT_fnc_cursorFindClosestObject;
			if (!(_closestObject in _objects)) then {
				if (!_forceGrab) then {
					["single","default", _closestObject] call CT_fnc_cursorSelect;
				} else {
					_closestObject = FIRST_SELECTION;
				};
			};
			if NOTHING_SELECTED exitWith {};
			{
				if ((_x select 0) == _closestObject) then {
					_x pushBack [0,0,0];
					_x pushBack (getPosATL (_x select 0));
					_x pushBack (getDir (_x select 0));
					if (typeOf (_x select 0) == PIVOT) then {_x pushBack _type};
				} else {
					_x pushBack ([getPosATL _closestObject, getPosATL (_x select 0)] call _simpleRelPos);
					_x pushBack (getPosATL (_x select 0));
					_x pushBack (getDir (_x select 0));
					if (typeOf (_x select 0) == PIVOT) then {_x pushBack _type};
				};
			} forEach SELECTION;
			CT_var_sel set [2, "busy"];
		};
	};
	case "grabSpecial": {
		_cancel = false;
		if SOMETHING_SELECTED then {
			if (SEL_STATE in ["busySpecial","emptySpecial"]) then {
				["place"] call CT_fnc_cursorGrab;
				_cancel = true;
			};
		};
		if (_cancel) exitWith {};
		_object = [] call CT_fnc_cursorFindClosestObject;
		["single","default",_object] call CT_fnc_cursorSelect;
		if NOTHING_SELECTED exitWith {};
		if (SEL_LIB == "pivot") exitWith {};
		_pointer = SELECTION select 0;
		CT_var_sel set [2, "busySpecial"];
		_pointer pushBack "";
		_pointer pushBack (getPosATL _object);
		_pointer pushBack (getDir _object);
		_object setVariable ["specialGrab", [0,8,0]];
	};
	case "release": {
		if SOMETHING_SELECTED then {
			if (SEL_STATE in ["busy","busySpecial","emptySpecial"]) then {
				{
					_object = _x select 0;
					[_object,0,0] call CT_fnc_setPB;
					_object setDir (_x select 4);
					_object setPosATL (_x select 3);
					[_object] call CT_fnc_alignWithSurface;
					_object setVariable ["specialGrab", nil];
					_object setVariable ["specialGrabCam", nil];
				} forEach SELECTION;
				["clean"] call CT_fnc_drawSelection;
				call CT_fnc_clearSelect;
			};
		};
	};
	case "place": {
		if (SEL_LIB == "pivot") then {
			_object = FIRST_SELECTION;
			_originalPos = (SELECTION select 0) select 3;
			_originalMode = (SELECTION select 0) select 5;
			[SEL_LIB, _originalMode, _object, _originalPos] call CT_fnc_moveObject;
			[_object] call CT_fnc_saveElement;
			[(_object getVariable "pivot")] call CT_fnc_saveElement;
			[_object, (_object getVariable "pivot")] call CT_fnc_cloneComposition;
		};
		_pivots = [];
		{
			_object = _x select 0;
			_object setVariable ["specialGrab", nil];
			_object setVariable ["specialGrabCam", nil];
			if (SEL_LIB == "object") then {
				_pivot = _object getVariable "pivot";
				if (!(_pivot in _pivots)) then {_pivots pushBack _pivot};
			};
			_x deleteRange [2, count _x];
		} forEach SELECTION;
		if (SEL_LIB == "object") then {
			{[_x] call CT_fnc_saveElement} forEach _pivots;
			_pivots call CT_fnc_cloneComposition;
		};
		call CT_fnc_reDrawSelection;
		CT_var_sel set [2, "empty"];
	};
};