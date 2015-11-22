/* 
   File: fn_IM_toggleSource.sqf 
   Function: CT_fnc_IM_toggleSource 
   Folder: ImportMenuGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_source","_fromClipCheck","_fromDispCheck","_fromfileCheck","_dropEdit"];
_source = _this;
_dialog = findDisplay 25261;
_fromClipCheck = _dialog displayCtrl 200;
_fromDispCheck = _dialog displayCtrl 201;
_fromfileCheck = _dialog displayCtrl 202;
_dropEdit = _dialog displayCtrl 300;
if (_source == "clip") then {
	_fromClipCheck cbSetChecked true;
	_fromDispCheck cbSetChecked false;
	_fromfileCheck cbSetChecked false;
	_dropEdit ctrlSetText "";
	ctrlShow [300, false];
};
if (_source == "disp") then {
	_fromClipCheck cbSetChecked false;
	_fromDispCheck cbSetChecked true;
	_fromfileCheck cbSetChecked false;
	ctrlShow [300, true];
	_dropEdit ctrlSetText "";
};
if (_source == "file") then {
	_fromClipCheck cbSetChecked false;
	_fromDispCheck cbSetChecked false;
	_fromfileCheck cbSetChecked true;
	ctrlShow [300, true];
	_dropEdit ctrlSetText "CT_import.sqf";
};