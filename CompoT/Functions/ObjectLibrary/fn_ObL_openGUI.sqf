/* 
   File: fn_ObL_openGUI.sqf 
   Function: CT_fnc_ObL_openGUI 
   Folder: ObjectLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog", "_configTree","_categoryList","_groupByCombo","_sortByCombo",
"_scope0Check","_scope1Check","_noModelCheck","_searchEdit","_newCatEdit","_modelEdit",
"_scopeEdit","_classnameEdit","_displaynameEdit","_3dPreview","_name","_data",
"_newCatBut","_renameBut","_contentList","_modEdit","_modCombo","_configContent"];	
_configContent = uinamespace getVariable ["CT_var_GUI_ObL_configContent",[]];
if (count _configContent == 0) exitWith {
	uinamespace setVariable ["CT_var_GUI_ObL_configContent",[]];
	[] spawn CT_fnc_ObL_collectConfigData;
};

createDialog "object_library";
CT_var_openedGUI = true;
"close" call CT_fnc_infoGUI;
"close" call CT_fnc_controlsGUI;
CT_var_holdenKeys = [false,false,false,false,false,false,false,false,false];

_dialog = findDisplay 25250;

_newCatBut = _dialog displayCtrl 100;
_renameBut = _dialog displayCtrl 101;

_configTree = _dialog displayCtrl 200;

_categoryList = _dialog displayCtrl 251;
_contentList = _dialog displayCtrl 250;

_sortByCombo = _dialog displayCtrl 300;
_groupByCombo = _dialog displayCtrl 301;
_modCombo = _dialog displayCtrl 302;

_searchEdit = _dialog displayCtrl 400;
_newCatEdit = _dialog displayCtrl 401;
_modelEdit = _dialog displayCtrl 402;
_scopeEdit = _dialog displayCtrl 403;
_classnameEdit = _dialog displayCtrl 404;
_displaynameEdit = _dialog displayCtrl 405;
_modEdit = _dialog displayCtrl 407;

_scope0Check = _dialog displayCtrl 500;
_scope1Check = _dialog displayCtrl 501;
_noModelCheck = _dialog displayCtrl 502;

_3dPreview = _dialog displayCtrl 600;

_dialog displayAddEventHandler ["unload", "call CT_fnc_ObL_close"];
_dialog displayAddEventHandler ["KeyDown", "[(_this select 1), 'object'] call CT_fnc_switchLib;"];
_dialog displayAddEventHandler ["MouseZChanged", "_this call CT_fnc_ObL_adjustPreviewDistance; true;"];
_groupByCombo ctrlSetEventHandler ["LBSelChanged", "call CT_fnc_ObL_groupBy"];
_configTree ctrlSetEventHandler ["treeSelChanged", "'tree' call CT_fnc_ObL_showInfo"];

_configTree ctrlSetEventHandler ["KeyDown", "[_this, ''] call CT_fnc_ObL_handleKeydown"];
_contentList ctrlSetEventHandler ["KeyDown", "[_this, 'content'] call CT_fnc_ObL_handleKeydown;"];
_categoryList ctrlSetEventHandler ["KeyDown", "[_this, 'category'] call CT_fnc_ObL_handleKeydown;"];

_contentList ctrlSetEventHandler ["LBSelChanged", "'list' call CT_fnc_ObL_showInfo; CT_var_ObL_selection = 'content';"];
_categoryList ctrlSetEventHandler ["LBSelChanged", "call CT_fnc_ObL_fillCategories;  CT_var_ObL_selection = 'category';"];
_sortByCombo ctrlSetEventHandler ["LBSelChanged", "call CT_fnc_ObL_groupBy"];
_scope0Check ctrlSetEventHandler ["CheckedChanged", "call CT_fnc_ObL_groupBy"];
_scope1Check ctrlSetEventHandler ["CheckedChanged", "call CT_fnc_ObL_groupBy"];
_noModelCheck ctrlSetEventHandler ["CheckedChanged", "call CT_fnc_ObL_groupBy"];
_renameBut ctrlSetEventHandler ["ButtonClick", "call CT_fnc_ObL_renameCat;"];
_newCatBut ctrlSetEventHandler ["ButtonClick", "call CT_fnc_ObL_newCategory;"];
_searchEdit ctrlSetEventHandler ["KeyUp", "[1,(_this select 1)] call CT_fnc_ObL_search;"];

{
	ctrlShow [_x, false];
} forEach [400, 701, 302];

_index = _sortByCombo lbAdd "no sorting";
_sortByCombo lbSetData [_index, "no sorting"];
_index = _sortByCombo lbAdd "other mods";
_sortByCombo lbSetData [_index, "other mods"];
{
	_modCombo lbAdd _x;
	_index = _sortByCombo lbAdd (format ["mod %1",_x]);
	_sortByCombo lbSetData [_index, _x];
} forEach CT_var_mods;

_groupByCombo lbAdd "default";
_groupByCombo lbAdd "no grouping";
_groupByCombo lbSetCurSel 0;
_modCombo lbSetCurSel 0;

call CT_fnc_ObL_fillCategories;
_categoryList lbSetCurSel 0;
_sortByCombo lbSetCurSel 0;