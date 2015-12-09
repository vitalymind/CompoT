/* 
   File: fn_scGUIOpen.sqf 
   Function: CT_fnc_scGUIOpen 
   Folder: SaveCompositionGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_pivot","_dialog","_saveBut","_cancelBut","_categoryList","_compoNameEdit","_warningsText",
"_name"];
_pivot = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
if (SOMETHING_SELECTED AND (isNull _pivot)) then {
	if (SEL_LIB == "pivot") then {_pivot = FIRST_SELECTION};
};
if (isNull _pivot) exitWith {["Pivot must be selected"] call CT_fnc_errorMsg};
CT_var_openedGUI = true;
CT_var_holdenKeys = [false,false,false,false,false,false,false,false,false];
createDialog "save_compo";
_dialog = findDisplay 25254;
_categoryList = _dialog displayCtrl 100;
_saveBut = _dialog displayCtrl 300;
_cancelBut = _dialog displayCtrl 301;
_compoNameEdit = _dialog displayCtrl 200;
_warningsText = _dialog displayCtrl 400;

_dialog displayAddEventHandler ["unload", "CT_var_openedGUI = false;"];
_saveBut ctrlSetText (localize "STR_A3_save_composition_save_but");
_cancelBut ctrlSetText (localize "STR_A3_save_composition_cancel_but");

_saveBut ctrlSetEventHandler ["ButtonClick", "call CT_fnc_scGUISaveComposition; true;"];
_cancelBut ctrlSetEventHandler ["ButtonClick", "
	if (uinamespace getVariable ['CT_var_GUI_scOverwrite', false]) then {
		((findDisplay 25254) displayCtrl 400) ctrlSetText '';
		((findDisplay 25254) displayCtrl 300) ctrlSetText (localize 'STR_A3_save_composition_save_but');
		uinamespace setVariable ['CT_var_GUI_scOverwrite', false];
	} else {
		(findDisplay 25254) closeDisplay 0; 
		CT_var_openedGUI = false;
	};
	true;
"];

uinamespace setVariable ["CT_var_GUI_scOverwrite", false];
uinamespace setVariable ["CT_var_GUI_scPivot", _pivot];

{
	_name = _x select 0;
	if (_name != "temporary") then {_categoryList lbAdd _name};
} forEach CT_var_compositions;