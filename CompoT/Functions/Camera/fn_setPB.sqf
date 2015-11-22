/* 
   File: fn_setPB.sqf 
   Function: CT_fnc_setPB 
   Folder: Camera 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool //Remark: This script found long ago on some oldschool arma site, dont remember author.
*/ 
#include "defines.hpp" 

private ["_obj","_pitch","_bank","_yaw","_vdir","_vup","_sign","_rotate"];
_obj = _this select 0;
_pitch = _this select 1;
_bank = _this select 2;
_yaw = 360-(getdir _obj);
_rotate = {
	private ["_v","_d","_x","_y"];
	_v = +(_this select 0);
	_d = _this select 1;
	_x = _v select 0; 
	_y = _v select 1;
	_v set [0, (cos _d)*_x - (sin _d)*_y]; _v set [1, (sin _d)*_x + (cos _d)*_y];
	_v;
};
_sign = [1,-1] select (_pitch < 0);
while {abs _pitch > 180} do {_pitch = _sign*(abs _pitch - 180)};
if(abs _pitch == 90) then {_pitch = _sign*(89.9)};
if(abs _pitch > 90) then {
	_obj setdir (getdir _obj)-180; _yaw = 360-(getdir _obj);
	_bank = _bank + 180;
	_pitch = (180 - abs _pitch)*_sign;
};
_vdir = [0, cos _pitch, sin _pitch];
_vdir = [_vdir, _yaw] call _rotate;
_sign = [1,-1] select (_bank < 0);
while {abs _bank > 360} do {_bank = _sign*(abs _bank - 360)};
if(abs _bank > 180) then {_sign = -1*_sign; _bank = (360-_bank)*_sign};
_vup = [sin _bank, 0, cos _bank];
_vup = [_vup select 0] + ([[_vup select 1, _vup select 2], _pitch] call _rotate);
_vup = [_vup, _yaw] call _rotate;
_obj setVectorDirAndUp [_vdir, _vup];