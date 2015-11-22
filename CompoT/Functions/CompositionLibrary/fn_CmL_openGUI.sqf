/* 
   File: fn_CmL_openGUI.sqf 
   Function: CT_fnc_CmL_openGUI 
   Folder: CompositionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_leftList","_rightList","_leftCatCombo","_rightCatCombo","_objectsList","_compositionsList",
"_collectionsList","_prefabsList","_excludeTempCheck","_nameEdit","_nameBut","_sizeText","_objectsText",
"_compositionsText","_collectionsText","_prefabsText","_newcatEdit","_newcatBut","_categoriesList","_renameCatBut"];	
createDialog "composition_library";
CT_var_openedGUI = true;
CT_var_holdenKeys = [false,false,false,false,false,false,false,false,false];
"close" call CT_fnc_infoGUI;
"close" call CT_fnc_controlsGUI;
_dialog = findDisplay 25256;

_leftList = _dialog displayCtrl 100;
_rightList = _dialog displayCtrl 101;
_objectsList = _dialog displayCtrl 102;
_compositionsList = _dialog displayCtrl 103;
_collectionsList = _dialog displayCtrl 104;
_prefabsList = _dialog displayCtrl 105;
_categoriesList = _dialog displayCtrl 106;

_leftCatCombo = _dialog displayCtrl 200;
_rightCatCombo = _dialog displayCtrl 201;

_excludeTempCheck = _dialog displayCtrl 300;
_nameEdit = _dialog displayCtrl 400;
_newcatEdit = _dialog displayCtrl 401;
_nameBut = _dialog displayCtrl 500;
_newcatBut = _dialog displayCtrl 501;
_renameCatBut = _dialog displayCtrl 502;

_sizeText = _dialog displayCtrl 600;
_objectsText = _dialog displayCtrl 601;
_compositionsText = _dialog displayCtrl 602;
_collectionsText = _dialog displayCtrl 603;
_prefabsText = _dialog displayCtrl 604;

_dialog displayAddEventHandler ["unload", "call CT_fnc_CmL_close"];
_dialog displayAddEventHandler ["KeyDown", "[(_this select 1), 'composition'] call CT_fnc_switchLib;"];
_excludeTempCheck ctrlSetEventHandler ["CheckedChanged", "call CT_fnc_CmL_fillCategories"];
_leftCatCombo ctrlSetEventHandler ["LBSelChanged", "'left' call CT_fnc_CmL_fillList"];
_rightCatCombo ctrlSetEventHandler ["LBSelChanged", "'right' call CT_fnc_CmL_fillList"];
_leftList ctrlSetEventHandler ["LBSelChanged", "'left' call CT_fnc_CmL_showInfo"];
_rightList ctrlSetEventHandler ["LBSelChanged", "'right' call CT_fnc_CmL_showInfo"];
_categoriesList ctrlSetEventHandler ["LBSelChanged", "'category' call CT_fnc_CmL_showInfo"];
_leftList ctrlSetEventHandler ["LBDrop", "_this call CT_fnc_CmL_drop"];
_rightList ctrlSetEventHandler ["LBDrop", "_this call CT_fnc_CmL_drop"];
_categoriesList ctrlSetEventHandler ["KeyDown", "_this call CT_fnc_CmL_handleKeydown"];
_leftList ctrlSetEventHandler ["KeyDown", "_this call CT_fnc_CmL_handleKeydown"];
_rightList ctrlSetEventHandler ["KeyDown", "_this call CT_fnc_CmL_handleKeydown"];
_newcatBut ctrlSetEventHandler ["ButtonClick", "call CT_fnc_CmL_NewCat;"];
_nameBut ctrlSetEventHandler ["ButtonClick", "call CT_fnc_CmL_rename;"];
_renameCatBut ctrlSetEventHandler ["ButtonClick", "call CT_fnc_CmL_rename;"];
_excludeTempCheck cbSetChecked true;

call CT_fnc_CmL_fillCategories;

CT_var_CmL_camPos = [getPosATL CT_var_cam, getDir CT_var_cam, CT_var_cam call CT_fnc_getPB];
CT_var_cursor setPosATL (getMarkerPos "center");
[20] call CT_fnc_CmL_setCam;