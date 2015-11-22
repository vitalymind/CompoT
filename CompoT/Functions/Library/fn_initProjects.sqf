/* 
   File: fn_initProjects.sqf 
   Function: CT_fnc_initProjects
   Folder: Library 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp"

uinamespace setVariable ["CT_var_gui_projects", nil];
uinamespace setVariable ["CT_var_gui_curProject", nil];
uinamespace setVariable ["CT_var_gui_projects",[]];
uinamespace setVariable ["CT_var_gui_curProject",[]];

_loadedProjects = call compile preprocessfilelinenumbers "ct_projects.sqf";
if (!isNil "_loadedProjects") then {
	{
		(uinamespace getVariable "CT_var_gui_projects") pushBack (_x select 5);
	} forEach _loadedProjects;
	_loadedProjects = nil;
};

ct_var_projects = uinamespace getVariable "CT_var_gui_projects";

if (count (uinamespace getVariable "CT_var_gui_projects") > 0) then {
	uinamespace setVariable ["CT_var_gui_curProject",((uinamespace getVariable "CT_var_gui_projects") select 0)];
	ct_var_curProject = uinamespace getVariable "CT_var_gui_curProject";
} else {
	uinamespace setVariable ["CT_var_gui_curProject",[]];
	ct_var_curProject = uinamespace getVariable "CT_var_gui_curProject";
};
diag_log "ct projects loaded";