/* 
   File: fn_IM_importProject.sqf 
   Function: CT_fnc_IM_importProject 
   Folder: ImportMenuGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_import","_newPos","_setupText","_tc"];
_import = _this select 0;
if (typeName _import != "ARRAY") exitWith {["Check input"] call CT_fnc_errorMsg};
_newPos = _import select 1;
_setupText = _import select 2;
if (count _newPos != 0) then {
	_newPos call CT_fnc_changeCenterPos;
};
[_setupText,CT_var_mainPivot] spawn {
	_tc = count CT_var_btc; CT_var_btc pushBack _tc;
	sleep 0.01;
	[_this select 0, _this select 1] call CT_fnc_importStructure;
	CT_var_btc = CT_var_btc - [_tc];
};