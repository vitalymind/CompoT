/* 
   File: fn_scGUISaveComposition.sqf 
   Function: CT_fnc_scGUISaveComposition 
   Folder: SaveCompositionGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_givenName","_compoNameEdit","_warningsText","_saveBut","_pivot","_overwrite","_catPointer",
"_map","_composition","_categoryList","_found","_selectedCatIndex","_clones","_elemPointer","_selectedCatName","_keepNameCheck"];
_dialog = findDisplay 25254;
_compoNameEdit = _dialog displayCtrl 200;
_givenName = ctrlText _compoNameEdit;
_warningsText = _dialog displayCtrl 400;
_keepNameCheck = _dialog displayCtrl 500;
_saveBut = _dialog displayCtrl 300;
_categoryList = _dialog displayCtrl 100;
_warningsText ctrlSetText "";
_selectedCatIndex = lbCurSel _categoryList;

if (_selectedCatIndex == -1) exitWith {
	_warningsText ctrlSetText (localize "STR_A3_save_composition_no_cat_selected");
};
_selectedCatName = _categoryList lbText _selectedCatIndex;

if (_givenName == "") exitWith {
	_warningsText ctrlSetText (localize "STR_A3_save_composition_name_empty");
};

_pivot = uinamespace getVariable ["CT_var_GUI_scPivot",objNull];
_overwrite = uinamespace getVariable ["CT_var_GUI_scOverwrite",false];
if (isNull _pivot) exitWith {
	_dialog closeDisplay 0; 
	CT_var_openedGUI = false;
};

_found = false; _elemPointer = []; _catPointer = [];
{
	if (_selectedCatName == (_x select 0)) then {
		_catPointer = (_x select 1);
	};
	{
		if ((_x select 0) == _givenName) exitWith {
			_elemPointer = _x;
			_found = true;
		};
	} forEach (_x select 1);
	if (_found) exitWith {};
} forEach CT_var_compositions;
if ((_found) AND (!_overwrite)) exitWith {
	_warningsText ctrlSetText (localize "STR_A3_save_composition_compo_name_exists");
	_saveBut ctrlSetText (localize "STR_A3_save_composition_overwrite_but");
	uinamespace setVariable ["CT_var_GUI_scOverwrite",true];
};

_map = [_pivot] call CT_fnc_mapComposition;
_composition = call compile (_map select 0);
_composition set [0, _givenName];

if (_overwrite) then {
	_elemPointer set [0, (_composition select 0)];
	_elemPointer set [1, (_composition select 1)];
	_elemPointer set [2, (_composition select 2)];
	_clones = [];
	{
		if ((_x getVariable "name") == _givenName) then {
			if (!(_x in _clones)) then {
				_clones pushback _x;
			};
		};
	} forEach CT_var_builtPivots;
	_clones call CT_fnc_cloneComposition;
} else {
	_catPointer pushBack _composition;
};
_dialog closeDisplay 0; 
CT_var_openedGUI = false;
uinamespace setVariable ["CT_var_GUI_scPivot",objNull];
uinamespace setVariable ["CT_var_GUI_scOverwrite",""];

if (!cbChecked _keepNameCheck) then {
	["silent",_pivot,_givenName] call CT_fnc_changeName;
	[(_pivot getvariable "pivot")] call CT_fnc_saveElement;
};