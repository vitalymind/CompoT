/* 
   File: fn_findCirclePoints.sqf 
   Function: CT_fnc_findCirclePoints 
   Folder: Cursor 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_center", "_range","_count","_result","_angle","_pos"];
_center = _this select 0;
_range = _this select 1;
_count = 50;
_angle = 0;
_result = [];

if (_range <= 0) exitWith {_result};
if (_range < 20) then {_count = 50};
if (_range < 50 AND _range >= 20) then {_count = 150};
if (_range < 100 AND _range >= 50) then {_count = 200};
if (_range > 100) then {_count = 250};

for "_i" from 1 to _count do {
	_pos = [(_center select 0) + ((cos _angle) * _range), (_center select 1) + ((sin _angle) * _range), 0];
	_angle = _angle + (360/_count);
	_result pushBack _pos;
};
_result;