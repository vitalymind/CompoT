/* 
   File: fn_OS_handleKeyDown.sqf 
   Function: CT_fnc_OS_handleKeyDown 
   Folder: ObjectSelectGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_key","_handled","_shift","_groupByCombo","_categories"];
_key = _this select 1;
_shift = _this select 2;
_groupByCombo = (findDisplay 25259) displayCtrl 350;
_categories = if ((_groupByCombo lbText (lbCurSel _groupByCombo)) == "category") then {true} else {false};
_handled = false;
if (_key == DIK_SPACE) then {_handled = true;(findDisplay 25259) closeDisplay 0;};
if (_key == OS_FAST_FORWARD) then {_handled = true;[32,-1] call CT_fnc_OS_scroll;};
if (_key == OS_FAST_BACKWARD) then {_handled = true;[32,1] call CT_fnc_OS_scroll;};
if ((_key == DIK_ARROW_UP) AND !_shift) then {_handled = true;[8,1] call CT_fnc_OS_scroll;};
if ((_key == DIK_ARROW_UP) AND _shift) then {_handled = true;[32,1] call CT_fnc_OS_scroll;};
if ((_key == DIK_ARROW_DOWN) AND !_shift) then {_handled = true;[8,-1] call CT_fnc_OS_scroll;};
if ((_key == DIK_ARROW_DOWN) AND _shift) then {_handled = true;[32,-1] call CT_fnc_OS_scroll;};
if ((_key == DIK_ARROW_LEFT) AND _categories) then {
	_handled = true;
	[-1, "category"] call CT_fnc_handleBuildToolMouseWheel;
	call CT_fnc_clearPreview;
	[true] call CT_fnc_OS_groupBy;
};
if ((_key == DIK_ARROW_RIGHT) AND _categories) then {
	_handled = true;
	[1, "category"] call CT_fnc_handleBuildToolMouseWheel;
	call CT_fnc_clearPreview;
	[true] call CT_fnc_OS_groupBy;
};
_handled;