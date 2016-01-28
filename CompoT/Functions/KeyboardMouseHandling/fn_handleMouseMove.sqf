/* 
   File: fn_handleMouseMove.sqf 
   Function: CT_fnc_handleMouseMove 
   Folder: KeyboardMouseHandling 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

if (CT_var_openedGUI) exitWith {false};

if (CT_var_mouseCursorActive) then {
	if (CT_var_forceCamRotate) then {_this call CT_fnc_camRotate};
} else {
	_this call CT_fnc_camRotate;
};
call CT_fnc_camMove;
call CT_fnc_cursorUpdate;

if (!CT_var_camIsRotating) then {CT_var_camIsRotating = true};

if (CT_var_GUIdelayCounter < (diag_fps * 0.33)) then {
	CT_var_GUIdelayCounter = CT_var_GUIdelayCounter + 1;
} else {
	CT_var_GUIdelayCounter = 0;
	call CT_fnc_infoUpdate;
	call CT_fnc_controlsUpdate;
};

true;
