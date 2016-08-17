/* 
   File: fn_syncWith3Den.sqf 
   Function: CT_fnc_syncWith3Den
   Folder: 3DenRel 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp"

private ["_project","_curProjectName"];
uiNameSpace setVariable ["CT_var_gui_camera",[
	getPosATL CT_var_cam,
	getDir CT_var_cam,
	CT_var_cam call CT_fnc_getPB
]];
_curProjectName = (uinamespace getVariable "CT_var_gui_curProject") select 0;

_project = [CT_var_mainPivot] call CT_fnc_exportStructure;
_project = call compile _project;
_project set [0, _curProjectName];

(uinamespace getVariable "CT_var_gui_curProject") deleteRange [0, 10];
(uinamespace getVariable "CT_var_gui_curProject") append _project;

private _hiddenObjects = [];
{
	_model = _x getVariable ["model",""];
	_position = _x getVariable ["position",[]];
	_hiddenObjects pushBack [_position,_model];
} forEach ct_var_subCubes;
uiNamespace setVariable ["ct_var_hiddenObjects",_hiddenObjects];