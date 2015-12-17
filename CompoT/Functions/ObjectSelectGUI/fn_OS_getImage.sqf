/* 
   File: fn_OS_getImage.sqf 
   Function: CT_fnc_OS_getImage 
   Folder: ObjectSelectGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_classname","_result"];
_classname = _this;
_result = if (_classname in CT_var_OS_allClassesWithPictures) then {
	format ["composition_tool_data\Data\objects\%1.paa", _classname];
} else {
	"composition_tool_data\Data\objects\no_image.paa";
};
_result;