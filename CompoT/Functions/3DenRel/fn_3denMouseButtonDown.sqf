/* 
   File: fn_3denMouseButtonDown.sqf 
   Function: CT_fnc_3denMouseButtonDown
   Folder: 3DenRel 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 

*/ 
#include "defines.hpp"
	
if (!(uinamespace getVariable ["CT_var_gui_editorLoaded", false])) exitWith {};
private ["_button","_shift","_ctrl","_alt","_obj","_class"];

_button = _this select 1;
_shift = _this select 4;
_ctrl = _this select 5;
_alt = _this select 6;
_handled = false;

_obj = uinamespace getVariable ["CT_var_gui_pickedObject", objNull];
if (!isNull _obj) then {
	if (_button == DIK_LMB) then {
		_handled = true;
		_class = uinamespace getVariable ["CT_var_gui_pickedObjectClass",""];
		create3DENEntity ["Object", _class, getPos _obj];
		if (!_ctrl) then {
			deleteVehicle _obj;
			uinamespace setVariable ["CT_var_gui_pickedObject", objNull];
			uinamespace setVariable ["CT_var_gui_pickedObjectClass", ""];
		};
	};
	if (_button == DIK_RMB) then {
		_handled = true;
		deleteVehicle _obj;
		uinamespace setVariable ["CT_var_gui_pickedObject", objNull];
		uinamespace setVariable ["CT_var_gui_pickedObjectClass", ""];
	};
};
_handled;