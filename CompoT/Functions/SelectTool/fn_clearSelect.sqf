/* 
   File: fn_clearSelect.sqf 
   Function: CT_fnc_clearSelect 
   Folder: SelectTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

CT_var_sel deleteRange [0, count CT_var_sel];
ct_var_selDrawIcons deleteRange [0, count ct_var_selDrawIcons];
CT_var_selectedClone = objNull;