/* 
   File: fn_OM_closeGUI.sqf 
   Function: ct_fnc_OM_closeGUI
   Folder: OptionMenu
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp"

profileNamespace setVariable ["ct_var_PN_objectRotateSpeed", ct_var_rotateAngle];
profileNamespace setVariable ["ct_var_PN_objectHeightChange", ct_var_heightChange];
profileNamespace setVariable ["ct_var_PN_compositionRadiusChange", ct_var_radiusChange];
profileNamespace setVariable ["ct_var_PN_objectSelectRange", ct_var_selectRange];
profileNamespace setVariable ["ct_var_PN_cameraRotateSpeed", ct_var_camRotateSpeed];
profileNamespace setVariable ["ct_var_PN_cameraMoveSpeed", ct_var_camSpeed];
saveProfileNamespace;

CT_var_openedGUI = false; 
'open' call CT_fnc_infoGUI;
'open' call CT_fnc_controlsGUI;