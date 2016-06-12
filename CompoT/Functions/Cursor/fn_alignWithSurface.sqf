/* 
   File: fn_alignWithSurface.sqf 
   Function: CT_fnc_alignWithSurface 
   Folder: Cursor 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_object","_vSide","_vUp","_vDir","_toLand","_toSea"];
_object = [_this, 0, objNull] call BIS_fnc_param;
_forced = [_this, 1, ""] call BIS_fnc_param;
if (isNull _object) exitWith {};
_toSea = {
	[_this, 0, 0] call CT_fnc_setPB
};
_toLand = {
	_vSide = vectorDirVisual _this vectorCrossProduct [0,0,1];  
	_vUp = surfaceNormal getPosVisual _this;  
	_vDir = _vUp vectorCrossProduct _vSide;  
	_this setVectorDirAndUp [_vDir, _vUp];
};

if (typeOf _object == PIVOT) exitWith {_object call _toSea};
if (_forced == "land") exitWith {_object call _toLand};
if (_forced == "sea") exitWith {_object call _toSea};
_object setVariable ["alignment", (if (CT_var_slopeMode) then {"land"} else {"sea"})];
if (CT_var_slopeMode) then {_object call _toLand} else {_object call _toSea};