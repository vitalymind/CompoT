/* 
   File: fn_init.sqf 
   Function: CT_fnc_init
   Folder: Common 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp"

private ["_center","_ehs","_objectRotateSpeed","_objectHeightChange","_compositionRadiusChange","_objectSelectRange",
"_cameraRotateSpeed","_cameraMoveSpeed"];

Switch (_this) do {
	case "load": {
		//INIT VARIABLE
		call compile preprocessfilelinenumbers "composition_tool\Data\CT_variables.sqf";
		
		//RESET UINAMESPACE VARIABLE
		uinamespace setVariable ["CT_var_gui_editorLoaded", nil];
		uinamespace setVariable ["CT_var_gui_runMode", nil];
		uinamespace setVariable ["CT_var_gui_camera", nil];
		uinamespace setVariable ["CT_var_gui_enableUnitsSim", false];
		uinamespace setVariable ["CT_var_gui_enableObjectsSim", false];
		uinamespace SetVariable ["CT_var_gui_OSMopened", false];
		uinamespace setVariable ["CT_var_gui_pickedObject", nil];
		uinamespace setVariable ["CT_var_gui_pickedObjectClass", nil];

		//INIT LIBRARIES
		call CT_fnc_initLibraries;

		//INIT PROJECTS
		call CT_fnc_initProjects;

		//BUILDING MAIN PIVOT
		if ((getMarkerType "center") == "") then {
			_center = (configfile >> "CfgWorlds" >> worldName >> "centerPosition") call BIS_fnc_getCfgData;
			_center set [2,0];
			createMarkerLocal ["center", _center];
			ct_var_mainPivot = CENTER_PIVOT createVehicleLocal _center;
			ct_var_mainPivot setDir 0;
			ct_var_mainPivot setPosATL _center;
		} else {
			_center = getMarkerPos "center";
			_center set [2,0];
			ct_var_mainPivot = CENTER_PIVOT createVehicleLocal _center;
			ct_var_mainPivot setDir 0;
			ct_var_mainPivot setPosATL _center;
		};
		[ct_var_mainPivot, 0, 0] call CT_fnc_setPB;
		ct_var_mainPivot setVariable ["name","Main"];
		ct_var_mainPivot setVariable ["size",0];
		ct_var_mainPivot setVariable ["forbidden",[]];
		ct_var_mainPivot setVariable ["childObjects",[]];
		ct_var_mainPivot setVariable ["childPivots",[]];

		//INIT 3DEN EVENTHANDLERS
		_ehs = [];
		if (count (uinamespace getVariable ["CT_var_gui_3denEHs", []]) == 0) then {
			_ehs pushBack ((findDisplay 313) displayAddEventHandler ["unload", {
				uinamespace setVariable ["CT_var_gui_editorLoaded", nil];
				uinamespace setVariable ["CT_var_gui_runMode", nil];
				uinamespace setVariable ["CT_var_gui_camera", nil];
				uinamespace setVariable ["CT_var_gui_edenEHs", nil];
				uinamespace setVariable ["CT_var_gui_3denEHs", nil];
				uinamespace SetVariable ["CT_var_gui_OSMopened", nil];
				uinamespace setVariable ["CT_var_gui_pickedObject", nil];
				uinamespace setVariable ["CT_var_gui_pickedObjectClass", nil];
			}]);
			_ehs pushBack ((findDisplay 313) displayAddEventHandler ["keyDown", {_this call CT_fnc_3denKeyDown}]);
			_ehs pushBack ((findDisplay 313) displayAddEventHandler ["keyUp", {_this call CT_fnc_3denKeyUp}]);
			_ehs pushBack ((findDisplay 313) displayAddEventHandler ["mouseMoving", {_this call CT_fnc_3denMouseMove}]);
			_ehs pushBack ((findDisplay 313) displayAddEventHandler ["mouseHolding", {_this call CT_fnc_3denMouseMove}]);
			_ehs pushBack ((findDisplay 313) displayAddEventHandler ["MouseButtonDown", {_this call CT_fnc_3denMouseButtonDown}]);
			_ehs pushBack ((findDisplay 313) displayAddEventHandler ["mouseZChanged", {_this call CT_fnc_3denMouseZChange}]);
			uinamespace setVariable ["CT_var_gui_3denEHs", _ehs];
		};
		
		//BUILD PROJECT + FILL PROJECT LIST
		call CT_fnc_updateProjectsList;
		((findDisplay 313) displayCtrl CT_PROJECTCOMBO_IDC) lbSetCurSel 0;

		//SHOW PANEL
		((finddisplay 313) displayCtrl CT_PANEL_IDC) ctrlShow true;
		((finddisplay 313) displayCtrl CT_PANEL_IDC) ctrlenable true;
		
		//MARK CT HAS LOADED
		uinamespace setVariable ["CT_var_gui_editorLoaded", true];
		uiNameSpace setVariable ["CT_var_gui_runMode", "3den"];
		diag_log "CT Loaded";
	};
	case "unload": {
		//UNLOAD LIBRARIES AND PROJECTS
		uinamespace setVariable ["CT_var_gui_libraries", nil];
		uinamespace setVariable ["CT_var_gui_projects", nil];
		uinamespace setVariable ["CT_var_gui_curProject", nil];
		ct_var_projects = nil;
		ct_var_curProject = nil;
		ct_var_objects = nil;
		ct_var_compositions = nil;
		ct_var_collections = nil;
		ct_var_prefabs = nil;
		
		//DELETE ALL BUILT OBJECTS
		call CT_fnc_deleteAll;
		
		//DELETE MAIN PIVOT
		deleteVehicle ct_var_mainPivot;
		
		//HIDE CONTROLS
		((finddisplay 313) displayCtrl CT_PANEL_IDC) ctrlShow false;
		((finddisplay 313) displayCtrl CT_PANEL_IDC) ctrlenable false;
		
		//RESET UINAMESPACE VARIABLE
		uinamespace setVariable ["CT_var_gui_runMode", nil];
		uinamespace setVariable ["CT_var_gui_camera", nil];
		uinamespace setVariable ["CT_var_gui_edenEHs", nil];
		uinamespace setVariable ["CT_var_gui_enableUnitsSim", nil];
		uinamespace setVariable ["CT_var_gui_enableObjectsSim", nil];
		
		//MARK CT HAS UN-LOADED
		uinamespace setVariable ["CT_var_gui_editorLoaded", false];
		diag_log "CT Un-Loaded";
	};
};







