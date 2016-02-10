/* 
   File: fn_cursorRotate.sqf 
   Function: CT_fnc_cursorRotate 
   Folder: SelectTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_direction","_angle","_object","_type","_pivots","_pivot","_objects","_pos","_commonCenter"];
_direction = _this select 0;
_type = _this select 1;
_angle = CT_var_rotateAngle * _direction;
if SOMETHING_SELECTED then {
	if (CT_var_rotateMode == "individual") then {
		if (SEL_STATE in ["empty","busy"]) then {
			_pivots = [];
			{
				_object = _x select 0;
				if ((typeOf _object == PIVOT) AND (SEL_STATE != "empty")) exitWith {};
				[SEL_LIB, _object, _angle,_type] call CT_fnc_rotateObject;
				if (SEL_LIB == "object") then {
					_pivot = _object getVariable "pivot";
					if (!(_pivot in _pivots)) then {_pivots pushBack _pivot};
				};
			} forEach SELECTION;
			call CT_fnc_reDrawSelection;
			
			//SAVING
			if (SEL_LIB == "pivot") then {
				[(_object getVariable "pivot")] call CT_fnc_saveElement;
				[_object] call CT_fnc_saveElement;
				[_object, (_object getVariable "pivot")] call CT_fnc_cloneComposition;
			};
			if (SEL_LIB == "object") then {
				{[_x] call CT_fnc_saveElement} forEach _pivots;
				_pivots call CT_fnc_cloneComposition;
			};
		};
	};
	if (CT_var_rotateMode == "common") then {
		if (SEL_STATE in ["empty","busy"]) then {
			if (SEL_LIB == "pivot") then {
				_object = FIRST_SELECTION;
				if (SEL_STATE != "empty") exitWith {};
				[SEL_LIB, _object, _angle,_type] call CT_fnc_rotateObject;
				call CT_fnc_reDrawSelection;
				[(_object getVariable "pivot")] call CT_fnc_saveElement;
				[_object] call CT_fnc_saveElement;
				[_object, (_object getVariable "pivot")] call CT_fnc_cloneComposition;
			};
			if (SEL_LIB == "object") then {
				if (SEL_STATE == "busy") exitWith {};
				_objects = []; _pivots = [];
				_commonCenter = CT_var_cursor;
				if (!isNull CT_var_cursorBestSelect) then {_commonCenter = CT_var_cursorBestSelect};
				{
					_objects pushBack (_x select 0);
					_pivot = (_x select 0) getVariable "pivot";
					if (!(_pivot in _pivots)) then {_pivots pushBack _pivot};
				} forEach SELECTION;
				if (_commonCenter in _objects) then {_objects = _objects - [_commonCenter]};
				_pos = getPosATL _commonCenter;
				_pos set [2,0];
				["pivot", _commonCenter, _angle,"single",_pos,_objects,[]] call CT_fnc_rotateObject;
				call CT_fnc_reDrawSelection;
				{[_x] call CT_fnc_saveElement} forEach _pivots;
				_pivots call CT_fnc_cloneComposition;
			};
		};
	};
};