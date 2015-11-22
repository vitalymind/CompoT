/* 
   File: fn_CmL_drop.sqf 
   Function: CT_fnc_CmL_drop 
   Folder: CompositionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_sourceList","_targetList","_coords","_leftCategoryName","_rightCategoryName","_data",
"_pSourceCategory","_pTargetCategory","_elemIndex","_compositionName","_name","_index"];
_dialog = findDisplay 25256;
_leftCategoryName = (_dialog displayCtrl 200) lbText (lbCurSel (_dialog displayCtrl 200));
_rightCategoryName = (_dialog displayCtrl 201) lbText (lbCurSel (_dialog displayCtrl 201));
_targetList = _this select 0;
_sourceList = _dialog displayCtrl (_this select 3);
_coords = [_this select 1, _this select 2];
_data = call compile (((_this select 4) select 0) select 2);
_compositionName = _data select 0;
_sourceCategory = if (ctrlIDC _sourceList == 100) then {_leftCategoryName} else {_rightCategoryName};
_targetCategory = if (ctrlIDC _targetList == 100) then {_leftCategoryName} else {_rightCategoryName};

_pSourceCategory = []; _pTargetCategory = [];
{
	_name = _x select 0;
	_data = _x select 1;
	if (_name == _sourceCategory) then {_pSourceCategory = (_x select 1)};
	if (_name == _targetCategory) then {_pTargetCategory = (_x select 1)};
} forEach CT_var_compositions;
{
	if ((_x select 0) == _compositionName) exitWith {_elemIndex = _forEachIndex};
} forEach _pSourceCategory;
_left = _pSourceCategory deleteAt _elemIndex;
_pTargetCategory pushBack _left;

call CT_fnc_CmL_fillCategories;