/* 
   File: fn_buildToolGUI.sqf 
   Function: CT_fnc_buildToolGUI 
   Folder: BuildToolSelectGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_type","_objectBut","_compositionBut","_collectionBut","_prefabBut"];
_type = _this;

if ((_type == "open") AND (!CT_var_buildToolGUIShown)) then {
	CT_var_buildToolGUIShown = true;
	CT_var_openedGUI = true;
	CT_var_holdenKeys = [false,false,false,false,false,false,false,false,false];
	createDialog "ct_buildToolMenu";
	_dialog = findDisplay 25253;
	_objectBut = _dialog displayCtrl 100;
	_compositionBut = _dialog displayCtrl 101;
	_collectionBut = _dialog displayCtrl 102;
	_prefabBut = _dialog displayCtrl 103;
	
	_dialog displayAddEventHandler ["mouseButtonUp", "if ((_this select 1) == 1) then {'close' call CT_fnc_buildToolGUI}"];
	
	_objectBut ctrlSetEventHandler ["MouseEnter", "CT_var_buildToolSelected = 'object'"];
	_compositionBut ctrlSetEventHandler ["MouseEnter", "CT_var_buildToolSelected = 'composition'"];
	_collectionBut ctrlSetEventHandler ["MouseEnter", "CT_var_buildToolSelected = 'collection'"];
	_prefabBut ctrlSetEventHandler ["MouseEnter", "CT_var_buildToolSelected = 'prefab'"];
	
	_objectBut ctrlSetEventHandler ["MouseExit", "CT_var_buildToolSelected = ''"];
	_compositionBut ctrlSetEventHandler ["MouseExit", "CT_var_buildToolSelected = ''"];
	_collectionBut ctrlSetEventHandler ["MouseExit", "CT_var_buildToolSelected = ''"];
	_prefabBut ctrlSetEventHandler ["MouseExit", "CT_var_buildToolSelected = ''"];
};

if ((_type == "close") AND (CT_var_buildToolGUIShown)) then {
	CT_var_buildToolGUIShown = false;
	CT_var_openedGUI = false;
	CT_var_holdenKeys = [false,false,false,false,false,false,false,false,false];
	CT_var_forceCamRotate = false;
	_dialog = findDisplay 25253;
	_dialog closeDisplay 1;
	
	switch (CT_var_buildToolSelected) do {
		case "object": {["object"] call CT_fnc_changeBuildLib};
		case "composition": {["composition"] call CT_fnc_changeBuildLib};
		case "collection": {["collection"] call CT_fnc_changeBuildLib};
		case "prefab": {["prefab"] call CT_fnc_changeBuildLib};
		default {};
	};
};