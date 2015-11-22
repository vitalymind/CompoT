/* 
   File: fn_resetOwner.sqf 
   Function: CT_fnc_resetOwner 
   Folder: SelectTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_pivot","_oldOwner","_newOwner","_childPivots"];
if NOTHING_SELECTED exitWith {};
if (SEL_LIB == "pivot") then {
	_pivot = FIRST_SELECTION;
	_oldOwner = _pivot getVariable "pivot";
	_newOwner = CT_var_mainPivot;
	
	_childPivots = _oldOwner getVariable "childPivots";
	_childPivots = _childPivots - [_pivot];
	_oldOwner setVariable ["childPivots", _childPivots];
	_oldOwner call CT_fnc_updateForbidden;
	[_oldOwner] call CT_fnc_saveElement;
	[_oldOwner] call CT_fnc_cloneComposition;
	
	_pivot setVariable ["pivot", _newOwner];
	_childPivots = _newOwner getVariable "childPivots";
	_childPivots pushBack _pivot;
	_newOwner setVariable ["childPivots", _childPivots];
	_pivot call CT_fnc_updateForbidden;
	call CT_fnc_reDrawSelection;
};
if (SEL_LIB == "object") then {
	_objects = [];
	_pivots = [];
	ALL_SELECTED(_objects);
	{
		_pivot = _x getVariable "pivot";
		if (!(_pivot in _pivots)) then {_pivots pushBack _pivot};
		_childObjects = _pivot getVariable "childObjects";
		_childObjects deleteAt (_childObjects find _x);
		_x setVariable ["pivot", CT_var_mainPivot];
	} forEach _objects;
	{[_x] call CT_fnc_saveElement;} forEach _pivots;
	_pivots call CT_fnc_cloneComposition;
	call CT_fnc_reDrawSelection;
};