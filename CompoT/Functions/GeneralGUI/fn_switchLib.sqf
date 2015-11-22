/* 
   File: fn_switchLib.sqf 
   Function: CT_fnc_switchLib 
   Folder: GeneralGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_key","_lib","_handled"];
_key = _this select 0;
_lib = _this select 1;
_handled = false;
if (_key == DIK_F5) then {
	if (_lib == "object") exitWith {(findDisplay 25250) closeDisplay 0};
	if (_lib == "composition") then {(findDisplay 25256) closeDisplay 0};
	if (_lib == "collection") then {(findDisplay 25257) closeDisplay 0};
	if (_lib == "prefab") then {(findDisplay 25258) closeDisplay 0};
	[] spawn {sleep 0.01; call CT_fnc_ObL_openGUI;};
	_handled = true;
};
if (_key == DIK_F6) then {
	if (_lib == "composition") exitWith {(findDisplay 25256) closeDisplay 0};
	if (_lib == "object") then {(findDisplay 25250) closeDisplay 0};
	if (_lib == "collection") then {(findDisplay 25257) closeDisplay 0};
	if (_lib == "prefab") then {(findDisplay 25258) closeDisplay 0};
	[] spawn {sleep 0.01; call CT_fnc_CmL_openGUI;};
	_handled = true;
};
if (_key == DIK_F7) then {
	if (_lib == "collection") exitWith {(findDisplay 25257) closeDisplay 0};
	if (_lib == "object") then {(findDisplay 25250) closeDisplay 0};
	if (_lib == "composition") then {(findDisplay 25256) closeDisplay 0};
	if (_lib == "prefab") then {(findDisplay 25258) closeDisplay 0};
	[] spawn {sleep 0.01; call CT_fnc_CiL_openGUI;};
	_handled = true;
};
if (_key == DIK_F8) then {
	if (_lib == "prefab") exitWith {(findDisplay 25258) closeDisplay 0};
	if (_lib == "object") then {(findDisplay 25250) closeDisplay 0};
	if (_lib == "composition") then {(findDisplay 25256) closeDisplay 0};
	if (_lib == "collection") then {(findDisplay 25257) closeDisplay 0};
	[] spawn {sleep 0.01; call CT_fnc_PrL_openGUI;};
	_handled = true;
};
_handled;