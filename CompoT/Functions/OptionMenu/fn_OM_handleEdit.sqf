/* 
   File: fn_OM_handleEdit.sqf 
   Function: ct_fnc_OM_handleEdit
   Folder: OptionMenu
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp"

disableSerialization;
private ["_dialog","_case","_ctrl","_dikCode","_string","_sliderCtrl","_number"];
_dialog = findDisplay 25264;
_case = _this select 0;
_ctrl = (_this select 1) select 0;
_dikCode = (_this select 1) select 1;
_string = ctrlText _ctrl;

if (_dikCode in [28, 156]) exitWith {
	_number = parseNumber _string;
	_sliderCtrl = controlNull;
	if (_number < 0.001) then {_number = 0.001};
	if (_case == "objRotate") then {
		if (_number > 180) then {_number = 180};
		_sliderCtrl = _dialog displayCtrl CT_SLIDERSROTATESLIDER_IDC;
	};
	if (_case == "objHeight") then {
		if (_number > 20) then {_number = 20};
		_sliderCtrl = _dialog displayCtrl CT_SLIDERSHEIGHTSLIDER_IDC;
	};
	if (_case == "compoRadius") then {
		if (_number > 30) then {_number = 30};
		_sliderCtrl = _dialog displayCtrl CT_SLIDERSRADIUSSLIDER_IDC;
	};
	if (_case == "objSelect") then {
		if (_number > 50) then {_number = 50};
		_sliderCtrl = _dialog displayCtrl CT_SLIDERSSELECTSLIDER_IDC;
	};
	if (_case == "camRotate") then {
		if (_number > 5) then {_number = 5};
		_sliderCtrl = _dialog displayCtrl CT_SLIDERSCAMROTATIONSLIDER_IDC;
	};
	if (_case == "camMove") then {
		if (_number > 10) then {_number = 10};
		_sliderCtrl = _dialog displayCtrl CT_SLIDERSCAMMOVESLIDER_IDC;
	};
	_ctrl ctrlSetText str _number;
	_sliderCtrl sliderSetPosition _number;
	[_case, _number] call ct_fnc_OM_setValue;
};
