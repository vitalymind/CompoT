/* 
   File: fn_changePivotOwner.sqf 
   Function: CT_fnc_changePivotOwner 
   Folder: SelectTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_nearPivots","_target","_childPivots","_parentPivot","_targetParentPivot","_illegal",
"_targetParentPivotChildPivots","_getPivots","_allPivots","_selection","_allNames","_forbidden"];
if NOTHING_SELECTED exitWith {};
if (SEL_LIB != "pivot") exitWith {};
_allPivots = [];
_allNames = [];
_illegal = false;
_getPivots = {
	private ["_pivots"];
	_pivots = _this getVariable "childPivots";
	if (count _pivots == 0) exitWith {};
	{
		_allPivots pushBack _x;
		_allNames pushBack (_x getVariable "name");
		_x call _getPivots;
	} forEach _pivots;
};

_selection = FIRST_SELECTION;
_forbidden = _selection getVariable "forbidden";
_nearPivots = nearestObjects [position CT_var_cursor, [PIVOT], CT_var_selectRange];
if (count _nearPivots == 0) exitWith {};
_target = _nearPivots select 0;
_childPivots = _selection getVariable "childPivots";
_parentPivot = _selection getVariable "pivot";
if (_target == _selection) exitWith {};
if (_target == _parentPivot) exitWith {["Circular dependency"] call CT_fnc_errorMsg};
if (_target in _childPivots) exitWith {["Circular dependency"] call CT_fnc_errorMsg};
_target call _getPivots;
_allNames pushBack (_target getVariable "name");
if (_selection in _allPivots) exitWith {["Circular dependency"] call CT_fnc_errorMsg};

{
	if (_x in _allNames) exitWith {_illegal = true};
} forEach _forbidden;

if (_illegal) exitWith {["Circular dependency"] call CT_fnc_errorMsg};

_targetParentPivot = _target getVariable "pivot";
_targetParentPivotChildPivots = _targetParentPivot getVariable "childPivots";
_targetParentPivotChildPivots = _targetParentPivotChildPivots - [_target];
_targetParentPivot setVariable ["childPivots", _targetParentPivotChildPivots];

_target setVariable ["pivot", _selection];

_childPivots pushBack _target;
_selection setVariable ["childPivots", _childPivots];

_target call CT_fnc_updateForbidden;

call CT_fnc_reDrawSelection;
[_selection] call CT_fnc_saveElement;
[_targetParentPivot] call CT_fnc_saveElement;
[_selection, _targetParentPivot] call CT_fnc_cloneComposition;
