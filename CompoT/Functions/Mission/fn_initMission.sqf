/* 
   File: fn_initMission.sqf 
   Function: CT_fnc_initMission
   Folder: Mission 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

//INIT VARIABLE
CT_var_usedNames = [];
CT_var_slopeMode = "sea";
CT_var_builtObjects = [];
CT_var_builtPivots = [];
CT_var_mainPivot = objNull;
CT_var_objects = [];
CT_var_collections = [];
CT_var_compositions = [];
CT_var_prefabs = [];
CT_var_disableSim = false;
ct_var_projects = [];
ct_var_projects = call compile preprocessFileLineNumbers "ct_projects.sqf";

//BUILDING
call CT_fnc_buildMainPivot;
((ct_var_projects select 0) select 5) call CT_fnc_importStructure;

//HIDE PIVOTS
{
	_x hideObject true;
} forEach CT_var_builtPivots;
ct_var_mainPivot hideObject true;
