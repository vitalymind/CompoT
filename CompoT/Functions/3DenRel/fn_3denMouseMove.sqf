/* 
   File: fn_3denMouseMove.sqf 
   Function: CT_fnc_3denMouseMove
   Folder: 3DenRel 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 

*/ 
#include "defines.hpp"
	
if (!(uinamespace getVariable ["CT_var_gui_editorLoaded", false])) exitWith {};

private ["_display","_ctrlX","_ctrlY","_posX","_posY","_intersections","_obj"];
_obj = uinamespace getVariable ["CT_var_gui_pickedObject", objNull];
if (!isNull _obj) then {
	_display = findDisplay 313;
	_ctrlX = _display displayCtrl 1052;
	_ctrlY = _display displayCtrl 1053;
	_posX = ctrlText _ctrlX;
	_posY = ctrlText _ctrlY;
	_posX = parseNumber _posX;
	_posY = parseNumber _posY;
	_intersections = lineIntersectsSurfaces [getPosASL get3DENCamera, [_posX, _posY, (getTerrainHeightASL [_posX, _posY])], _obj, objNull, true, 1];
	if (count _intersections != 0) then {
		_obj setPosASL ((_intersections select 0) select 0);
	} else {
		_obj setposATL [_posX, _posY, 0];
	};
};