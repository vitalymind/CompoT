/* 
   File: fn_cursorFindClosestObject.sqf 
   Function: CT_fnc_cursorFindClosestObject 
   Folder: Cursor 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_result","_distance", "_check","_objects","_case","_filter"];
_objects = [_this, 0, [], [[]]] call BIS_fnc_param;
_case = [_this, 1, "normal", [""]] call BIS_fnc_param;
_filter = [_this, 2, "default", [""]] call BIS_fnc_param;
_result = objNull;
_distance = 999999;
if (count _objects == 0) then {
	if (_filter in ["default","objects"]) then {
		{
			_check = CT_var_cursor distance _x;
			if (_distance > _check) then {_distance = _check;_result = _x};
		} forEach CT_var_builtObjects;
	};
	if (_filter in ["default","pivot"]) then {
		{
			_check = CT_var_cursor distance _x;
			if (_distance > _check) then {_distance = _check;_result = _x};
		} forEach CT_var_builtPivots;
	};
} else {
	{
		_check = CT_var_cursor distance _x;
		if (_distance > _check) then {_distance = _check;_result = _x};
	} forEach _objects;
};
if (_case == "normal") then {
	if ((CT_var_cursor distance _result) > CT_var_selectRange) then {_result = objNull};
};
if (!isNull CT_var_cursorBestSelect) then {_result = CT_var_cursorBestSelect};
_result;