/* 
   File: fn_OS_selectObject.sqf 
   Function: CT_fnc_OS_selectObject 
   Folder: ObjectSelectGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_ctrl","_dialog","_check","_index","_element"];
_dialog = displayNull;
_offset = 200;
if ((uinameSpace getVariable ["CT_var_gui_runMode",""]) == "3den") then {
	_dialog = findDisplay 313;
	_offset = 758500;
} else {
	_dialog = findDisplay 25259;
};
_ctrl = _this select 0;
_index = -1;
for "_i" from (_offset + 1) to (_offset + 32) do {
	_check = _dialog displayCtrl _i;
	if (_check == _ctrl) exitWith {_index = (_i - _offset)};
};
if (_index == -1) exitWith {};
_element = [];
if (CT_var_OS_searchText == "") then {
	_element = CT_var_OS_shownObjects select (_index + CT_var_OS_scrollPos - 1);
} else {
	_element = CT_var_OS_shownSearchResults select (_index + CT_var_OS_searchScrollPos - 1);
};
if (count _element == 0) exitWith {};
if ((uinameSpace getVariable ["CT_var_gui_runMode",""]) == "3den") then {
	_veh = createVehicle [(_element select 0),[0,0,0], [], 0, "CAN_COLLIDE"];
	_veh setDir 0;
	[_veh,0,0] call ct_fnc_setPB;
	uinamespace setVariable ["CT_var_gui_pickedObject", _veh];
	uinamespace setVariable ["CT_var_gui_pickedObjectClass", (_element select 0)];
	call CT_fnc_OS_closeGUI;
	[] spawn {
		while {!isNull(uinamespace getVariable ["CT_var_gui_pickedObject", objNull])} do {
			sleep 0.01;
			uinamespace setvariable ["bis_fnc_3DENControlsHint_place",["Land_TentA_F",false]];
			["loop","CreateObject"] call BIS_fnc_3DENControlsHint;
		};
		uinamespace setvariable ["bis_fnc_3DENControlsHint_place",[""]];
	};
} else {
	(CT_var_buildMode select 0) set [1, (_element select 6)];
	(CT_var_buildMode select 0) set [2, (_element select 7)];
	call CT_fnc_pickCurrentBuildable;
	(findDisplay 25259) closeDisplay 0;
};





