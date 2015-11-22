/* 
   File: fn_deleteAll.sqf 
   Function: CT_fnc_deleteAll 
   Folder: SelectTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

{deleteVehicle _x} forEach CT_var_builtObjects;
{deleteVehicle _x} forEach CT_var_builtPivots;
CT_var_builtObjects = [];
CT_var_builtPivots = [];
CT_var_mainPivot setVariable ["name",""];
CT_var_mainPivot setVariable ["size",0];
CT_var_mainPivot setVariable ["forbidden",[]];
CT_var_mainPivot setVariable ["childObjects",[]];
CT_var_mainPivot setVariable ["childPivots",[]];
["clean"] call CT_fnc_drawSelection;
call CT_fnc_clearSelect;