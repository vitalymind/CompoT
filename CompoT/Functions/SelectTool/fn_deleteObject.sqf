/* 
   File: fn_deleteObject.sqf 
   Function: CT_fnc_deleteObject 
   Folder: SelectTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_case","_type","_object","_parent","_cancel","_clearSelection","_objects","_pivots"];
_case = _this select 0;
_type = "";
_objects = [];
_cancel = false;
_clearSelection = false;
if (count _this == 1) then {
	if NOTHING_SELECTED exitWith {_cancel = true};
	if (SEL_STATE != "empty") exitWith {_cancel = true};
	_type = SEL_LIB;
	_objects = SELECTION;
	_clearSelection = true;
};
if (count _this == 3) then {
	_type = _this select 1;
	_objects = _this select 2;
};
if (_cancel) exitWith {};
_pivots = [];
{
	_object = (_x select 0);
	if (!isNull _object) then {
		_parent = _object getVariable "pivot";
		switch (_case) do {
			case "normal": {
				if (_type == "pivot") then {
					private ["_childObjects","_childPivots","_parentPivot","_parentChildPivots"];
					_childObjects = _object getVariable "childObjects";
					_childPivots = _object getVariable "childPivots";
					_parentPivot = _object getVariable "pivot";
					{CT_var_builtObjects = CT_var_builtObjects - [_x]; deleteVehicle _x;} forEach _childObjects;
					_parentChildPivots = _parentPivot getVariable "childPivots";
					_parentChildPivots = _parentChildPivots - [_object];
					{
						_parentChildPivots pushBack _x;
						 _x setVariable ["pivot", _parentPivot];
					} forEach _childPivots;
					_parentPivot setVariable ["childPivots", _parentChildPivots];
					CT_var_builtPivots = CT_var_builtPivots - [_object];
					deleteVehicle _object;
					if (_clearSelection) then {["clean"] call CT_fnc_drawSelection; call CT_fnc_clearSelect;};
					{_x call CT_fnc_updateForbidden} forEach _childPivots;
					[_parent] call CT_fnc_saveElement;
					[_parent] call CT_fnc_cloneComposition;
				};
				if (_type == "object") then {
					private ["_pivot","_parentChildObjects"];
					_pivot = _object getVariable "pivot";
					_parentChildObjects = _pivot getVariable "childObjects";
					_parentChildObjects = _parentChildObjects - [_object];
					_pivot setVariable ["childObjects", _parentChildObjects];
					CT_var_builtObjects = CT_var_builtObjects - [_object];
					deleteVehicle _object;
					if (_clearSelection) then {["clean"] call CT_fnc_drawSelection; call CT_fnc_clearSelect;};
					if (!(_pivot in _pivots)) then {_pivots pushBack _pivot};
				};
			};
			case "transfer": {
				if (_type == "pivot") then {
					private ["_childObjects","_childPivots","_parentPivot",
					"_parentChildPivots","_parentChildObjects"];
					_childObjects = _object getVariable "childObjects";
					_childPivots = _object getVariable "childPivots";
					_parentPivot = _object getVariable "pivot";
					_parentChildObjects = _parentPivot getVariable "childObjects";
					_parentChildPivots = _parentPivot getVariable "childPivots";
					_parentChildPivots = _parentChildPivots - [_object];
					{
						_parentChildPivots pushBack _x;
						_x setVariable ["pivot", _parentPivot];
					} forEach _childPivots;
					{
						_parentChildObjects pushBack _x;
						_x setVariable ["pivot", _parentPivot];
					} forEach _childObjects;
					_parentPivot setVariable ["childObjects", _parentChildObjects];
					_parentPivot setVariable ["childPivots", _parentChildPivots];
					CT_var_builtPivots = CT_var_builtPivots - [_object];
					deleteVehicle _object;
					if (_clearSelection) then {["clean"] call CT_fnc_drawSelection; call CT_fnc_clearSelect;};
					[_parentPivot] call CT_fnc_saveElement;
					[_parentPivot] call CT_fnc_cloneComposition;
					{_x call CT_fnc_updateForbidden} forEach _childPivots;
				};
			};
			case "mass": {
				if (_type == "pivot") then {
					private ["_childObjects","_childPivots","_parentPivot","_parentChildPivots",
					"_getPivots", "_allPivots", "_allObjects","_result","_pivots","_children"];
					
					_allPivots = [];
					_allObjects = [];
						
					_childObjects = _object getVariable "childObjects";
					_childPivots = _object getVariable "childPivots";
					_parentPivot = _object getVariable "pivot";
					
					_parentChildPivots = _parentPivot getVariable "childPivots";
					_parentChildPivots = _parentChildPivots - [_object];
					_parentPivot setVariable ["childPivots", _parentChildPivots];
					
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
						_allPivots = _object call _getPivots;
						_allPivots pushBack _object;
						{
							_children = _x getVariable "childObjects";
							{_allObjects pushBack _x} forEach _children;
						} forEach _allPivots;
					} else {
						{_allObjects pushBack _x} forEach _childObjects;
						_allPivots pushBack _object;
					};
					
					{CT_var_builtObjects = CT_var_builtObjects - [_x]; deleteVehicle _x;} forEach _allObjects;
					{CT_var_builtPivots = CT_var_builtPivots - [_x]; deleteVehicle _x;} forEach _allPivots;
					if SOMETHING_SELECTED then {
						if (_clearSelection) then {["clean"] call CT_fnc_drawSelection; call CT_fnc_clearSelect;};
					};
					[_parent] call CT_fnc_saveElement;
				};
			};
			case "special": {
				if (_type == "pivot") then {
					private ["_childObjects","_childPivots","_parentPivot","_parentChildPivots",
					"_getPivots", "_allPivots", "_allObjects","_result","_pivots","_children"];
					
					_allPivots = [];
					_allObjects = [];
						
					_childObjects = _object getVariable "childObjects";
					_childPivots = _object getVariable "childPivots";
					_parentPivot = _object getVariable "pivot";
					
					_parentChildPivots = _parentPivot getVariable "childPivots";
					_parentChildPivots = _parentChildPivots - [_object];
					_parentPivot setVariable ["childPivots", _parentChildPivots];
					
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
						_allPivots = _object call _getPivots;
						_allPivots pushBack _object;
						{
							_children = _x getVariable "childObjects";
							{_allObjects pushBack _x} forEach _children;
						} forEach _allPivots;
					} else {
						{_allObjects pushBack _x} forEach _childObjects;
						_allPivots pushBack _object;
					};
					
					{CT_var_builtObjects = CT_var_builtObjects - [_x]; deleteVehicle _x;} forEach _allObjects;
					{CT_var_builtPivots = CT_var_builtPivots - [_x]; deleteVehicle _x;} forEach _allPivots;
					if SOMETHING_SELECTED then {
						if (_clearSelection) then {["clean"] call CT_fnc_drawSelection; call CT_fnc_clearSelect;};
					};
				};
			};
		};
	};
} forEach _objects;
if (_type == "object") then {
	{[_x] call CT_fnc_saveElement} forEach _pivots;
	_pivots call CT_fnc_cloneComposition;
};