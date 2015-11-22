/* 
   File: fn_updateForbidden.sqf 
   Function: CT_fnc_updateForbidden 
   Folder: Library 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_pivot","_updateForbidden"];
_pivot = _this;
if (typeName _pivot != "OBJECT") exitWith {};
if (typeOf _pivot != PIVOT) exitWith {};

_updateForbidden = {
	private ["_pivots","_parent","_parentForbidden"];
	_pivots = _this getVariable "childPivots";
	_parent = _this getVariable "pivot";
	_parentForbidden = + (_parent getVariable "forbidden");
	_parentForbidden pushBack (_this getVariable "name");
	_this setVariable ["forbidden", _parentForbidden];
	if (count _pivots == 0) exitWith {};
	{
		_x call _updateForbidden;
	} forEach _pivots;
};
_pivot call _updateForbidden;