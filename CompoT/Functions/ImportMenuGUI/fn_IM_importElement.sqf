/* 
   File: fn_IM_importElement.sqf 
   Function: CT_fnc_IM_importElement 
   Folder: ImportMenuGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_libraryName","_collision","_import"];
_libraryName = _this select 0;
_collision = _this select 1;
_import = _this select 2;

/*
_importedCategoryMade = false;
if (("imported" in _libMap) AND (!_importedCategoryMade)) then {_importedCategoryMade = true; _index = _libMap find "imported";};
if (!_importedCategoryMade) then {_importedCategoryMade = true; _library pushBack ["imported",[]]; _libMap pushBack "imported";};
_index = _libMap find "imported";
((_library select _index) select 1) append _catData;
*/