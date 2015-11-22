/* 
   File: fn_camMove.sqf 
   Function: CT_fnc_camMove 
   Folder: Camera 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_check", "_motion", "_angel","_heightChange","_dir","_oldPos","_newPos","_newHeight","_heightDiff"];
_motion = 0;
_angel = 0;
_heightChange = 0;

call {
	private ["_up","_down","_forw","_back","_left","_rght"];
	_up = CT_var_holdenKeys select 0;
	_down = CT_var_holdenKeys select 1;
	_forw = CT_var_holdenKeys select 2;
	_back = CT_var_holdenKeys select 3;
	_left = CT_var_holdenKeys select 4;
	_rght = CT_var_holdenKeys select 5;
	if (_up AND !_down) then {_heightChange = 1; _motion = 0.0001};
	if (!_up AND _down) then {_heightChange = -1; _motion = 0.0001};
	if (_forw AND !_back AND !_left AND !_rght) exitWith {_angel = 0; _motion = 1;};
	if (_forw AND !_back AND !_left AND _rght) exitWith {_angel = 45; _motion = 1;};
	if (!_forw AND !_back AND !_left AND _rght) exitWith {_angel = 90; _motion = 1;};
	if (!_forw AND _back AND !_left AND _rght) exitWith {_angel = 135; _motion = 1;};
	if (!_forw AND _back AND !_left AND !_rght) exitWith {_angel = 180; _motion = 1;};
	if (!_forw AND _back AND _left AND !_rght) exitWith {_angel = 225; _motion = 1;};
	if (!_forw AND !_back AND _left AND !_rght) exitWith {_angel = 270; _motion = 1;};
	if (_forw AND !_back AND _left AND !_rght) exitWith {_angel = 315; _motion = 1;};
};

if (_motion == 0) exitWith {
	if (CT_var_camIsMoving) then {CT_var_camIsMoving = false};
};
if (!CT_var_camIsMoving) then {CT_var_camIsMoving = true};

_dir = (getDir CT_var_cam) + _angel;
_oldPos = getPosASL CT_var_cam;
_heightDiff = (_oldPos select 2) - (getTerrainHeightASL _oldPos);
_heightDiff = _heightDiff max 0;
_newPos = [
	(_oldPos select 0) + ((sin _dir) * _motion * CT_var_camSpeed),
	(_oldPos select 1) + ((cos _dir) * _motion * CT_var_camSpeed)
];
_newHeight = ((getTerrainHeightASL _newPos) + _heightDiff) + ((_heightChange * CT_var_camSpeed) * 0.7);
_newPos pushBack _newHeight;
CT_var_cam setPosASL _newPos;