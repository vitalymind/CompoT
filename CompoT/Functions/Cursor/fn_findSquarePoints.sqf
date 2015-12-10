/* 
   File: fn_findSquarePoints.sqf 
   Function: CT_fnc_findSquarePoints
   Folder: Cursor 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_center", "_range","_result","_pos","_direction"];
_center = _this select 0;
_range = _this select 1;
_direction = _this select 2;
_result = [];
_range =  sqrt (2 * (_range * _range));
{
	_pos = [(_center select 0) + ((cos (_x - _direction)) * _range), (_center select 1) + ((sin (_x - _direction)) * _range), 0];
	_result pushBack _pos;
} forEach [45,135,225,315];
_result;