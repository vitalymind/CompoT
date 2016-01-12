/* 
   File: fn_OM_setValue.sqf 
   Function: ct_fnc_OM_setValue
   Folder: OptionMenu
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp"

private ["_case","_value"];
_case = _this select 0;
_value = _this select 1;

if (_case == "objRotate") exitWith {
	ct_var_rotateAngle = _value;
};
if (_case == "objHeight") exitWith {
	ct_var_heightChange = _value;
};
if (_case == "compoRadius") exitWith {
	ct_var_radiusChange = _value;
};
if (_case == "objSelect") exitWith {
	ct_var_selectRange = _value;
};
if (_case == "camRotate") exitWith {
	ct_var_camRotateSpeed = _value;
};
if (_case == "camMove") exitWith {
	ct_var_camSpeed = _value;
};