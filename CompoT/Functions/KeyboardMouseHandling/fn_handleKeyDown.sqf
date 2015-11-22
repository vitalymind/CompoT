/* 
   File: fn_handleKeyDown.sqf 
   Function: CT_fnc_handleKeyDown 
   Folder: KeyboardMouseHandling 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/
#include "defines.hpp" 

private ["_handled", "_dikCode", "_shift", "_ctrlKey", "_alt"];

_dikCode = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_handled = false;

if (_shift) then {["shift", true] call CT_fnc_toggleKeys};
if (_ctrlKey) then {["ctrl", true] call CT_fnc_toggleKeys};
if (_alt) then {["alt", true] call CT_fnc_toggleKeys};

if (CT_var_openedGUI) exitWith {false};

if (!_ctrlKey) then {
	if (_dikCode == DIK_UP) then {_handled = true; ["up", true] call CT_fnc_toggleKeys};
	if (_dikCode == DIK_DOWN) then {_handled = true; ["down", true] call CT_fnc_toggleKeys};
	if (_dikCode == DIK_FORW) then {_handled = true; ["forw", true] call CT_fnc_toggleKeys};
	if (_dikCode == DIK_BACK) then {_handled = true; ["back", true] call CT_fnc_toggleKeys};
	if (_dikCode == DIK_LEFT) then {_handled = true; ["left", true] call CT_fnc_toggleKeys};
	if (_dikCode == DIK_RGHT) then {_handled = true; ["rght", true] call CT_fnc_toggleKeys};
};

if (_dikCode == DIK_ESC) then {
	CT_var_holdenKeys = [false,false,false,false,false,false,false,false,false];
	CT_var_btc = [];
	CT_var_drawOrders = [];
	if SOMETHING_SELECTED then {
		_handled = true; ["release"] call CT_fnc_cursorGrab; ["clean"] call CT_fnc_drawSelection; call CT_fnc_clearSelect;
	} else {
		call CT_fnc_syncWith3Den;
	};
};

if (!_shift AND !_ctrlKey AND !_alt) then {
	if (_dikCode == DIK_F2) then {_handled = true;call CT_fnc_switchGUIMode};
	if (_dikCode == DIK_F3) then {_handled = true; call CT_fnc_EM_openGUI};
	if (_dikCode == DIK_F4) then {_handled = true; call CT_fnc_IM_openGUI};

	if (_dikCode == DIK_F5) then {_handled = true; call CT_fnc_ObL_openGUI};
	if (_dikCode == DIK_F6) then {_handled = true; call CT_fnc_CmL_openGUI};
	if (_dikCode == DIK_F7) then {_handled = true; call CT_fnc_CiL_openGUI};
	if (_dikCode == DIK_F8) then {_handled = true; call CT_fnc_PrL_openGUI};
	
	if (_dikCode == DIK_F11) then {_handled = true; call CT_fnc_closeEditor};
	
	if (_dikCode == DIK_SPACE) then {_handled = true; call CT_fnc_OS_openGUI;};
	
	if (_dikCode == DIK_1) then {_handled = true; "buildTool" call CT_fnc_cursorChangeTool};
	if (_dikCode == DIK_2) then {_handled = true; "selectTool" call CT_fnc_cursorChangeTool};
	if (_dikCode == DIK_DELETE) then {_handled = true; ["normal"] call CT_fnc_deleteObject};
	if (_dikCode == DIK_MINUS) then {_handled = true; ["adjust", -1] call CT_fnc_cursorChangeValue};
	if (_dikCode == DIK_PLUS) then {_handled = true; ["adjust", 1] call CT_fnc_cursorChangeValue};
	if (_dikCode == DIK_TAB) then {_handled = true; call CT_fnc_selectToolChangeSize; call CT_fnc_buildToolresetHeight;};
	if (_dikCode == DIK_CAPS) then {_handled = true; call CT_fnc_initMouseCursor};
	if (_dikCode == DIK_R) then {_handled = true; call CT_fnc_reclaimObject};
	if (_dikCode == DIK_T) then {_handled = true; call CT_fnc_toggleSlopeMode};
};
if (_shift AND !_ctrlKey AND !_alt) then {
	if (_dikCode == DIK_R) then {_handled = true; call CT_fnc_reclaimObjectsInRadius};
	if (_dikCode == DIK_F) then {_handled = true; call CT_fnc_buildPivot};
	if (_dikCode == DIK_DELETE) then {_handled = true; ["mass"] call CT_fnc_deleteObject};
	if (_dikCode == DIK_MINUS) then {_handled = true; ["change", -1] call CT_fnc_cursorChangeValue};
	if (_dikCode == DIK_PLUS) then {_handled = true; ["change", 1] call CT_fnc_cursorChangeValue};
};
if (!_shift AND _ctrlKey AND !_alt) then {
	if (_dikCode == DIK_R) then {_handled = true; call CT_fnc_changePivotOwner};
	if (_dikCode == DIK_C) then {_handled = true; ["normalCopy"] call CT_fnc_copy};
	if (_dikCode == DIK_D) then {_handled = true; ["cloneCopy"] call CT_fnc_copy};
	if (_dikCode == DIK_V) then {_handled = true; call CT_fnc_paste};
	if (_dikCode == DIK_F) then {_handled = true; [] call CT_fnc_scGUIOpen};
	if (_dikCode == DIK_Q) then {_handled = true; call CT_fnc_toggleRotateMode};
	if (_dikCode == DIK_E) then {_handled = true; [] call CT_fnc_reBuild};
	if (_dikCode == DIK_G) then {_handled = true; (getPosATL CT_var_cursor) call CT_fnc_changeCenterPos};
};
if (_shift AND _ctrlKey AND !_alt) then {
	if (_dikCode == DIK_DELETE) then {_handled = true; ["transfer"] call CT_fnc_deleteObject};
	if (_dikCode == DIK_E) then {_handled = true; call CT_fnc_reBuildAll};
	if (_dikCode == DIK_K) then {_handled = true; call CT_fnc_deleteAll};
};
if (!_shift AND !_ctrlKey AND _alt) then {
	if (_dikCode == DIK_R) then {_handled = true; call CT_fnc_resetOwner};
};
_handled;