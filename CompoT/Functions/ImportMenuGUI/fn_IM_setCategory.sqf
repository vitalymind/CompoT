/* 
   File: fn_IM_setCategory.sqf 
   Function: CT_fnc_IM_setCategory
   Folder: ImportMenuGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_destinationEdit","_importList","_destinationCat","_index","_options"];
_dialog = findDisplay 25261;
_destinationEdit = _dialog displayCtrl 305;
_importList = _dialog displayCtrl 400;
_destinationCat = ctrlText _destinationEdit;
if (_destinationCat == "") then {_destinationCat = "import"};
_index = lbCurSel _importList;
if (_index == -1) exitWith {};
if (count CT_var_IM_importOptions == 0) exitWith {};
_options = (CT_var_IM_importOptions select _index);
_options set [6, _destinationCat];
