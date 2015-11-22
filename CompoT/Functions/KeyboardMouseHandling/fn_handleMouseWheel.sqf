/* 
   File: fn_handleMouseWheel.sqf 
   Function: CT_fnc_handleMouseWheel 
   Folder: KeyboardMouseHandling 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_direction","_shift","_ctrl","_alt"];
if (CT_var_openedGUI) exitWith {false};
if (count CT_var_btc != 0) exitWith {false};

_shift = CT_var_holdenKeys select 7;
_ctrl = CT_var_holdenKeys select 6;
_alt = CT_var_holdenKeys select 8;

_direction = _this select 1;
if (_direction > 0) then {_direction = 1};
if (_direction < 0) then {_direction = -1};

if (!_shift AND !_ctrl AND !_alt) then {_direction call CT_fnc_adjustCamSpeed};

switch (CT_var_cursorTool) do {
	case "buildTool": {
		if (_shift AND _ctrl AND !_alt) then {[_direction, "category"] call CT_fnc_handleBuildToolMouseWheel};
		if (!_shift AND _ctrl AND !_alt) then {[_direction, "element"] call CT_fnc_handleBuildToolMouseWheel};
		if (_shift AND !_ctrl AND !_alt) then {[_direction] call CT_fnc_rotateBuildTool};
		if (!_shift AND !_ctrl AND _alt) then {[_direction] call CT_fnc_liftBuildTool};
	};
	case "selectTool": {
		if (_direction call CT_fnc_handleSpecialGrabWheel) exitWith {};
		if (_shift AND !_ctrl AND !_alt) then {[_direction, "single"] call CT_fnc_cursorRotate};
		if (_shift AND _ctrl AND !_alt) then {[_direction, "multi"] call CT_fnc_cursorRotate};
		if (!_shift AND !_ctrl AND _alt) then {[_direction, "single"] call CT_fnc_cursorLift};
		if (_shift AND !_ctrl AND _alt) then {[_direction, "multi"] call CT_fnc_cursorLift};
		if (!_shift AND _ctrl AND !_alt) then {_direction call CT_fnc_cursorChangeRadius};
	};
};

true;