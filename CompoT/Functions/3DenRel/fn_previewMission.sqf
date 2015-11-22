/* 
   File: fn_previewMission.sqf 
   Function: CT_fnc_previewMission
   Folder: 3DenRel 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp"

waitUntil {!isNull (findDisplay 46)};

100 cutText ["","BLACK OUT", 0.001];

//INIT VARIABLE
call compile preprocessfilelinenumbers "composition_tool\Data\CT_variables.sqf";

call CT_fnc_buildMainPivot;

//LINK PROJECT
ct_var_curProject = uinamespace getVariable "CT_var_gui_curProject";

//BUILD PROJECT
ct_var_disableSim = false;
ct_var_curProject call CT_fnc_importStructure;

//HIDE PIVOTS
{
	_x hideObject true;
} forEach CT_var_builtPivots;
ct_var_mainPivot hideObject true;

100 cutText ["","BLACK IN", 1];



