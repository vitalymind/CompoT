/* 
   File: fn_buildMainPivot.sqf 
   Function: CT_fnc_buildMainPivot
   Folder: BuildTool
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp"

private ["_center"];
if (!IsNull ct_var_mainPivot) then {deleteVehicle ct_var_mainPivot};

if ((getMarkerType "center") == "") then {
	_center = (configfile >> "CfgWorlds" >> worldName >> "centerPosition") call BIS_fnc_getCfgData;
	_center set [2,0];
	createMarkerLocal ["center", _center];
	ct_var_mainPivot = CENTER_PIVOT createVehicleLocal _center;
	ct_var_mainPivot setDir 0;
	ct_var_mainPivot setPosATL _center;
} else {
	_center = getMarkerPos "center";
	_center set [2,0];
	ct_var_mainPivot = CENTER_PIVOT createVehicleLocal _center;
	ct_var_mainPivot setDir 0;
	ct_var_mainPivot setPosATL _center;
};
[ct_var_mainPivot, 0, 0] call CT_fnc_setPB;
ct_var_mainPivot setVariable ["name","Main"];
ct_var_mainPivot setVariable ["size",0];
ct_var_mainPivot setVariable ["forbidden",[]];
ct_var_mainPivot setVariable ["childObjects",[]];
ct_var_mainPivot setVariable ["childPivots",[]];