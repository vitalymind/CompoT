/* 
   File: fn_updateProjectsList.sqf 
   Function: CT_fnc_updateProjectsList
   Folder: 3DenRel 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp"

private ["_display", "_combo","_index"];

_display = findDisplay 313;
_combo = _display displayCtrl CT_PROJECTCOMBO_IDC;
lbClear _combo;
{
	_index = _combo lbAdd (_x select 0);
} forEach (uinamespace getVariable ["CT_var_gui_projects",[]]);











