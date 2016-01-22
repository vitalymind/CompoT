/* 
   File: fn_EM_firstListHandle.sqf 
   Function: CT_fnc_EM_firstListHandle 
   Folder: ExportMenuGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_firstList","_secondList","_formatCombo","_index","_incTempCheck"];
_dialog = findDisplay 25260;
_firstList = _dialog displayCtrl 100;
_secondList = _dialog displayCtrl 101;
_formatCombo = _dialog displayCtrl 400;
_incTempCheck = _dialog displayCtrl 302;
_index = lbCurSel _firstList;
if (_index == -1) exitWith {};
lbClear _secondList;
if (_index == 0) then {
	_incTempCheck cbSetChecked false; ctrlShow [302, true]; ctrlShow [601, true];
};
if (_index in [1,2,3]) then {
	_secondList lbAdd (localize "STR_A3_export_tool_objects");
	_secondList lbAdd (localize "STR_A3_export_tool_compositons");
	_secondList lbAdd (localize "STR_A3_export_tool_Collections");
	_secondList lbAdd (localize "STR_A3_export_tool_prefabs");
	if (_index == 1) then {_incTempCheck cbSetChecked false; ctrlShow [302, true]; ctrlShow [601, true];};
	if (_index in [2,3]) then {_incTempCheck cbSetChecked false; ctrlShow [302, false]; ctrlShow [601, false];};
};
if (_index in [1,2,3]) then {_secondList lbSetCurSel 0};
call CT_fnc_EM_secondListHandle;