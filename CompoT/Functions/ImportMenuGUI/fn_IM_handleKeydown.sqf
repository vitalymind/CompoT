/* 
   File: fn_IM_handleKeydown.sqf 
   Function: CT_fnc_IM_handleKeydown 
   Folder: ImportMenuGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_key","_dialog","_importList","_index"];
_key = _this;
_dialog = findDisplay 25261;
_importList = _dialog displayCtrl 400;
if (_key == DIK_DELETE) then {
	_index = lbCurSel _importList;
	if (_index == -1) exitWith {};
	_importList lbDelete _index;
	CT_var_IM_importOptions deleteAt _index;
	_importList lbSetCurSel _index;
	if (count CT_var_IM_importOptions == 0) then {
		{ctrlShow [_x, false]}forEach [501,502,503,504,203,204,205];
		(_dialog displayCtrl 301) ctrlSetText "";
		(_dialog displayCtrl 302) ctrlSetText "";
		(_dialog displayCtrl 303) ctrlSetText "";
		(_dialog displayCtrl 304) ctrlSetText "";
	};
};