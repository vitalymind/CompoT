/* 
   File: fn_handleKeyUp.sqf 
   Function: CT_fnc_handleKeyUp 
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

if (_shift) then {["shift", false] call CT_fnc_toggleKeys};
if (_ctrlKey) then {["ctrl", false] call CT_fnc_toggleKeys};
if (_alt) then {["alt", false] call CT_fnc_toggleKeys};

if (CT_var_openedGUI) exitWith {false};

if (_dikCode == DIK_UP) then {_handled = true; ["up", false] call CT_fnc_toggleKeys};
if (_dikCode == DIK_DOWN) then {_handled = true; ["down", false] call CT_fnc_toggleKeys};
if (_dikCode == DIK_FORW) then {_handled = true; ["forw", false] call CT_fnc_toggleKeys};
if (_dikCode == DIK_BACK) then {_handled = true; ["back", false] call CT_fnc_toggleKeys};
if (_dikCode == DIK_LEFT) then {_handled = true; ["left", false] call CT_fnc_toggleKeys};
if (_dikCode == DIK_RGHT) then {_handled = true; ["rght", false] call CT_fnc_toggleKeys};

if (!_shift && !_ctrlKey && !_alt) then {
};

_handled; 