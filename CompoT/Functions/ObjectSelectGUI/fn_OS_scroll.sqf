/* 
   File: fn_OS_scroll.sqf 
   Function: CT_fnc_OS_scroll 
   Folder: ObjectSelectGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_direction","_shift","_ctrl","_alt","_count","_objects","_speed","_groupByCombo","_categories","_catCombo","_dialog","_nextSel"];
_speed = _this select 0;
_groupByCombo = controlNull;
if ((uinameSpace getVariable ["CT_var_gui_runMode",""]) == "3den") then {
	_groupByCombo = (findDisplay 313) displayCtrl CT_OSMGROUPBY_IDC;
} else {
	_groupByCombo = (findDisplay 25259) displayCtrl 350;
};

_shift = CT_var_holdenKeys select 7;
_ctrl = CT_var_holdenKeys select 6;
_alt = CT_var_holdenKeys select 8;

_direction = _this select 1;
if (_direction > 0) then {_direction = -1} else {
	if (_direction < 0) then {_direction = 1};
};

_categories = if ((_groupByCombo lbText (lbCurSel _groupByCombo)) == "category") then {true} else {false};
if (_alt AND _categories AND ((uinameSpace getVariable ["CT_var_gui_runMode",""]) != "3den")) exitWith {
	[_direction, "category"] call CT_fnc_handleBuildToolMouseWheel;
	call CT_fnc_clearPreview;
	[true] call CT_fnc_OS_groupBy;
};
if (_alt AND _categories AND ((uinameSpace getVariable ["CT_var_gui_runMode",""]) == "3den")) exitWith {
	_dialog = findDisplay 313;
	_catCombo = _dialog displayCtrl CT_OSMCATCOMBO_IDC;
	_nextSel = ((lbCurSel _catCombo) + _direction) max 0 min ((lbSize _catCombo) - 1);
	if (_nextSel == (lbCurSel _catCombo)) exitWith {};
	_catCombo lbSetCurSel _nextSel;
};

if (CT_var_OS_searchText == "") then {
	_count = count CT_var_OS_shownObjects;
	_newScrollPos = CT_var_OS_scrollPos + (_speed * _direction);
	if (_newScrollPos < 0) exitWith {CT_var_OS_scrollPos = 0};
	if ((_newScrollPos + 24) > _count) exitWith {};
	CT_var_OS_scrollPos = _newScrollPos;
	_objects = CT_var_OS_shownObjects select [CT_var_OS_scrollPos,32];
} else {
	_count = count CT_var_OS_shownSearchResults;
	_newScrollPos = CT_var_OS_searchScrollPos + (_speed * _direction);
	if (_newScrollPos < 0) exitWith {CT_var_OS_searchScrollPos = 0};
	if ((_newScrollPos + 24) > _count) exitWith {};
	CT_var_OS_searchScrollPos = _newScrollPos;
	_objects = CT_var_OS_shownSearchResults select [CT_var_OS_searchScrollPos,32];
};
_objects call CT_fnc_OS_draw;