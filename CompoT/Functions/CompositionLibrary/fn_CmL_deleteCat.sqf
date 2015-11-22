/* 
   File: fn_CmL_deleteCat.sqf 
   Function: CT_fnc_CmL_deleteCat 
   Folder: CompositionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_categoriesList","_name","_index"];
_dialog = findDisplay 25256;
_categoriesList = _dialog displayCtrl 106;
_name = _categoriesList lbText (lbCurSel _categoriesList);
if (_name == "temporary") exitWith {};
_index = -1;
{
	if (_name == (_x select 0)) exitWith {_index = _forEachindex};
} forEach CT_var_compositions;
if (_index != -1) then {
	CT_var_compositions deleteAt _index;
	call CT_fnc_CmL_fillCategories;
};