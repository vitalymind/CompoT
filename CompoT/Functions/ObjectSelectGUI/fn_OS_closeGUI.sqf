/* 
   File: fn_OS_closeGUI.sqf 
   Function: CT_fnc_OS_closeGUI 
   Folder: ObjectSelectGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

if ((uinameSpace getVariable ["CT_var_gui_runMode",""]) == "3den") then {
	if (!(uinamespace getVariable ["CT_var_gui_editorLoaded", false])) exitWith {};
	_dialog = findDisplay 313;
	_groupByCombo = _dialog displayCtrl CT_OSMGROUPBY_IDC;
	_catCombo = _dialog displayCtrl CT_OSMCATCOMBO_IDC;
	_searchEdit = _dialog displayCtrl CT_OSMSEARCH_IDC;
	_groupByCombo ctrlSetEventHandler ["LBSelChanged", ""];
	_catCombo ctrlSetEventHandler ["LBSelChanged", ""];
	_searchEdit ctrlSetEventHandler ["KeyUp", ""];
	uinamespace SetVariable ["CT_var_gui_OSMopened", false];
	(_dialog displayCtrl CT_OBJECTSELECTIONMENU_IDC) ctrlShow false;
	(_dialog displayCtrl CT_OBJECTSELECTIONMENU_IDC) ctrlEnable false;
	CT_var_openedGUI = false;
} else {
	CT_var_openedGUI = false; 
	'open' call CT_fnc_infoGUI;
	'open' call CT_fnc_controlsGUI;
	CT_var_OS_shownObjects = [];
	CT_var_OS_shownSearchResults = [];
};