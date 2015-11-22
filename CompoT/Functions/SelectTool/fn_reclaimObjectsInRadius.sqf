/* 
   File: fn_reclaimObjectsInRadius.sqf 
   Function: CT_fnc_reclaimObjectsInRadius 
   Folder: SelectTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_childObjects","_newPivot","_radius","_oldPivot","_oldPivotChildObjects","_objects","_id","_pivots","_prefab"];
if NOTHING_SELECTED exitWith {};
if (SEL_LIB != "pivot") exitWith {};
_newPivot = FIRST_SELECTION;
_radius = _newPivot getVariable "size";
_childObjects = _newPivot getVariable "childObjects";
_objects = [];
{
	if (_x in CT_var_builtObjects) then {
		if (!(_x in _childObjects)) then {
			_prefab = (_x getVariable "pivot") getVariable ["prefab","n/a"];
			if (typeName _prefab == "STRING") then {
				_objects pushBack _x
			};
		};
	};
} forEach ((getPosATL _newPivot) nearObjects _radius);
_pivots = [_newPivot];
{
	_oldPivot = _x getVariable "pivot";
	if (!(_oldPivot in _pivots)) then {_pivots pushback _oldPivot};
	_oldPivotChildObjects = _oldPivot getVariable "childObjects";
	_oldPivotChildObjects = _oldPivotChildObjects - [_x];
	_oldPivot setVariable ["childObjects", _oldPivotChildObjects];
	_x setVariable ["pivot", _newPivot];
	_childObjects pushBack _x;
} forEach _objects;
_newPivot setVariable ["childObjects",_childObjects];
call CT_fnc_reDrawSelection;
{[_x] call CT_fnc_saveElement} forEach _pivots;
_pivots call CT_fnc_cloneComposition;