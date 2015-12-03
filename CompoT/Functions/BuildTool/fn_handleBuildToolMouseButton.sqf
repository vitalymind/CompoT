/* 
   File: fn_handleBuildToolMouseButton.sqf 
   Function: CT_fnc_handleBuildToolMouseButton 
   Folder: BuildTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_type","_button","_libraryName","_categoryIndex","_elementIndex","_searhResult","_pos","_pivot","_element","_name","_naming"];
_button = _this select 0;
_type = _this select 1;
if (_button == DIK_LMB) then {
	if (count CT_var_builtPreview == 0) exitWith {};
	_libraryName = (CT_var_buildMode select 0) select 0;
	_categoryIndex = (CT_var_buildMode select 0) select 1;
	_elementIndex = (CT_var_buildMode select 0) select 2;
	_searhResult = [_libraryName,_categoryIndex,_elementIndex] call CT_fnc_getBuildable;
	if (count _searhResult == 0) exitWith {};
	_element = _searhResult select 2;
	_pos = getPosATL CT_var_cursor;
	_pos set [2,0];
	
	if (_libraryName in ["object","collection"]) then {
		_pos set [2,CT_var_buildToolHeight];
	};
	
	_pivot = CT_var_mainPivot;
	if SOMETHING_SELECTED then {
		if (SEL_LIB == "pivot") then {
			_pivot = FIRST_SELECTION;
		};
	};
	call CT_fnc_clearPreview;
	_naming = "exact";
	if (_type == "default") then {
		if (_libraryName == "composition") then {
			_naming = "random";
		};
	};
	
	[_libraryName, _element, _pos, _pivot,_naming] spawn { //Nasty hack, because of PhysX behaviour (physic calculations postponed to next frame, resulting in collision to object deleted in previous frame)
		_tc = count CT_var_btc; CT_var_btc pushBack _tc;
		sleep 0.01;
		["normal",(_this select 0),["asParent",(_this select 1)],(_this select 2),CT_var_buildToolAngle,(_this select 3),(_this select 4)] call CT_fnc_build;
		call CT_fnc_reDrawSelection;
		[(_this select 3)] call CT_fnc_saveElement;
		[(_this select 3)] call CT_fnc_cloneComposition;
		CT_var_btc = CT_var_btc - [_tc];
	};
	if (_type != "multy") then {"buildTool" call CT_fnc_cursorChangeTool};
};