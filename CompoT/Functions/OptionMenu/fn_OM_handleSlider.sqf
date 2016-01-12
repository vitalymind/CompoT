/* 
   File: fn_OM_handleSlider.sqf 
   Function: ct_fnc_OM_handleSlider
   Folder: OptionMenu
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp"

disableSerialization;
private ["_dialog","_case","_editCtrl","_number"];
_dialog = findDisplay 25264;
_case = _this select 0;
_number = (_this select 1) select 1;

if (_case == "objRotate") then {
	_editCtrl = _dialog displayCtrl CT_SLIDERSROTATEEDIT_IDC;
};
if (_case == "objHeight") then {
	_editCtrl = _dialog displayCtrl CT_SLIDERSHEIGHTEDIT_IDC;
};
if (_case == "compoRadius") then {
	_editCtrl = _dialog displayCtrl CT_SLIDERSRADIUSEDIT_IDC;
};
if (_case == "objSelect") then {
	_editCtrl = _dialog displayCtrl CT_SLIDERSSELECTEDIT_IDC;
};
if (_case == "camRotate") then {
	_editCtrl = _dialog displayCtrl CT_SLIDERSCAMROTATIONEDIT_IDC;
};
if (_case == "camMove") then {
	_editCtrl = _dialog displayCtrl CT_SLIDERSCAMMOVEEDIT_IDC;
};
_editCtrl ctrlSetText str _number;
[_case, _number] call ct_fnc_OM_setValue;
