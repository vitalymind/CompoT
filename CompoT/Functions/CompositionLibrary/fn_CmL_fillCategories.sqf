/* 
   File: fn_CmL_fillCategories.sqf 
   Function: CT_fnc_CmL_fillCategories 
   Folder: CompositionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_leftCatCombo","_rightCatCombo","_name","_data","_index","_excludeTempCheck","_categoriesList"];
_dialog = findDisplay 25256;
_leftCatCombo = _dialog displayCtrl 200;
_rightCatCombo = _dialog displayCtrl 201;
_categoriesList = _dialog displayCtrl 106;
lbClear _leftCatCombo;
lbClear _rightCatCombo;
lbClear _categoriesList;

_excludeTempCheck = _dialog displayCtrl 300;
{
	_name = _x select 0;
	_data = _x select 1;
	if ((cbChecked _excludeTempCheck) AND (_name == "temporary")) then {
	} else {
		_categoriesList lbAdd _name;
		_index = _leftCatCombo lbAdd _name;
		_leftCatCombo lbSetData [_index, str(_data)];
		_index = _rightCatCombo lbAdd _name;
		_rightCatCombo lbSetData [_index, str(_data)];
	};
} forEach CT_var_compositions;

_leftCatCombo lbSetCurSel (CT_var_CmL_selection select 0);
_rightCatCombo lbSetCurSel (CT_var_CmL_selection select 1);