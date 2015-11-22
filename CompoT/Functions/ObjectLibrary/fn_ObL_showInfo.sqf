/* 
   File: fn_ObL_showInfo.sqf 
   Function: CT_fnc_ObL_showInfo 
   Folder: ObjectLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_case","_dialog","_ctrl","_modelEdit","_scopeEdit","_classnameEdit",
"_displaynameEdit","_selection","_data","_model","_mapSize","_3dPreview",
"_mapsizeEdit","_found","_modEdit"];
disableSerialization;

_case = _this;
_dialog = findDisplay 25250;
_ctrl = controlNull;
_data = "";

if (_case == "tree") then {
	_ctrl = _dialog displayCtrl 200;
	_data = _ctrl tvData (tvCurSel _ctrl);
	CT_var_ObL_activeCtrl = "tree";
};
if (_case == "list") then {
	_ctrl = _dialog displayCtrl 250;
	_data = _ctrl lbData (lbCurSel _ctrl);
	CT_var_ObL_activeCtrl = "list";
};

_modelEdit = _dialog displayCtrl 402;
_scopeEdit = _dialog displayCtrl 403;
_classnameEdit = _dialog displayCtrl 404;
_displaynameEdit = _dialog displayCtrl 405;
_mapsizeEdit = _dialog displayCtrl 406;
_modEdit = _dialog displayCtrl 407;
_3dPreview = _dialog displayCtrl 600;

if (_data != "") then {
	_data = call compile _data;
	_classname = _data select 0;
	_scope = str(_data select 1);
	_model = _data select 2;
	_displayName = _data select 3;
	_mapSize = _data select 4;
	_mod = _data select 5;
	
	_modelEdit ctrlSetText _model;
	_scopeEdit ctrlSetText _scope;
	_classnameEdit ctrlSetText _classname;
	_displaynameEdit ctrlSetText _displayName;
	_mapsizeEdit ctrlSetText format ["%1 m", round _mapSize];
	if (isClass (configFile >> "CfgVehicles" >> _classname)) then {
		_modEdit ctrlSetText _mod;
		_found = _model find "\";
		if (_found == -1) then {_model = "\A3\Weapons_F\empty.p3d"};
		if (_model == "") then {_model = "\A3\Weapons_F\empty.p3d"};
		if (_model == "\A3\Air_F_Gamma\Plane_CAS_01\Plane_cas_01_F.p3d") then {_model = "\A3\Weapons_F\empty.p3d"};
		_3dPreview ctrlSetModel _model;
		_3dPreview ctrlSetModelDirAndUp [[0.1,1,0.2],[0,0,1]];
		_3dPreview ctrlSetPosition [1,(_mapSize * CT_var_ObL_previewDistance),0.8];
		_3dPreview ctrlCommit 0;
	} else {
		_modEdit ctrlSetText format ["%1 mod is not active!",_mod];
		_3dPreview ctrlSetModel "\A3\Weapons_F\empty.p3d";
	};
} else {
	_modelEdit ctrlSetText "";
	_scopeEdit ctrlSetText "";
	_classnameEdit ctrlSetText "";
	_displaynameEdit ctrlSetText "";
	_mapsizeEdit ctrlSetText "";
	_3dPreview ctrlSetModel "\A3\Weapons_F\empty.p3d";
	_modEdit ctrlSetText "";
};