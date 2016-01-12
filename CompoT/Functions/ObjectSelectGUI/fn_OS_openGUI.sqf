/* 
   File: fn_OS_openGUI.sqf 
   Function: CT_fnc_OS_openGUI 
   Folder: ObjectSelectGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_ctrl","_groupByCombo","_searchEdit","_catCombo"];

if ((uinameSpace getVariable ["CT_var_gui_runMode",""]) == "3den") then {
	if (!(uinamespace getVariable ["CT_var_gui_editorLoaded", false])) exitWith {};
	if (!isNull (uinamespace getVariable ["CT_var_gui_pickedObject", objNull])) then {
		deleteVehicle (uinamespace getVariable "CT_var_gui_pickedObject");
		uinamespace setVariable ["CT_var_gui_pickedObject", objNull];
		uinamespace setVariable ["CT_var_gui_pickedObjectClass", ""];
	};
	CT_var_holdenKeys = [false,false,false,false,false,false,false,false,false];
	_dialog = findDisplay 313;
	uinamespace SetVariable ["CT_var_gui_OSMopened", true];
	(_dialog displayCtrl CT_OBJECTSELECTIONMENU_IDC) ctrlShow true;
	(_dialog displayCtrl CT_OBJECTSELECTIONMENU_IDC) ctrlEnable true;
	_groupByCombo = _dialog displayCtrl CT_OSMGROUPBY_IDC;
	_catCombo = _dialog displayCtrl CT_OSMCATCOMBO_IDC;
	_searchEdit = _dialog displayCtrl CT_OSMSEARCH_IDC;
	for "_i" from 758501 to 758532 do {
		(_dialog displayCtrl _i) ctrlEnable true;
		(_dialog displayCtrl (_i + 100)) ctrlEnable false;
		(_dialog displayCtrl (_i + 100)) ctrlShow true;
	};
	lbClear _groupByCombo;
	_groupByCombo lbAdd "category";
	_groupByCombo lbAdd "no grouping";
	lbClear _catCombo;
	{
		_catCombo lbAdd (_x select 0);
	} forEach ct_var_objects;
	if (CT_var_OS_grouping == "category") then {_groupByCombo lbSetCurSel 0};
	if (CT_var_OS_grouping == "no grouping") then {_groupByCombo lbSetCurSel 1};

	[false] call CT_fnc_OS_groupBy;
	if (CT_var_OS_searchText != "") then {
		_searchEdit ctrlSetText CT_var_OS_searchText;
		[0, false,0] call CT_fnc_OS_search;
	};	

	CT_var_openedGUI = true;
	_groupByCombo ctrlSetEventHandler ["LBSelChanged", "[true] call CT_fnc_OS_groupBy"];
	_catCombo ctrlSetEventHandler ["LBSelChanged", "(_this select 1) call CT_fnc_OS_selectCat"];
	_searchEdit ctrlSetEventHandler ["KeyUp", "[1, true,(_this select 1)] call CT_fnc_OS_search;"];
} else {
	if (CT_var_cursorTool != "buildTool") exitWith {};
	if (((CT_var_buildMode select 0) select 0) != "object") exitWith {};
	CT_var_openedGUI = true;
	CT_var_holdenKeys = [false,false,false,false,false,false,false,false,false];
	"close" call CT_fnc_infoGUI;
	"close" call CT_fnc_controlsGUI;
	createDialog "ct_object_select";
	_dialog = findDisplay 25259;
	_groupByCombo = _dialog displayCtrl 350;
	_searchEdit = _dialog displayCtrl 360;
	_catCombo = _dialog displayCtrl 351;

	for "_i" from 201 to 232 do {
		_ctrl = _dialog displayCtrl _i;
		ctrlEnable [_i, true];
		ctrlEnable [(_i + 200), false]; 
		_ctrl ctrlSetEventHandler ["MouseEnter", "['in',_this] call CT_fnc_OS_setFocus"];
		_ctrl ctrlSetEventHandler ["MouseExit", "['out',_this] call CT_fnc_OS_setFocus"];
		_ctrl ctrlSetEventHandler ["MouseButtonUp", "_this call CT_fnc_OS_selectObject; true;"];
		
	};
	_dialog displayAddEventHandler ["unload", "call CT_fnc_OS_closeGUI"];
	_dialog displayAddEventHandler ["KeyDown", "_this call CT_fnc_OS_handleKeyDown"];
	_dialog displayAddEventHandler ["mouseZChanged", "[8,(_this select 1)] call CT_fnc_OS_scroll"];

	_groupByCombo lbAdd "category";
	_groupByCombo lbAdd "no grouping";
	lbClear _catCombo;
	{
		_catCombo lbAdd (_x select 0);
	} forEach ct_var_objects;
	
	if (CT_var_OS_grouping == "category") then {_groupByCombo lbSetCurSel 0};
	if (CT_var_OS_grouping == "no grouping") then {_groupByCombo lbSetCurSel 1};

	[false] call CT_fnc_OS_groupBy;
	if (CT_var_OS_searchText != "") then {
		_searchEdit ctrlSetText CT_var_OS_searchText;
		[0, false,0] call CT_fnc_OS_search;
	};	

	_groupByCombo ctrlSetEventHandler ["LBSelChanged", "[true] call CT_fnc_OS_groupBy"];
	_catCombo ctrlSetEventHandler ["LBSelChanged", "(_this select 1) call CT_fnc_OS_selectCat"];
	_searchEdit ctrlSetEventHandler ["KeyUp", "[1, true,(_this select 1)] call CT_fnc_OS_search;"];
};
