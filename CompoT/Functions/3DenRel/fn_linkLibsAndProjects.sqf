/* 
   File: fn_linkLibsAndProjects.sqf 
   Function: CT_fnc_linkLibsAndProjects
   Folder: 3DenRel 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp"

ct_var_objects = (uinamespace getVariable "CT_var_gui_libraries") select 0;
ct_var_compositions = (uinamespace getVariable "CT_var_gui_libraries") select 1;
ct_var_collections = (uinamespace getVariable "CT_var_gui_libraries") select 2;
ct_var_prefabs = (uinamespace getVariable "CT_var_gui_libraries") select 3;
ct_var_projects = uinamespace getVariable "CT_var_gui_projects";
ct_var_curProject = uinamespace getVariable "CT_var_gui_curProject";