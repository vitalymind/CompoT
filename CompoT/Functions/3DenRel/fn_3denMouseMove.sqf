/* 
   File: fn_3denMouseMove.sqf 
   Function: CT_fnc_3denMouseMove
   Folder: 3DenRel 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 

*/ 
#include "defines.hpp"
	
if (!(uinamespace getVariable ["CT_var_gui_editorLoaded", false])) exitWith {};

private ["_display","_ctrlX","_ctrlY","_posX","_posY"];
_obj = uinamespace getVariable ["CT_var_gui_pickedObject", objNull];
if (!isNull _obj) then {
	_display = findDisplay 313;
	_ctrlX = _display displayCtrl 1052;
	_ctrlY = _display displayCtrl 1053;
	_posX = ctrlText _ctrlX;
	_posY = ctrlText _ctrlY;
	_posX = parseNumber _posX;
	_posY = parseNumber _posY;
	_obj setposATL [_posX, _posY, 0];
};