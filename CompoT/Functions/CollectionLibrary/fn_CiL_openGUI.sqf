/* 
   File: fn_CiL_openGUI.sqf 
   Function: CT_fnc_CiL_openGUI 
   Folder: CollectionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_categoryList","_collectionList","_contentList","_groupCombo","_tree","_newCatBut","_newColBut",
"_renameCatBut","_renameColBut"];	
createDialog "collection_library";
CT_var_openedGUI = true;
"close" call CT_fnc_infoGUI;
"close" call CT_fnc_controlsGUI;
CT_var_holdenKeys = [false,false,false,false,false,false,false,false,false];
_dialog = findDisplay 25257;
_categoryList = _dialog displayCtrl 250;
_collectionList = _dialog displayCtrl 251;
_contentList = _dialog displayCtrl 252;
_groupCombo = _dialog displayCtrl 301;
_tree = _dialog displayCtrl 200;
_newCatBut = _dialog displayCtrl 100;
_newColBut = _dialog displayCtrl 101;
_renameCatBut = _dialog displayCtrl 102;
_renameColBut = _dialog displayCtrl 103;
_dialog displayAddEventHandler ["unload", "call CT_fnc_CiL_close"];
_dialog displayAddEventHandler ["KeyDown", "[(_this select 1), 'collection'] call CT_fnc_switchLib;"];
_categoryList ctrlSetEventHandler ["LBSelChanged", "call CT_fnc_CiL_fillCollections; CT_var_CiL_selection = 'category';"];
_collectionList ctrlSetEventHandler ["LBSelChanged", "call CT_fnc_CiL_fillContent; CT_var_CiL_selection = 'collection';"];
_contentList ctrlSetEventHandler ["LBSelChanged", "'list' call CT_fnc_CiL_showInfo;  CT_var_CiL_selection = 'content';"];
_tree ctrlSetEventHandler ["treeSelChanged", "'tree' call CT_fnc_CiL_showInfo"];
_tree ctrlSetEventHandler ["KeyDown", format ["if (_this select 1 == %1) then {call CT_fnc_CiL_addObject}",DIK_ENTER]];
_groupCombo ctrlSetEventHandler ["LBSelChanged", "call CT_fnc_CiL_fillObjects"];
_categoryList ctrlSetEventHandler ["KeyDown", "[_this, 'category'] call CT_fnc_CiL_handleKeydown"];
_collectionList ctrlSetEventHandler ["KeyDown", "[_this, 'collection'] call CT_fnc_CiL_handleKeydown"];
_contentList ctrlSetEventHandler ["KeyDown", "[_this, 'content'] call CT_fnc_CiL_handleKeydown"];
_newCatBut ctrlSetEventHandler ["ButtonClick", "call CT_fnc_CiL_NewCat;"];
_newColBut ctrlSetEventHandler ["ButtonClick", "call CT_fnc_CiL_NewCol;"];
_renameCatBut ctrlSetEventHandler ["ButtonClick", "call CT_fnc_CiL_renameCat;"];
_renameColBut ctrlSetEventHandler ["ButtonClick", "call CT_fnc_CiL_renameCol;"];

_groupCombo lbAdd "categories";
_groupCombo lbAdd "no grouping";
_groupCombo lbSetCurSel 0;

{
	{
		_name = _x select 0;
		if (!(_name in (CT_var_CiL_objects select 0))) then {
			(CT_var_CiL_objects select 0) pushBack _name;
			(CT_var_CiL_objects select 1) pushBack _x;
		};
	} forEach (_x select 1);
} forEach CT_var_objects;
call CT_fnc_CiL_fillCategories;
_categoryList lbSetCurSel 0;
_collectionList lbSetCurSel 0;