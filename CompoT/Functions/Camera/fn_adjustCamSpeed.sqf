/* 
   File: fn_adjustCamSpeed.sqf 
   Function: CT_fnc_adjustCamSpeed 
   Folder: Camera 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_direction","_changeSpeed","_newSpeed"];
_direction = _this;
_changeSpeed = 0;
_changeSpeed = switch true do {
	case (CT_var_camSpeed <= 0.05 AND CT_var_camSpeed >= 0.01): {0.01};
	case (CT_var_camSpeed <= 0.2 AND CT_var_camSpeed > 0.05): {0.02};
	case (CT_var_camSpeed <= 0.5 AND CT_var_camSpeed > 0.2): {0.05};
	case (CT_var_camSpeed <= 1 AND CT_var_camSpeed > 0.5): {0.1};
	case (CT_var_camSpeed <= 2 AND CT_var_camSpeed > 1): {0.2};
	case (CT_var_camSpeed <= 4 AND CT_var_camSpeed > 2): {0.4};
	case (CT_var_camSpeed <= 7 AND CT_var_camSpeed > 4): {0.7};
	case (CT_var_camSpeed <= 10 AND CT_var_camSpeed > 7): {1.2};
};
_newSpeed = CT_var_camSpeed + (_changeSpeed * _direction);
_newSpeed = _newSpeed max 0.01 min 10;
CT_var_camSpeed = _newSpeed;