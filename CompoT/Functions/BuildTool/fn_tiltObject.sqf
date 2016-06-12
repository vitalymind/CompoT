/* 
   File: fn_tiltObject.sqf 
   Function: CT_fnc_tiltObject
   Folder: BuildTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

params ["_axis","_direction","_amount"];
private ["_objects","_pb"];
if NOTHING_SELECTED exitWith {};
if (SEL_LIB == "pivot") exitWith {};
_objects = [];
ALL_SELECTED(_objects);
{
	_pb = _x call CT_fnc_getPB;
	if (_axis == "y") then {
		if (_direction == "right") then {_pb set [0,(_pb select 0) + _amount]};
		if (_direction == "left") then {_pb set [0,(_pb select 0) - _amount]};
	};
	if (_axis == "x") then {
		if (_direction == "back") then {_pb set [1,(_pb select 1) + _amount]};
		if (_direction == "forw") then {_pb set [1,(_pb select 1) - _amount]};
	};
	[_x, (_pb select 0),(_pb select 1)] call CT_fnc_setPB;
} forEach _objects;