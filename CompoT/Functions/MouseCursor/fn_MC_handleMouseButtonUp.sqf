/* 
   File: fn_MC_handleMouseButtonUp.sqf 
   Function: CT_fnc_MC_handleMouseButtonUp
   Folder: MouseCursor 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_framedObjects","_framedPivots","_screenPos","_cur_x0","_cur_y0","_cur_x1","_cur_y1","_frame_x0","_frame_x1",
"_frame_y0","_frame_y1","_obj_x","_obj_y","_shift","_ctrl","_alt","_button"];

_button = _this select 1;
_shift = _this select 4;
_ctrl = _this select 5;
_alt = _this select 6;

if (CT_var_cursorTool == "selectTool") then {
	if (_button == DIK_LMB) then {
		ct_var_frameSelect set [1, [(CT_var_mousePos select 0),(CT_var_mousePos select 1)]];
		_framedObjects = [];
		_framedPivots = [];
		_cur_x0 = (ct_var_frameSelect select 0) select 0;
		_cur_y0 = (ct_var_frameSelect select 0) select 1;
		_cur_x1 = (ct_var_frameSelect select 1) select 0;
		_cur_y1 = (ct_var_frameSelect select 1) select 1;
		if (isNil "_cur_x0") then {_cur_x0 = _cur_x1};
		if (isNil "_cur_y0") then {_cur_y0 = _cur_y1};
		_frame_x0 = 0;_frame_x1 = 0;_frame_y0 = 0;_frame_y1 = 0;
		if ((_cur_x0 == _cur_x1) AND (_cur_y0 == _cur_y1)) then {
			if (!_shift AND !_ctrl AND !_alt) then {["single","default"] call CT_fnc_cursorSelect};
			if (_shift AND !_ctrl AND !_alt) then {["multi","default"] call CT_fnc_cursorSelect};
			if (!_shift AND _ctrl AND !_alt) then {["single","pivot"] call CT_fnc_cursorSelect};
		} else {
			if ((_cur_x0 > _cur_x1) AND (_cur_y0 > _cur_y1)) then {
				_frame_x0 = _cur_x1; _frame_y0 = _cur_y1;
				_frame_x1 = _cur_x0; _frame_y1 = _cur_y0;
			};
			if ((_cur_x0 <= _cur_x1) AND (_cur_y0 <= _cur_y1)) then {
				_frame_x0 = _cur_x0; _frame_y0 = _cur_y0;
				_frame_x1 = _cur_x1; _frame_y1 = _cur_y1;
			};
			if ((_cur_x0 <= _cur_x1) AND (_cur_y0 > _cur_y1)) then {
				_frame_x0 = _cur_x0; _frame_y0 = _cur_y1;
				_frame_x1 = _cur_x1; _frame_y1 = _cur_y0;
			};
			if ((_cur_x0 > _cur_x1) AND (_cur_y0 <= _cur_y1)) then {
				_frame_x0 = _cur_x1; _frame_y0 = _cur_y0;
				_frame_x1 = _cur_x0; _frame_y1 = _cur_y1;
			};
			{
				_screenPos = worldToScreen (getPosVisual _x);
				if (count _screenPos != 0) then {
					_obj_x = _screenPos select 0;
					_obj_y = _screenPos select 1;
					if ((_obj_x > _frame_x0) AND (_obj_x < _frame_x1)) then {
						if ((_obj_y > _frame_y0) AND (_obj_y < _frame_y1)) then {
							if (typeOf _x == PIVOT) then {
								_framedPivots pushBack _x;
							} else {
								_framedObjects pushBack _x;
							};
						};
					};
				}; 
			} forEach (ct_var_builtObjects + ct_var_builtPivots);
			if (!_shift AND !_ctrl AND !_alt) then {
				["clean"] call CT_fnc_drawSelection;
				call CT_fnc_clearSelect;
				{
					["multi","default",_x] call CT_fnc_cursorSelect;
				} forEach _framedObjects;
				if (count _framedObjects == 0) then {
					if (count _framedPivots > 0) then {
						["single","default",(_framedPivots select 0)] call CT_fnc_cursorSelect;
					};
				};
			};
			if (_shift AND !_ctrl AND !_alt) then {
				{
					if (!(_x in ct_var_selDrawIcons)) then {
						["multi","default",_x] call CT_fnc_cursorSelect;
					};
				} forEach _framedObjects;
			};
			if (!_shift AND !_ctrl AND _alt) then {
				{
					if (_x in ct_var_selDrawIcons) then {
						["multi","default",_x] call CT_fnc_cursorSelect;
					};
				} forEach _framedObjects;
			};
			if (_shift AND _ctrl AND !_alt) then {
				if (count _framedPivots > 0) then {
					["single","default",(_framedPivots select 0)] call CT_fnc_cursorSelect;
				};
			};
		};
		ct_var_frameSelect deleteRange [0,2];
	};
};
if (_button == DIK_RMB) then {
	CT_var_forceCamRotate = false;
};

((findDisplay 25252) displayCtrl 101) ctrlSetPosition [-10, -10, 0, 0];
((findDisplay 25252) displayCtrl 101) ctrlCommit 0;
