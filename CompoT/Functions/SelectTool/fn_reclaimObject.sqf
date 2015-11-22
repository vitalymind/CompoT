/* 
   File: fn_reclaimObject.sqf 
   Function: CT_fnc_reclaimObject 
   Folder: SelectTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_newPivot","_childObjects","_oldPivot","_oldPivotChildObjects","_object"];
_newPivot = objNull;
if SOMETHING_SELECTED then {
	if (SEL_LIB == "pivot") then {
		_newPivot = FIRST_SELECTION;
	};
};
if (isNull _newPivot) exitWith {};
_childObjects = _newPivot getVariable "childObjects";

_object = [[],"normal","objects"] call CT_fnc_cursorFindClosestObject;
if (!(_object in _childObjects)) then {
	_childObjects pushBack _object;
	_newPivot setVariable ["childObjects", _childObjects];
	
	_oldPivot = _object getVariable "pivot";
	_oldPivotChildObjects = _oldPivot getVariable "childObjects";
	_oldPivotChildObjects = _oldPivotChildObjects - [_object];
	_oldPivot setVariable ["childObjects", _oldPivotChildObjects];
	
	_object setVariable ["pivot", _newPivot];
	call CT_fnc_reDrawSelection;
	[_oldPivot] call CT_fnc_saveElement;
	[_newPivot] call CT_fnc_saveElement;
	[_oldPivot, _newPivot] call CT_fnc_cloneComposition;
};