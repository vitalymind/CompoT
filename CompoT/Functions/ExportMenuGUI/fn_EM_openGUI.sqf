/* 
   File: fn_EM_openGUI.sqf 
   Function: CT_fnc_EM_openGUI 
   Folder: ExportMenuGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_firstList","_secondList","_thirdList","_okBut","_cancelBut","_toClipCheck","_toDispCheck","_formatCombo",
"_dropEdit","_hintText","_incTempCheck","_incTempText"];
CT_var_openedGUI = true;
"close" call CT_fnc_infoGUI;
"close" call CT_fnc_controlsGUI;
CT_var_holdenKeys = [false,false,false,false,false,false,false,false,false];
createDialog "export_menu";
_dialog = findDisplay 25260;
_firstList = _dialog displayCtrl 100;
_secondList = _dialog displayCtrl 101;
_thirdList = _dialog displayCtrl 102;
_okBut = _dialog displayCtrl 200;
_cancelBut = _dialog displayCtrl 201;
_toClipCheck = _dialog displayCtrl 300;
_toDispCheck = _dialog displayCtrl 301;
_incTempCheck = _dialog displayCtrl 302;
_formatCombo = _dialog displayCtrl 400;
_dropEdit = _dialog displayCtrl 500;
_hintText = _dialog displayCtrl 600;
_incTempText = _dialog displayCtrl 601;

_dialog displayAddEventHandler ["unload", "call CT_fnc_EM_closeGUI"];
_firstList ctrlSetEventHandler ["LBSelChanged", "call CT_fnc_EM_firstListHandle; call CT_fnc_EM_updateHint;"];
_secondList ctrlSetEventHandler ["LBSelChanged", "call CT_fnc_EM_secondListHandle; call CT_fnc_EM_updateHint;"];
_thirdList ctrlSetEventHandler ["LBSelChanged", "call CT_fnc_EM_thirdListHandle; call CT_fnc_EM_updateHint;"];
_toClipCheck ctrlSetEventHandler ["CheckedChanged", "'clip' call CT_fnc_EM_toggleDestination; call CT_fnc_EM_updateHint;"];
_toDispCheck ctrlSetEventHandler ["CheckedChanged", "'disp' call CT_fnc_EM_toggleDestination; call CT_fnc_EM_updateHint;"];
_incTempCheck ctrlSetEventHandler ["CheckedChanged", "call CT_fnc_EM_updateHint;"];
_formatCombo ctrlSetEventHandler ["LBSelChanged", "call CT_fnc_EM_updateHint;"];
_okBut ctrlSetEventHandler ["ButtonClick", "call CT_fnc_EM_performExport"];
_cancelBut ctrlSetEventHandler ["ButtonClick", "(findDisplay 25260) closeDisplay 0"];

_firstList lbAdd (localize "STR_A3_export_tool_All_libraries");
_firstList lbAdd (localize "STR_A3_export_tool_Single_library");
_firstList lbAdd (localize "STR_A3_export_tool_Single_element"); 
_firstList lbAdd (localize "STR_A3_export_tool_Setup");
_firstList lbSetCurSel 0;
_toClipCheck cbSetChecked true;	ctrlShow [500, false];
call CT_fnc_EM_updateHint;