/* 
   File: fn_IM_openGUI.sqf 
   Function: CT_fnc_IM_openGUI 
   Folder: ImportMenuGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_okBut","_cancelBut","_loadBut","_fromClipCheck","_fromDispCheck","_fromfileCheck","_skipCheck","_addCheck",
"_overwriteCheck","_dropEdit","_descriptionEdit","_dateEdit","_typeEdit","_authorEdit","_importList","_hintText","_overWriteText",
"_addText","_skipText","_collisionText"];
CT_var_openedGUI = true;
"close" call CT_fnc_infoGUI;
"close" call CT_fnc_controlsGUI;
CT_var_holdenKeys = [false,false,false,false,false,false,false,false,false];
createDialog "import_menu";
_dialog = findDisplay 25261;
_okBut = _dialog displayCtrl 100;
_cancelBut = _dialog displayCtrl 101;
_loadBut = _dialog displayCtrl 102;
_fromClipCheck = _dialog displayCtrl 200;
_fromDispCheck = _dialog displayCtrl 201;
_fromfileCheck = _dialog displayCtrl 202;
_skipCheck = _dialog displayCtrl 203;
_addCheck = _dialog displayCtrl 204;
_overwriteCheck = _dialog displayCtrl 205;
_dropEdit = _dialog displayCtrl 300;
_descriptionEdit = _dialog displayCtrl 301;
_dateEdit = _dialog displayCtrl 302;
_typeEdit = _dialog displayCtrl 303;
_authorEdit = _dialog displayCtrl 304;
_importList = _dialog displayCtrl 400;
_hintText = _dialog displayCtrl 500;
_overWriteText = _dialog displayCtrl 501;
_addText = _dialog displayCtrl 502;
_skipText = _dialog displayCtrl 503;
_collisionText = _dialog displayCtrl 504;

_dialog displayAddEventHandler ["unload", "call CT_fnc_IM_closeGUI"];
_importList ctrlSetEventHandler ["LBSelChanged", "call CT_fnc_IM_handleImportSelection; call CT_fnc_IM_updateHint;"];
_fromClipCheck ctrlSetEventHandler ["CheckedChanged", "'clip' call CT_fnc_IM_toggleSource; call CT_fnc_IM_updateHint;"];
_fromDispCheck ctrlSetEventHandler ["CheckedChanged", "'disp' call CT_fnc_IM_toggleSource; call CT_fnc_IM_updateHint;"];
_fromfileCheck ctrlSetEventHandler ["CheckedChanged", "'file' call CT_fnc_IM_toggleSource; call CT_fnc_IM_updateHint;"];
_skipCheck ctrlSetEventHandler ["CheckedChanged", "'skip' call CT_fnc_IM_toggleOptions; call CT_fnc_IM_updateHint;"];
_addCheck ctrlSetEventHandler ["CheckedChanged", "'add' call CT_fnc_IM_toggleOptions; call CT_fnc_IM_updateHint;"];
_overwriteCheck ctrlSetEventHandler ["CheckedChanged", "'over' call CT_fnc_IM_toggleOptions; call CT_fnc_IM_updateHint;"];
_okBut ctrlSetEventHandler ["ButtonClick", "call CT_fnc_IM_performImport"];
_cancelBut ctrlSetEventHandler ["ButtonClick", "(findDisplay 25261) closeDisplay 0"];
_loadBut ctrlSetEventHandler ["ButtonClick", "call CT_fnc_IM_preloadInput"];
_importList ctrlSetEventHandler ["KeyDown", "(_this select 1) call CT_fnc_IM_handleKeydown;"];

_fromClipCheck cbSetChecked true;
{ctrlShow [_x, false]}forEach [501,502,503,504,203,204,205,300];