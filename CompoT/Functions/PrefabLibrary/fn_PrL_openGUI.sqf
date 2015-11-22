/* 
   File: fn_PrL_openGUI.sqf 
   Function: CT_fnc_PrL_openGUI 
   Folder: PrefabLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_groupCombo","_newCatBut","_newPrefBut","_renameCatBut","_renamePrefBut","_categoryList",
"_prefabsList","_contentList","_tree"];	
createDialog "prefab_library";
CT_var_openedGUI = true;
"close" call CT_fnc_infoGUI;
"close" call CT_fnc_controlsGUI;
CT_var_holdenKeys = [false,false,false,false,false,false,false,false,false];
_dialog = findDisplay 25258;
_groupCombo = _dialog displayCtrl 301;
_newCatBut = _dialog displayCtrl 100;
_newPrefBut = _dialog displayCtrl 101;
_renameCatBut = _dialog displayCtrl 102;
_renamePrefBut = _dialog displayCtrl 103;
_categoryList = _dialog displayCtrl 250;
_prefabsList = _dialog displayCtrl 251;
_contentList = _dialog displayCtrl 252;
_tree = _dialog displayCtrl 200;

_dialog displayAddEventHandler ["unload", "call CT_fnc_PrL_close"];
_dialog displayAddEventHandler ["KeyDown", "[(_this select 1), 'prefab'] call CT_fnc_switchLib;"];
_newCatBut ctrlSetEventHandler ["ButtonClick", "call CT_fnc_PrL_NewCat;"];
_newPrefBut ctrlSetEventHandler ["ButtonClick", "call CT_fnc_PrL_NewPref;"];
_renameCatBut ctrlSetEventHandler ["ButtonClick", "call CT_fnc_PrL_renameCat;"];
_renamePrefBut ctrlSetEventHandler ["ButtonClick", "call CT_fnc_PrL_renamePref;"];
_categoryList ctrlSetEventHandler ["LBSelChanged", "call CT_fnc_PrL_fillPrefabs; CT_var_PrL_selection = 'category';"];
_prefabsList ctrlSetEventHandler ["LBSelChanged", "call CT_fnc_PrL_fillContent; CT_var_PrL_selection = 'prefab';"];
_contentList ctrlSetEventHandler ["LBSelChanged", "'list' call CT_fnc_PrL_showInfo; CT_var_PrL_selection = 'content';"];
_tree ctrlSetEventHandler ["treeSelChanged", "'tree' call CT_fnc_PrL_showInfo"];
_tree ctrlSetEventHandler ["KeyDown", format ["if (_this select 1 == %1) then {call CT_fnc_PrL_addObject}",DIK_ENTER]];
_categoryList ctrlSetEventHandler ["KeyDown", "[_this, 'category'] call CT_fnc_PrL_handleKeydown"];
_prefabsList ctrlSetEventHandler ["KeyDown", "[_this, 'prefab'] call CT_fnc_PrL_handleKeydown"];
_contentList ctrlSetEventHandler ["KeyDown", "[_this, 'content'] call CT_fnc_PrL_handleKeydown"];
_groupCombo ctrlSetEventHandler ["LBSelChanged", "call CT_fnc_PrL_fillCompositions"];

_groupCombo lbAdd "categories";
_groupCombo lbAdd "no grouping";
_groupCombo lbSetCurSel 0;

{
	{
		_name = _x select 0;
		if (!(_name in (CT_var_PrL_compositions select 0))) then {
			(CT_var_PrL_compositions select 0) pushBack _name;
			(CT_var_PrL_compositions select 1) pushBack _x;
		};
	} forEach (_x select 1);
} forEach CT_var_compositions;

call CT_fnc_PrL_fillCategories;
CT_var_CmL_camPos = [getPosATL CT_var_cam, getDir CT_var_cam, CT_var_cam call CT_fnc_getPB];
CT_var_cursor setPosATL (getMarkerPos "center");
[20] call CT_fnc_CmL_setCam;
_categoryList lbSetCurSel 0;
_prefabsList lbSetCurSel 0;