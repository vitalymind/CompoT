/* 
   File: fn_handleMouseHold.sqf 
   Function: CT_fnc_handleMouseHold 
   Folder: KeyboardMouseHandling 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

if (CT_var_openedGUI) exitWith {false};

call CT_fnc_camMove;
call CT_fnc_cursorUpdate;

if (CT_var_camIsRotating) then {CT_var_camIsRotating = false};

if (CT_var_GUIdelayCounter < 20) then {
	CT_var_GUIdelayCounter = CT_var_GUIdelayCounter + 1;
} else {
	CT_var_GUIdelayCounter = 0;
	call CT_fnc_infoUpdate;
	call CT_fnc_controlsUpdate;
};

true;