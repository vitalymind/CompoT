/* 
   File: fn_OM_openGUI.sqf 
   Function: ct_fnc_OM_openGUI 
   Folder: OptionMenu
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp"

disableSerialization;
private ["_dialog","_generalBut","_tutorialBut","_sliderGrp","_toggleGrp","_tutorialGrp","_rotateEdit","_heightEdit",
"_radiusEdit","_selectEdit","_camRotateEdit","_camMoveEdit","_rotateSlider","_heightSlider","_radiusSlider","_selectSlider",
"_camRotateSlider","_camMoveSlider","_unitSimToggle","_objectSimToggle"];

createDialog "ct_optionMenu";
CT_var_openedGUI = true;
"close" call CT_fnc_infoGUI;
"close" call CT_fnc_controlsGUI;

_dialog = findDisplay 25264;

_generalBut = _dialog displayCtrl CT_GENERALBUT_IDC;
_tutorialBut = _dialog displayCtrl CT_TUTORIALBUT_IDC;
_sliderGrp = _dialog displayCtrl CT_SLIDERSGROUP_IDC;
_toggleGrp = _dialog displayCtrl CT_TOGGLESGROUP_IDC;
_tutorialGrp = _dialog displayCtrl CT_TUTORIALSGROUP_IDC;

_rotateEdit = _dialog displayCtrl CT_SLIDERSROTATEEDIT_IDC;
_heightEdit = _dialog displayCtrl CT_SLIDERSHEIGHTEDIT_IDC;
_radiusEdit = _dialog displayCtrl CT_SLIDERSRADIUSEDIT_IDC;
_selectEdit = _dialog displayCtrl CT_SLIDERSSELECTEDIT_IDC;
_camRotateEdit = _dialog displayCtrl CT_SLIDERSCAMROTATIONEDIT_IDC;
_camMoveEdit = _dialog displayCtrl CT_SLIDERSCAMMOVEEDIT_IDC;

_rotateSlider = _dialog displayCtrl CT_SLIDERSROTATESLIDER_IDC;
_heightSlider = _dialog displayCtrl CT_SLIDERSHEIGHTSLIDER_IDC;
_radiusSlider = _dialog displayCtrl CT_SLIDERSRADIUSSLIDER_IDC;
_selectSlider = _dialog displayCtrl CT_SLIDERSSELECTSLIDER_IDC;
_camRotateSlider = _dialog displayCtrl CT_SLIDERSCAMROTATIONSLIDER_IDC;
_camMoveSlider = _dialog displayCtrl CT_SLIDERSCAMMOVESLIDER_IDC;

_unitSimToggle = _dialog displayCtrl CT_TOGGLESUNITSIM_IDC;
_objectSimToggle = _dialog displayCtrl CT_TOGGLESOBJECTSIM_IDC;

_tutorialGrp ctrlShow false;

if (ct_var_disableUnitSim) then {_unitSimToggle cbSetChecked false} else {_unitSimToggle cbSetChecked true};
if (ct_var_disableSim) then {_objectSimToggle cbSetChecked false} else {_objectSimToggle cbSetChecked true};

_dialog displayAddEventHandler ["unload", "call CT_fnc_OM_closeGUI"];

_generalBut ctrlSetEventHandler ["ButtonClick", "'general' call CT_fnc_OM_switchTab;"];
_tutorialBut ctrlSetEventHandler ["ButtonClick", "'tutorial' call CT_fnc_OM_switchTab;"];

_rotateEdit ctrlSetEventHandler ["KeyDown", "['objRotate',_this] call CT_fnc_OM_handleEdit;"];
_heightEdit ctrlSetEventHandler ["KeyDown", "['objHeight',_this] call CT_fnc_OM_handleEdit;"];
_radiusEdit ctrlSetEventHandler ["KeyDown", "['compoRadius',_this] call CT_fnc_OM_handleEdit;"];
_selectEdit ctrlSetEventHandler ["KeyDown", "['objSelect',_this] call CT_fnc_OM_handleEdit;"];
_camRotateEdit ctrlSetEventHandler ["KeyDown", "['camRotate',_this] call CT_fnc_OM_handleEdit;"];
_camMoveEdit ctrlSetEventHandler ["KeyDown", "['camMove',_this] call CT_fnc_OM_handleEdit;"];

_rotateSlider ctrlSetEventHandler ["SliderPosChanged", "['objRotate',_this] call CT_fnc_OM_handleSlider;"];
_heightSlider ctrlSetEventHandler ["SliderPosChanged", "['objHeight',_this] call CT_fnc_OM_handleSlider;"];
_radiusSlider ctrlSetEventHandler ["SliderPosChanged", "['compoRadius',_this] call CT_fnc_OM_handleSlider;"];
_selectSlider ctrlSetEventHandler ["SliderPosChanged", "['objSelect',_this] call CT_fnc_OM_handleSlider;"];
_camRotateSlider ctrlSetEventHandler ["SliderPosChanged", "['camRotate',_this] call CT_fnc_OM_handleSlider;"];
_camMoveSlider ctrlSetEventHandler ["SliderPosChanged", "['camMove',_this] call CT_fnc_OM_handleSlider;"];

_unitSimToggle ctrlSetEventHandler ["CheckedChanged", "['unitSim',_this] call CT_fnc_OM_handleToggle;"];
_objectSimToggle ctrlSetEventHandler ["CheckedChanged", "['objectSim',_this] call CT_fnc_OM_handleToggle;"];

_rotateSlider sliderSetPosition ct_var_rotateAngle;
_heightSlider sliderSetPosition ct_var_heightChange;
_radiusSlider sliderSetPosition ct_var_radiusChange;
_selectSlider sliderSetPosition ct_var_selectRange;
_camRotateSlider sliderSetPosition ct_var_camRotateSpeed;
_camMoveSlider sliderSetPosition ct_var_camSpeed;

_rotateEdit ctrlSetText str ct_var_rotateAngle;
_heightEdit ctrlSetText str ct_var_heightChange;
_radiusEdit ctrlSetText str ct_var_radiusChange;
_selectEdit ctrlSetText str ct_var_selectRange;
_camRotateEdit ctrlSetText str ct_var_camRotateSpeed;
_camMoveEdit ctrlSetText str ct_var_camSpeed;
