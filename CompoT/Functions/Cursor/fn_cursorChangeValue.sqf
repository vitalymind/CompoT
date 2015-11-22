/* 
   File: fn_cursorChangeValue.sqf 
   Function: CT_fnc_cursorChangeValue 
   Folder: Cursor 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_case","_direction","_newValue"];
_case = _this select 0;
_direction = _this select 1;
switch (CT_var_valueBeingChanged) do {
	case "rotateAngle": {
		if (_case == "change") exitWith {
			CT_var_valueBeingChanged = if (_direction == 1) then {["Selecting range adjust mode"] call CT_fnc_notification; "selectRange";} 
			else {["Composition radius adjust mode"] call CT_fnc_notification; "radiusChange";};
		};
		if (_case == "adjust") exitWith {
			_newValue = CT_var_rotateAngle + (ANGLE_CHANGE * _direction);
			_newValue = _newValue max 0 min 179;
			if ((_newValue != 0) AND (_newValue != 179)) then {
				CT_var_rotateAngle = _newValue;
				[format ["Rotate angle value set to: %1", _newValue]] call CT_fnc_notification;
			};
		};
	};
	case "selectRange": {
		if (_case == "change") exitWith {
			CT_var_valueBeingChanged = if (_direction == 1) then {["Object height adjust mode"] call CT_fnc_notification; "heightChange";} 
			else {["Rotate angle adjust mode"] call CT_fnc_notification; "rotateAngle";};
			
		};
		if (_case == "adjust") exitWith {
			_newValue = CT_var_selectRange + (RADIUS_CHANGE * _direction);
			_newValue = _newValue max 0 min 100;
			if ((_newValue != 0) AND (_newValue != 100)) then {
				CT_var_selectRange = _newValue;
				[format ["Select range value set to: %1", _newValue]] call CT_fnc_notification;
			};
		};
	};
	case "heightChange": {
		if (_case == "change") exitWith {
			CT_var_valueBeingChanged = if (_direction == 1) then {["Composition radius adjust mode"] call CT_fnc_notification; "radiusChange";} 
			else {["Selecting range adjust mode"] call CT_fnc_notification; "selectRange";};
		};
		if (_case == "adjust") exitWith {
			_newValue = CT_var_heightChange + (HEIGHT_CHANGE * _direction);
			_newValue = _newValue max 0 min 20;
			if ((_newValue != 0) AND (_newValue != 20)) then {
				CT_var_heightChange = _newValue;
				[format ["Height change value set to: %1", _newValue]] call CT_fnc_notification;
			};
		};
	};
	case "radiusChange": {
		if (_case == "change") exitWith {
			CT_var_valueBeingChanged = if (_direction == 1) then {["Rotate angle adjust mode"] call CT_fnc_notification; "rotateAngle";} 
			else {["Object height adjust mode"] call CT_fnc_notification; "heightChange";};
		};
		if (_case == "adjust") exitWith {
			_newValue = CT_var_radiusChange + (RADIUS_CHANGE * _direction);
			_newValue = _newValue max 0 min 20;
			if ((_newValue != 0) AND (_newValue != 20)) then {
				CT_var_radiusChange = _newValue;
				[format ["Radius change value set to: %1", _newValue]] call CT_fnc_notification;
			};
		};
	};
};