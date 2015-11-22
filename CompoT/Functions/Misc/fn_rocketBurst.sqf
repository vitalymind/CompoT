/* 
   File: fn_rocketBurst.sqf 
   Function: CT_fnc_rocketBurst 
   Folder: Misc 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
//Remark: This is the very best function in CT and most usefull too!
#include "defines.hpp" 

private ["_count","_spray","_delay","_missile"];
_count = [_this, 0, 5, [0]] call BIS_fnc_param;
_spray = [_this, 1, 1, [0]] call BIS_fnc_param;
_delay = [_this, 2, 0, [0]] call BIS_fnc_param;
_missile = [_this, 3, "M_PG_AT", [""]] call BIS_fnc_param;
[_count, _spray, _delay, _missile] spawn {
	_count = _this select 0;
	_spray = _this select 1;
	_delay = _this select 2;
	_missile = _this select 3;
	for "_i" from 1 to _count do {
		_pos = position CT_var_cam;
		_dir = getDir CT_var_cam;
		_pitchBank = CT_var_cam call CT_fnc_getPB;
		_pitch = (_pitchBank select 0);
		
		_pos set [2, (_pos select 2) + 3];
		_dir = _dir + ((random (_spray * 2)) - _spray);
		_pitch = _pitch + ((random (_spray * 2)) - _spray);
		
		_bomb = createVehicle ["M_PG_AT",_pos , [], 0, "CAN_COLLIDE"];
		_bomb setDir _dir;
		[_bomb, _pitch, 0] call CT_fnc_setPB;
		sleep _delay;
	};
};