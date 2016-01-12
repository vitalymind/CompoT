/* 
   File: fn_OM_switchTab.sqf 
   Function: ct_fnc_OM_switchTab
   Folder: OptionMenu
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp"

disableSerialization;
private ["_dialog","_sliderGrp","_toggleGrp","_tutorialGrp"];
_dialog = findDisplay 25264;
_sliderGrp = _dialog displayCtrl CT_SLIDERSGROUP_IDC;
_toggleGrp = _dialog displayCtrl CT_TOGGLESGROUP_IDC;
_tutorialGrp = _dialog displayCtrl CT_TUTORIALSGROUP_IDC;

if ((ctrlShown _tutorialGrp) AND (_this == "general")) exitWith {
	_sliderGrp ctrlShow true;
	_toggleGrp ctrlShow true;
	_tutorialGrp ctrlShow false;
};
if ((ctrlShown _sliderGrp) AND (_this == "tutorial")) exitWith {
	_sliderGrp ctrlShow false;
	_toggleGrp ctrlShow false;
	_tutorialGrp ctrlShow true;
};