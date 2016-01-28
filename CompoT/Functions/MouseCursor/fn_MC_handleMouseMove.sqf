/* 
   File: fn_MC_handleMouseMove.sqf 
   Function: CT_fnc_MC_handleMouseMove
   Folder: MouseCursor 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_display","_frame","_background","_frame_x","_frame_y","_frame_h","_frame_w"];

CT_var_mousePos set [0, (_this select 1)]; 
CT_var_mousePos set [1, (_this select 2)];

if (CT_var_cursorTool == "selectTool") then {
	disableSerialization;
	_display = findDisplay 25252;
	_frame = _display displayCtrl 101;
	_background = _display displayCtrl 101;

	_frame_x = -10;
	_frame_y = -10;
	_frame_h = 0;
	_frame_w = 0;
	if (count ct_var_frameSelect != 0) then {
		_frame_x = (_this select 1);
		_frame_y = (_this select 2);
		_frame_h = ((ct_var_frameSelect select 0) select 1) - (_this select 2);
		_frame_w = ((ct_var_frameSelect select 0) select 0) - (_this select 1);
	};
	_frame ctrlSetPosition [_frame_x, _frame_y, _frame_w, _frame_h];
	_background ctrlSetPosition [_frame_x, _frame_y, _frame_w, _frame_h];
	_frame ctrlCommit 0;
	_background ctrlCommit 0;
};
false;