/* 
   File: fn_moveObject.sqf 
   Function: CT_fnc_moveObject 
   Folder: SelectTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_type","_mode","_object","_originalPos","_originalDir"];
_type = _this select 0;
_mode = _this select 1;
_object = _this select 2;
_originalPos = _this select 3;
_newPos = getPosATL _object;
_newDir = getDir _object;

if (_type == "pivot") then {
	private ["_childObjects","_childPivots","_offset",
	"_oldChildPos", "_newChildPos"];
	_childObjects = _object getVariable "childObjects";
	_childPivots = _object getVariable "childPivots";
	
	_offset = [
		(_originalPos select 0) - (_newPos select 0),
		(_originalPos select 1) - (_newPos select 1),
		(_originalPos select 2) - (_newPos select 2)
	];
	
	switch (_mode) do {
		case "multi": {
			{
				[_x,0,0] call CT_fnc_setPB;
				_oldChildPos = getPosATL _x;
				_newChildPos = [
					(_oldChildPos select 0) - (_offset select 0),
					(_oldChildPos select 1) - (_offset select 1),
					(_oldChildPos select 2) - (_offset select 2)
				];
				_x setPosATL _newChildPos;
				[_x] call CT_fnc_alignWithSurface;
			} forEach _childObjects;
		};
		case "mass": {
			{
				[_x,0,0] call CT_fnc_setPB;
				_oldChildPos = getPosATL _x;
				_newChildPos = [
					(_oldChildPos select 0) - (_offset select 0),
					(_oldChildPos select 1) - (_offset select 1),
					(_oldChildPos select 2) - (_offset select 2)
				];
				_x setPosATL _newChildPos;
				[_x] call CT_fnc_alignWithSurface;
			} forEach _childObjects;
			{
				_oldChildPos = getPosATL _x;
				_newChildPos = [
					(_oldChildPos select 0) - (_offset select 0),
					(_oldChildPos select 1) - (_offset select 1),
					(_oldChildPos select 2) - (_offset select 2)
				];
				_x setPosATL _newChildPos;
				["pivot", "mass", _x, _oldChildPos] call CT_fnc_moveObject
			} forEach _childPivots;
		};
	};
};