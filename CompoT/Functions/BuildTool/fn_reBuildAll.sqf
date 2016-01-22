/* 
   File: fn_reBuildAll.sqf 
   Function: CT_fnc_reBuildAll 
   Folder: BuildTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_map","_pivotPos","_pivotDir","_elementLib","_elementName","_elementRelPos","_elementRelDir","_alignment","_elementData"];
_map = [CT_var_mainPivot] call CT_fnc_mapComposition;
_map = _map select 0;
_map = call compile _map;
call CT_fnc_deleteAll;
_pivotPos = getPosATL CT_var_mainPivot;
_pivotDir = getDir CT_var_mainPivot;
{
	_elementLib = _x select 0;
	_elementName = _x select 1;
	_elementRelPos = _x select 2;
	_elementRelDir = _x select 3;
	_alignment =  [_x, 4, "sea"] call BIS_fnc_param;
	_elementData = [];
	
	if (_elementLib in ["collection","prefab","composition"]) then {
		_elementData = [(["normal",_elementName,_elementLib] call CT_fnc_findBuildable),_elementRelPos,_elementRelDir,_alignment];
	};

	if (_elementLib == "object") then {
		_elementData = [_elementName,_elementRelPos,_elementRelDir,_alignment];
	};
	if (count _elementData != 0) then {
		["normal", _elementLib, ["asChild", _elementData],_pivotPos,_pivotDir,CT_var_mainPivot,"exact"] call CT_fnc_build;
	};
} forEach (_map select 2);
["clean"] call CT_fnc_drawSelection;
call CT_fnc_clearSelect;

["Project rebuilt"] call CT_fnc_notification;