/* 
   File: fn_OS_draw.sqf 
   Function: CT_fnc_OS_draw 
   Folder: ObjectSelectGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_elements","_count","_dialog","_ctrlImage","_ctrlText","_element","_classname"];
_elements = _this;
_dialog = displayNull;
_offset1 = 0;
_offset2 = 0;
if ((uinameSpace getVariable ["CT_var_gui_runMode",""]) == "3den") then {
	_dialog = findDisplay 313;
	_offset1 = 758500;
	_offset2 = 758600;
} else {
	_dialog = findDisplay 25259;
	_offset1 = 200;
	_offset2 = 400;
};

_count = count _elements;
if (_count > 32) exitWith {};
if (_count < 32) then {
	for "_i" from 1 to (32 - _count) do {
		_elements pushBack 0;
	};
};

for "_i" from 1 to 32 do {
	_element = _elements select (_i - 1);
	_ctrlImage = _dialog displayCtrl (_i + _offset1);
	_ctrlText = _dialog displayCtrl (_i + _offset2);
	if (typeName _element == "SCALAR") then {
		_ctrlImage ctrlShow false;
		_ctrlText ctrlShow false;
	};
	if (typeName _element == "ARRAY") then {
		_classname = _element select 0;
		_ctrlImage ctrlShow true;
		_ctrlText ctrlShow true;
		_ctrlText ctrlEnable false;
		_image = _classname call CT_fnc_OS_getImage;
		_ctrlImage ctrlSetText _image;
		_ctrlText ctrlSetText _classname;
	};
};