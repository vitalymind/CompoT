/* 
   File: fn_3denKeyUp.sqf 
   Function: CT_fnc_3denKeyUp
   Folder: 3DenRel 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 

*/ 
#include "defines.hpp"

if (!(uinamespace getVariable ["CT_var_gui_editorLoaded", false])) exitWith {};
private ["_handled", "_dikCode", "_shift", "_ctrlKey", "_alt"];

_dikCode = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_handled = false;

if (_shift) then {["shift", false] call CT_fnc_toggleKeys};
if (_ctrlKey) then {["ctrl", false] call CT_fnc_toggleKeys};
if (_alt) then {["alt", false] call CT_fnc_toggleKeys};

_handled; 