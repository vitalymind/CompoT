/* 
   File: fn_openCT.sqf 
   Function: CT_fnc_openCT
   Folder: 3DenRel 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp"

private ["_camData","_arr"];
waitUntil {!isNull (findDisplay 46)};

100 cutText ["","BLACK OUT", 0.001];

//INIT VARIABLE
call compile preprocessfilelinenumbers "composition_tool\Data\CT_variables.sqf";

//LOAD USER SETTINGS
_objectRotateSpeed = profileNamespace getVariable ["ct_var_PN_objectRotateSpeed", -1];
_objectHeightChange = profileNamespace getVariable ["ct_var_PN_objectHeightChange", -1];
_compositionRadiusChange = profileNamespace getVariable ["ct_var_PN_compositionRadiusChange", -1];
_objectSelectRange = profileNamespace getVariable ["ct_var_PN_objectSelectRange", -1];
_cameraRotateSpeed = profileNamespace getVariable ["ct_var_PN_cameraRotateSpeed", -1];
_cameraMoveSpeed = profileNamespace getVariable ["ct_var_PN_cameraMoveSpeed", -1];
if (_objectRotateSpeed != -1) then {ct_var_rotateAngle = _objectRotateSpeed};
if (_objectHeightChange != -1) then {ct_var_heightChange = _objectHeightChange};
if (_compositionRadiusChange != -1) then {ct_var_radiusChange = _compositionRadiusChange};
if (_objectSelectRange != -1) then {ct_var_selectRange = _objectSelectRange};
if (_cameraRotateSpeed != -1) then {ct_var_camRotateSpeed = _cameraRotateSpeed};
if (_cameraMoveSpeed != -1) then {ct_var_camSpeed = _cameraMoveSpeed};

call CT_fnc_buildMainPivot;

//DISABLE/ENABLE SIMULATION
if (!(uinamespace getVariable ["CT_var_gui_enableUnitsSim", false])) then {
	{
		_x enableSimulation false;
		_x allowDamage false;
	} forEach (allUnits + vehicles);
	ct_var_disableUnitSim = true;
} else {
	{
		_x enableSimulation true;
		_x allowDamage true;
	} forEach (allUnits + vehicles);
	ct_var_disableUnitSim = false;
};
if (uinamespace getVariable ["CT_var_gui_enableObjectsSim", false]) then {
	ct_var_disableSim = false;
} else {
	ct_var_disableSim = true;
};

//INIT CAMERA
_camData = uiNameSpace getVariable ["CT_var_gui_camera",[(getPosATL player), 0, [0,0]]];
ct_var_cam = 'camera' camCreate (_camData select 0);
ct_var_cam cameraEffect ["internal","back"];
ct_var_cam setDir (_camData select 1);
[ct_var_cam, ((_camData select 2) select 0),((_camData select 2) select 1)] call CT_fnc_setPB;
showCinemaBorder false;
cameraEffectEnableHUD true;

//LINK LIBRARIES AND PROJECTS
call CT_fnc_linkLibsAndProjects;

//UPDATE USED NAMES
call CT_fnc_updateUsedNames;

//CHECK MODS
call CT_fnc_checkMods;

//INIT EVENTHANDLERS
call CT_fnc_installAllEHs;

//BUILD PROJECT
ct_var_curProject call CT_fnc_importStructure;

//INIT GUI
"buildTool" call CT_fnc_cursorChangeTool; "buildTool" call CT_fnc_cursorChangeTool;
"open" call CT_fnc_infoGUI;
"open" call CT_fnc_controlsGUI;

//SET PATH TO MISSION ROOT
uiNameSpace setVariable ["CT_var_gui_pathToMission",""];
_arr = toArray str missionConfigFile;
if (count _arr > 15) then {
	_arr resize (count _arr - 15);
	uiNameSpace setVariable ["CT_var_gui_pathToMission",(toString _arr)];
};

100 cutText ["","BLACK IN", 1];



