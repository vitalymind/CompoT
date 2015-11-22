/* 
   File: fn_IM_handleImportSelection.sqf 
   Function: CT_fnc_IM_handleImportSelection 
   Folder: ImportMenuGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_overWriteText","_addText","_skipText","_descriptionEdit","_dateText","_typeText","_descriptionText",
"_dateEdit","_typeEdit","_authorEdit","_importList","_index","_type","_options","_authorText"];
_dialog = findDisplay 25261;
_overWriteText = _dialog displayCtrl 501;
_addText = _dialog displayCtrl 502;
_skipText = _dialog displayCtrl 503;
_descriptionEdit = _dialog displayCtrl 301;
_dateEdit = _dialog displayCtrl 302;
_typeEdit = _dialog displayCtrl 303;
_authorEdit = _dialog displayCtrl 304;
_importList = _dialog displayCtrl 400;

_index = lbCurSel _importList;
if (_index == -1) exitWith {};
_authorText = ((CT_var_IM_importOptions select _index) select 0);
_authorText = _authorText select [((count _authorText) - ((count _authorText) - 9))];
_authorEdit ctrlSetText _authorText;
_dateText = ((CT_var_IM_importOptions select _index) select 1);
_dateText = _dateText select [((count _dateText) - ((count _dateText) - 8))];
_dateEdit ctrlSetText _dateText;
_typeText = ((CT_var_IM_importOptions select _index) select 3);
_typeText = _typeText select [((count _typeText) - ((count _typeText) - 8))];
_typeEdit ctrlSetText _typeText;
_descriptionText = ((CT_var_IM_importOptions select _index) select 2);
_descriptionText = _descriptionText select [((count _descriptionText) - ((count _descriptionText) - 12))];
_descriptionEdit ctrlSetText _descriptionText;
_type = ((CT_var_IM_importOptions select _index) select 4);
_options = ((CT_var_IM_importOptions select _index) select 5);
if ((str _type) in ["[0]","[1,0]","[1,1]","[1,2]","[1,3]","[2,0]","[2,1]","[2,2]","[2,3]"]) then {
	{ctrlShow [_x, true]}forEach [501,502,503,504,203,204,205];
};
if ((str _type) in ["[3,0]","[3,1,0]","[3,1,1]","[3,1,2]"]) then {
	{ctrlShow [_x, false]}forEach [501,502,503,504,203,204,205];
};
if (_options == 0) then {"over" call CT_fnc_IM_toggleOptions};
if (_options == 1) then {"add" call CT_fnc_IM_toggleOptions};
if (_options == 2) then {"skip" call CT_fnc_IM_toggleOptions};