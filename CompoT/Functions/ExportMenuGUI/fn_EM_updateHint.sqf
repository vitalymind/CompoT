/* 
   File: fn_EM_updateHint.sqf 
   Function: CT_fnc_EM_updateHint 
   Folder: ExportMenuGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_firstList","_secondList","_thirdList","_formatCombo","_toClipCheck","_toDispCheck","_hintText",
"_fl","_sl","_tl","_ef","_to","_tc","_text","_incTempCheck"];
_dialog = findDisplay 25260;
_firstList = _dialog displayCtrl 100;
_secondList = _dialog displayCtrl 101;
_thirdList = _dialog displayCtrl 102;
_formatCombo = _dialog displayCtrl 400;
_toClipCheck = _dialog displayCtrl 300;
_toDispCheck = _dialog displayCtrl 301;
_incTempCheck = _dialog displayCtrl 302;
_hintText = _dialog displayCtrl 600;

_fl = lbCurSel _firstList;
_sl = lbCurSel _secondList;
_ef = lbCurSel _formatCombo;
_tc = if (cbChecked _incTempCheck) then {true} else {false};
_to = if (cbChecked _toClipCheck) then {0} else {if (cbChecked _toDispCheck) then {1};};

_text = "";
if (_fl == 0) then {
	_text = _text + format ["%1", localize "STR_A3_export_tool_all_libraries_text"];
};
if (_fl == 1) then {
	if (_sl == 0) then {_text = _text + format ["%1 ", localize "STR_A3_export_tool_objects"]};
	if (_sl == 1) then {_text = _text + format ["%1 ", localize "STR_A3_export_tool_compositons"]};
	if (_sl == 2) then {_text = _text + format ["%1 ", localize "STR_A3_export_tool_Collections"]};
	if (_sl == 3) then {_text = _text + format ["%1 ", localize "STR_A3_export_tool_prefabs"]};
	_text = _text + format ["%1", localize "STR_A3_export_tool_single_library_text"];
};
if (_fl == 2) then {
	if (_sl == 0) then {_text = _text + format ["%1 ", localize "STR_A3_export_tool_object"]};
	if (_sl == 1) then {_text = _text + format ["%1 ", localize "STR_A3_export_tool_compositon"]};
	if (_sl == 2) then {_text = _text + format ["%1 ", localize "STR_A3_export_tool_Collection"]};
	if (_sl == 3) then {_text = _text + format ["%1 ", localize "STR_A3_export_tool_prefab"]};
	_text = _text + format ["%1",localize "STR_A3_export_tool_single_element_text"];
};
if (_fl == 3) then {
	_text = _text + format ["%1 ",localize "STR_A3_export_tool_setup_exported"];
	if (_to == 0) then {_text = _text + format ["%1. ", localize "STR_A3_export_tool_clipboard"]};
	if (_to == 1) then {_text = _text + format ["%1. ", localize "STR_A3_export_tool_display"]};
	if (_sl == 0) then {
		_text = _text + format ["%1 ",localize "STR_A3_export_tool_with_pivots_exported"];
	};
	if (_sl == 1) then {
		_text = _text + format [" %1 ",localize "STR_A3_export_tool_without_pivots_exported"];
		if (_ef == 0) then {_text = _text + format [" %1.",localize "STR_A3_export_tool_default_format"]};
		if (_ef == 1) then {_text = _text + format [" %1.",localize "STR_A3_export_tool_mission_format"]};
		if (_ef == 2) then {_text = _text + format [" %1.",localize "STR_A3_export_tool_xCam_format"]};
	};
};
if ((_to == 0) AND (_fl in [0,1,2])) then {_text = _text + format [" %1.", localize "STR_A3_export_tool_clipboard"]};
if ((_to == 1) AND (_fl in [0,1,2])) then {_text = _text + format [" %1.", localize "STR_A3_export_tool_display"]};
if ((_tc) AND (_fl in [0,1])) then {_text = _text + format [" %1.",localize "STR_A3_export_tool_includeTemp"]};
if ((!_tc) AND (_fl in [0,1])) then {_text = _text + format [" %1.",localize "STR_A3_export_tool_excludeTemp"]};
_hintText ctrlSetText _text;