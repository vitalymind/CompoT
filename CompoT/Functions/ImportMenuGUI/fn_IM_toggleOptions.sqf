/* 
   File: fn_IM_toggleOptions.sqf 
   Function: CT_fnc_IM_toggleOptions 
   Folder: ImportMenuGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_skipCheck","_addCheck","_overwriteCheck","_option","_importList","_index","_newOption"];
_dialog = findDisplay 25261;
_option = _this;
_skipCheck = _dialog displayCtrl 203;
_addCheck = _dialog displayCtrl 204;
_overwriteCheck = _dialog displayCtrl 205;
_importList = _dialog displayCtrl 400;
if (_option == "add") then {
	_addCheck cbSetChecked true;
	_overwriteCheck cbSetChecked false;
	_skipCheck cbSetChecked false;
};
if (_option == "over") then {
	_addCheck cbSetChecked false;
	_overwriteCheck cbSetChecked true;
	_skipCheck cbSetChecked false;
};
if (_option == "skip") then {
	_addCheck cbSetChecked false;
	_overwriteCheck cbSetChecked false;
	_skipCheck cbSetChecked true;
};
_index = lbCurSel _importList;
if (_index == -1) exitWith {};

_option = (CT_var_IM_importOptions select _index) select 5;
_newOption = if (cbChecked _overwriteCheck) then {0} else {if (cbChecked _addCheck) then {1} else {if (cbChecked _skipCheck) then {2};};};
if (_option == _newOption) exitWith {};
(CT_var_IM_importOptions select _index) set [5,_newOption];