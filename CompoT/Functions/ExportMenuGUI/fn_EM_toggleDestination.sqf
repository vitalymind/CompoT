/* 
   File: fn_EM_toggleDestination.sqf 
   Function: CT_fnc_EM_toggleDestination 
   Folder: ExportMenuGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_destination","_toClipCheck","_toDispCheck"];
_destination = _this;
_dialog = findDisplay 25260;
_toClipCheck = _dialog displayCtrl 300;
_toDispCheck = _dialog displayCtrl 301;
if (_destination == "clip") then {
	_toClipCheck cbSetChecked true;
	_toDispCheck cbSetChecked false;
	ctrlShow [500, false];
};
if (_destination == "disp") then {
	_toClipCheck cbSetChecked false;
	_toDispCheck cbSetChecked true;
	ctrlShow [500, true];
};