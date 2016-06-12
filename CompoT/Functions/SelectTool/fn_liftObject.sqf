/* 
   File: fn_liftObject.sqf 
   Function: CT_fnc_liftObject 
   Folder: SelectTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_mode","_object","_height","_type"];
_mode = _this select 0;
_type = _this select 1;
_object = _this select 2;
_height = _this select 3;

if (_type == "pivot") then {
	private ["_childPos","_childObjects","_childPivots"];
	_childObjects = _object getVariable "childObjects";
	_childPivots = _object getVariable "childPivots";
	
	if (_mode == "single") then {
		{
			[_x,0,0] call CT_fnc_setPB;
			_childPos = getPosATL _x;
			_childPos set [2, (_childPos select 2) + _height];
			_x setPosATL _childPos;
			[_x] call CT_fnc_alignWithSurface;
		} forEach _childObjects;
	};
	if (_mode == "multi") then {
		{
			[_x,0,0] call CT_fnc_setPB;
			_childPos = getPosATL _x;
			_childPos set [2, (_childPos select 2) + _height];
			_x setPosATL _childPos;
			[_x] call CT_fnc_alignWithSurface;
		} forEach _childObjects;
		{
			[_mode, _type, _x, _height] call CT_fnc_liftObject;
		} forEach _childPivots;
	};
};
if (_type == "object") then {
	private ["_pos","_pb"];
	_pb = _object call CT_fnc_getPB;
	[_object,0,0] call CT_fnc_setPB;
	_pos = getPosATL _object;
	_pos set [2, (_pos select 2) + _height];
	_object setPosATL _pos;
	if (ct_var_vectorUpMode == 0) then {
		[_object] call CT_fnc_alignWithSurface;
	};
	if (ct_var_vectorUpMode == 1) then {
		[_object, _pb select 0, _pb select 1] call CT_fnc_setPB;
	};
};