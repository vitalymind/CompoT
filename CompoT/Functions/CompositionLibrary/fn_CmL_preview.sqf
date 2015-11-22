/* 
   File: fn_CmL_preview.sqf 
   Function: CT_fnc_CmL_preview 
   Folder: CompositionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_list","_index"];
_dialog = findDisplay 25256;
_list = controlNull;
if (_this == "left") then {
	_list = _dialog displayCtrl 100;
};
if (_this == "right") then {
	_list = _dialog displayCtrl 101;
};
if (_this == "category") exitWith {
};
_index = lbCurSel _list;
call CT_fnc_clearPreview;
if (_index == -1) exitWith {};
_element = _list lbData _index;
if (_element != "") then {_element = call compile _element} else {_element = []};
if (count _element == 0) exitWith {};
[_element, "composition"] call CT_fnc_makePreview;
[(_element select 1)] call CT_fnc_CmL_setCam;