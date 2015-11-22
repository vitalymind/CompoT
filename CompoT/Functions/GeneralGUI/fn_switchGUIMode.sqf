/* 
   File: fn_switchGUIMode.sqf 
   Function: CT_fnc_switchGUIMode 
   Folder: GeneralGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

switch (CT_var_curGUIMode) do {
	case "info+cursorControls": {
		CT_var_curGUIMode = "info+basicControls";
		["GUI mode set to: Info and basic controls"] call CT_fnc_notification;
		"open" call CT_fnc_infoGUI;	"open" call CT_fnc_controlsGUI;
	};
	case "info+basicControls": {
		CT_var_curGUIMode = "info";
		["GUI mode set to: Info only"] call CT_fnc_notification;
		"open" call CT_fnc_infoGUI; "close" call CT_fnc_controlsGUI;
	};
	case "info": {
		CT_var_curGUIMode = "none";
		["GUI mode set to: No GUI"] call CT_fnc_notification;
		"close" call CT_fnc_infoGUI; "close" call CT_fnc_controlsGUI;
	};
	case "none": {
		CT_var_curGUIMode = "info+cursorControls";
		["GUI mode set to: Info and cursor controls"] call CT_fnc_notification;
		"open" call CT_fnc_infoGUI;	"open" call CT_fnc_controlsGUI;
	};
};