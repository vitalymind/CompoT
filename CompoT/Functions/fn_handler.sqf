/* 
   File: fn_handler.sqf 
   Function: CT_fnc_handler
   Folder: Common 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp"

private ["_loaded","_input","_display","_cam","_toggle","_ctrl","_pos","_posY","_curSel","_mode","_basicCtrl","_advancedCtrl",
"_ctrlPlay","_checked","_entity"];
_input = param [0, ""];
_display = finddisplay 313;

switch (_input) do {
	//EVENTS
	case "previewEnd": {
		if (!(uinamespace getVariable ["CT_var_gui_editorLoaded", false])) exitWith {};
		call compile preprocessfilelinenumbers "composition_tool\Data\CT_variables.sqf";
		ct_var_disableSim = true;
		call CT_fnc_updateProjectsList;
		call CT_fnc_linkLibsAndProjects;
		call CT_fnc_buildMainPivot;
		call CT_fnc_updateUsedNames;
		ct_var_curProject call CT_fnc_importStructure;
		if ((uiNameSpace getVariable ["CT_var_gui_runMode", "mission"]) == "editor") then {
			[] spawn { //HACKS HACKS HACKS *facepalm*
				sleep 0.01;
				_cam = uiNameSpace getVariable ["CT_var_gui_camera",[[0,0,0],0,[0,0]]];
				get3DENCamera setPosATL (_cam select 0);
				get3DENCamera setDir (_cam select 1);
				[get3DENCamera, ((_cam select 2) select 0), ((_cam select 2) select 1)] call CT_fnc_setPB;
			};
		};
		uiNameSpace setVariable ["CT_var_gui_runMode", "3den"];
		diag_log "CT Mission preview ended";
		
		[] spawn {
			sleep 0.5;
			private _array = uiNamespace getVariable ["ct_var_hiddenObjects",[]];
			{
				_x params ["_position","_model"];
				_target = objNull;
				{if (((getModelInfo _x) select 0) == _model) exitWith {_target = _x}} forEach (nearestTerrainObjects [_position, [], 10]);
				if (!isNull _target) then {_target hideObject true};
			} forEach _array;
		};
		
	};
	case "previewStart": {
		if (!(uinamespace getVariable ["CT_var_gui_editorLoaded", false])) exitWith {};
		if ((uiNameSpace getVariable ["CT_var_gui_runMode","mission"]) == "editor") then {
			[] spawn CT_fnc_openCT;
		} else {
			[] spawn CT_fnc_previewMission;
		};
		diag_log "CT Mission preview started";
	};
	case "enterEditor": {
		if (!(uinamespace getVariable ["CT_var_gui_editorLoaded", false])) exitWith {};
		if (count (uinamespace getVariable ["CT_var_gui_projects",[]]) == 0) exitWith {["message","CT_noProject",5] call CT_fnc_handler};
		if (isNull player) exitWith {["message","CT_noPlayer",5] call CT_fnc_handler};
		uiNameSpace setVariable ["CT_var_gui_runMode", "editor"];
		uiNameSpace setVariable ["CT_var_gui_camera",[getPosATL get3DENCamera, getDir get3DENCamera, (get3DENCamera call CT_fnc_getPB)]];
		do3DENAction "MissionPreview";
		diag_log "CT editor mode activated";
	};
	case "missionLoaded": {
		if (!(uinamespace getVariable ["CT_var_gui_editorLoaded", false])) exitWith {};
		call CT_fnc_deleteAll;
		call CT_fnc_initLibraries;
		call CT_fnc_initProjects;
		call CT_fnc_buildMainPivot;
		call CT_fnc_updateProjectsList;
		call CT_fnc_updateUsedNames;
		ct_var_curProject call CT_fnc_importStructure;
		diag_log "CT mission loaded";
	};
	case "newMission": {
		if (!(uinamespace getVariable ["CT_var_gui_editorLoaded", false])) exitWith {};
		call compile preprocessfilelinenumbers "composition_tool\Data\CT_variables.sqf";
		call CT_fnc_deleteAll;
		call CT_fnc_initLibraries;
		call CT_fnc_initProjects;
		call CT_fnc_buildMainPivot;
		call CT_fnc_updateProjectsList;
		call CT_fnc_updateUsedNames;
		ct_var_curProject call CT_fnc_importStructure;
		diag_log "CT New mission opened";
	};
	case "message": {
		[_this select 1,_this select 2] call BIS_fnc_3DENNotification;
	};
	
	//PROJECTS
	case "selectProject": {
		_comboCtrl = _display displayCtrl CT_PROJECTCOMBO_IDC;
		_curSel = lbCurSel _comboCtrl;
		_projectName = _comboCtrl lbText _curSel;
		{
			if (_projectName == (_x select 0)) exitWith {
				uinamespace setVariable ["CT_var_gui_curProject",_x];
			};
		} forEach (uinamespace getVariable ["CT_var_gui_projects",[]]);
		
		if (count (uinamespace getVariable "CT_var_gui_projects") == 0) then {
			uinamespace setVariable ["CT_var_gui_curProject",[]];
		};
		call CT_fnc_deleteAll;
		call CT_fnc_linkLibsAndProjects;
		call CT_fnc_updateProjectsList;
		call CT_fnc_updateUsedNames;
		ct_var_curProject call CT_fnc_importStructure;
		diag_log "ct project selected";
	};
	case "newProject": {
		(_display displayCtrl CT_PROMTWINDOW_IDC) ctrlShow true;
		(_display displayCtrl CT_PROMTWINDOW_IDC) ctrlEnable true;
		(_display displayCtrl CT_WARNINGIMAGE_IDC) ctrlSetText "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\new_ca.paa";
		(_display displayCtrl CT_WARNINGTEXT_IDC) ctrlSetText (localize "STR_A3_ct_eden_gui_inputName_warning");
		(_display displayCtrl CT_PROMTWINEDITBOX_IDC) ctrlShow true;
		(_display displayCtrl CT_PROMTWINEDITBOX_IDC) ctrlEnable true;
		ctrlSetFocus (_display displayCtrl CT_PROMTWINEDITBOX_IDC);
		
		(_display displayCtrl CT_PROMTWINOKBUT_IDC) buttonSetAction "['newProjectNameConfirmed'] call CT_fnc_handler";
		(_display displayCtrl CT_PROMTWINCANCELBUT_IDC) buttonSetAction "['newProjectCancel'] call CT_fnc_handler";
		
		//FREEZE ALL CT CONTROLS
		(_display displayCtrl CT_PANEL_IDC) ctrlEnable false;
		diag_log "ct promt user before closing CT";
	};
	case "newProjectCancel": {
		//UN-FREEZE ALL CT CONTROLS
		(_display displayCtrl CT_PANEL_IDC) ctrlEnable true;
		
		(_display displayCtrl CT_PROMTWINOKBUT_IDC) buttonSetAction "";
		(_display displayCtrl CT_PROMTWINCANCELBUT_IDC) buttonSetAction "";
		(_display displayCtrl CT_PROMTWINDOW_IDC) ctrlShow false;
		(_display displayCtrl CT_PROMTWINDOW_IDC) ctrlEnable false;
		
		diag_log "ct user cancel new project creation";
	};
	case "newProjectNameConfirmed": {
		_name = ctrltext (_display displayCtrl CT_PROMTWINEDITBOX_IDC);
		if (_name == "") exitWith {["message","CT_nameEmpty",5] call CT_fnc_handler};
		//UN-FREEZE ALL CT CONTROLS
		(_display displayCtrl CT_PANEL_IDC) ctrlEnable true;
		
		(_display displayCtrl CT_PROMTWINDOW_IDC) ctrlShow false;
		(_display displayCtrl CT_PROMTWINDOW_IDC) ctrlEnable false;
		(_display displayCtrl CT_PROMTWINOKBUT_IDC) buttonSetAction "";
		(_display displayCtrl CT_PROMTWINCANCELBUT_IDC) buttonSetAction "";
		
		_center = (configfile >> "CfgWorlds" >> worldName >> "centerPosition") call BIS_fnc_getCfgData;
		_center set [2,0];
		(uinamespace getVariable ["CT_var_gui_projects", []]) pushBack [_name, _center, []];
		call CT_fnc_updateProjectsList;
		_combo = _display displayCtrl CT_PROJECTCOMBO_IDC;
		_combo lbSetCurSel ((lbSize _combo) - 1);
		call CT_fnc_updateUsedNames;
		ct_var_curProject call CT_fnc_importStructure;
		diag_log "ct new project created";
	};
	case "deleteProjectConfirm": {
		//UN-FREEZE ALL CT CONTROLS
		(_display displayCtrl CT_PANEL_IDC) ctrlEnable true;
		
		(_display displayCtrl CT_PROMTWINDOW_IDC) ctrlShow false;
		(_display displayCtrl CT_PROMTWINDOW_IDC) ctrlEnable false;
		(_display displayCtrl CT_PROMTWINOKBUT_IDC) buttonSetAction "";
		(_display displayCtrl CT_PROMTWINCANCELBUT_IDC) buttonSetAction "";
		
		_projects = uinamespace getVariable ["CT_var_gui_projects", []];
		_combo = _display displayCtrl CT_PROJECTCOMBO_IDC;
		_name = _combo lbText (lbCurSel _combo);
		_i = -1;
		{
			if ((_x select 0) == _name) exitWith {
				_i = _forEachIndex;
			};
		} forEach _projects;
		_projects deleteAt _i;
		call CT_fnc_updateProjectsList;
		_combo lbSetCurSel 0;
		call CT_fnc_updateUsedNames;
		ct_var_curProject call CT_fnc_importStructure;
		diag_log "ct project deleted";
	};
	case "deleteProjectCancel": {
		//UN-FREEZE ALL CT CONTROLS
		(_display displayCtrl CT_PANEL_IDC) ctrlEnable true;
		
		(_display displayCtrl CT_PROMTWINOKBUT_IDC) buttonSetAction "";
		(_display displayCtrl CT_PROMTWINCANCELBUT_IDC) buttonSetAction "";
		(_display displayCtrl CT_PROMTWINDOW_IDC) ctrlShow false;
		(_display displayCtrl CT_PROMTWINDOW_IDC) ctrlEnable false;
		diag_log "ct user canceled project delete";
	};
	case "deleteProject": {
		_projects = uinamespace getVariable ["CT_var_gui_projects", []];
		if (count _projects == 0) exitWith {};
		_combo = _display displayCtrl CT_PROJECTCOMBO_IDC;
		_name = _combo lbText (lbCurSel _combo);
		(_display displayCtrl CT_PROMTWINDOW_IDC) ctrlShow true;
		(_display displayCtrl CT_PROMTWINDOW_IDC) ctrlEnable true;
		(_display displayCtrl CT_WARNINGIMAGE_IDC) ctrlSetText "composition_tool_data\data\UI\ct_warning.paa";
		(_display displayCtrl CT_WARNINGTEXT_IDC) ctrlSetText (format [localize "STR_A3_ct_eden_gui_deleteProject_warning", _name]);
		(_display displayCtrl CT_PROMTWINEDITBOX_IDC) ctrlShow false;
		(_display displayCtrl CT_PROMTWINEDITBOX_IDC) ctrlEnable false;
		
		(_display displayCtrl CT_PROMTWINOKBUT_IDC) buttonSetAction "['deleteProjectConfirm'] call CT_fnc_handler";
		(_display displayCtrl CT_PROMTWINCANCELBUT_IDC) buttonSetAction "['deleteProjectCancel'] call CT_fnc_handler";
		
		//FREEZE ALL CT CONTROLS
		(_display displayCtrl CT_PANEL_IDC) ctrlEnable false;
	};
	
	//UI CONTROL
	case "toggleCT": {
		_checked = (_this select 1) select 1;
		if (_checked == 1) then {
			{
				(_display displayCtrl _x) ctrlShow false;
				(_display displayCtrl _x) ctrlenable false;
			} forEach [CT_MODETAB_IDC, CT_ADVANCEDMODETAB_IDC, CT_BASICMODETAB_IDC];
			diag_log "ct panel hiden";
		} else {
			{
				(_display displayCtrl _x) ctrlShow true;
				(_display displayCtrl _x) ctrlenable true;
			} forEach [CT_MODETAB_IDC, CT_ADVANCEDMODETAB_IDC, CT_BASICMODETAB_IDC];
			_mode = uinamespace getvariable ["CT_var_gui_ctMode",0];
			switch (_mode) do {
				case 0: {["modeChange", 0, 1] call CT_fnc_handler};
				case 1: {["modeChange", 1, 0] call CT_fnc_handler};
			};
			diag_log "ct panel shown";
		};
	};
	case "enterEditorMP": {
		diag_log "Not yet implemented";
	};
	case "discardUnloadCT": {
		//UN-FREEZE ALL CT CONTROLS
		(_display displayCtrl CT_PANEL_IDC) ctrlEnable true;
		
		(_display displayCtrl CT_PROMTWINOKBUT_IDC) buttonSetAction "";
		(_display displayCtrl CT_PROMTWINCANCELBUT_IDC) buttonSetAction "";
		(_display displayCtrl CT_PROMTWINDOW_IDC) ctrlShow false;
		(_display displayCtrl CT_PROMTWINDOW_IDC) ctrlEnable false;
		
		diag_log "ct user cancel CT unload";
	};
	case "confirmUnloadCT": {
		//UN-FREEZE ALL CT CONTROLS
		(_display displayCtrl CT_PANEL_IDC) ctrlEnable true;
		
		(_display displayCtrl CT_PROMTWINDOW_IDC) ctrlShow false;
		(_display displayCtrl CT_PROMTWINDOW_IDC) ctrlEnable false;
		(_display displayCtrl CT_PROMTWINOKBUT_IDC) buttonSetAction "";
		(_display displayCtrl CT_PROMTWINCANCELBUT_IDC) buttonSetAction "";
		
		diag_log "ct user confirmed CT unload";
		'unload' call CT_fnc_init;
	};
	case "loadOrUnloadCT": {
		_loaded = uinamespace getVariable ["CT_var_gui_editorLoaded", false];
		if (_loaded) then {
			(_display displayCtrl CT_PROMTWINDOW_IDC) ctrlShow true;
			(_display displayCtrl CT_PROMTWINDOW_IDC) ctrlEnable true;
			(_display displayCtrl CT_WARNINGTEXT_IDC) ctrlSetText (localize "STR_A3_ct_eden_gui_confirmUnloadCT_warinng");
			(_display displayCtrl CT_WARNINGIMAGE_IDC) ctrlSetText "composition_tool_data\data\UI\ct_warning.paa";
			(_display displayCtrl CT_PROMTWINOKBUT_IDC) buttonSetAction "['confirmUnloadCT'] call CT_fnc_handler";
			(_display displayCtrl CT_PROMTWINCANCELBUT_IDC) buttonSetAction "['discardUnloadCT'] call CT_fnc_handler";
			(_display displayCtrl CT_PROMTWINEDITBOX_IDC) ctrlShow false;
			(_display displayCtrl CT_PROMTWINEDITBOX_IDC) ctrlEnable false;
			
			//FREEZE ALL CT CONTROLS
			(_display displayCtrl CT_PANEL_IDC) ctrlEnable false;
			diag_log "ct promt user before closing CT";
		} else {
			'load' call CT_fnc_init;
			["modeChange", 0,1] call CT_fnc_handler;
		};
	};
	case "modeChange": {
		_curSel = _this param [1,-1];
		_mode = _this param [2,(uinamespace getvariable ["CT_var_gui_ctMode",0])];
		_basicCtrl = _display displayCtrl CT_BASICMODETAB_IDC;
		_advancedCtrl = _display displayCtrl CT_ADVANCEDMODETAB_IDC;
		if (_mode == 1 AND _curSel == 0) then {
			_basicCtrl ctrlShow true;
			_advancedCtrl ctrlShow false;
			uinamespace setvariable ["CT_var_gui_ctMode",0];
			diag_log "ct mode changed to basic";
		};
		if (_mode == 0 AND _curSel == 1) then {
			_basicCtrl ctrlShow false;
			_advancedCtrl ctrlShow true;
			_ctrlPlay = _display displayCtrl CT_STRATCTBUTTON_IDC;
			_ctrlPlay ctrlsetstructuredtext parsetext format ["<t size='1.8'>%1</t>",(localize "STR_A3_ct_eden_gui_start_but")];
			uinamespace setvariable ["CT_var_gui_ctMode",1];
			diag_log "ct mode changed to advanced";
		};
	};
	case "placeLogic": {
		_entity = create3DENEntity ["Logic", "Logic", screenToWorld [0.5,0.5]];
		_entity set3DENAttribute ["init",'if (isServer AND !((uiNameSpace getVariable ["CT_var_gui_runMode", ""]) in ["3den","editor"])) then { call compile preprocessfilelinenumbers "ct_functions.sqf"; call CT_fnc_initMission; };'];
	};

	//OPTIONS
	case "toggleRotationClamp": {
		_toggle = (_this select 1) select 1;
		if (_toggle == 0) then {
			terminate ct_clapRotation_handle;
		} else {
			terminate ct_clapRotation_handle;
			ct_clapRotation_handle = [] spawn {
				while {true} do {
					waitUntil {current3DENOperation == "MoveItems"};
					_vectors = [];
					_objects = get3DENSelected "object";
					if (count _objects != 0) then {
						{
							_vectors pushBack ((_x get3DENAttribute "rotation") select 0);
						} forEach _objects;
					};
					waitUntil {current3DENOperation != "MoveItems"};
					{
						_x set3DENAttribute ["rotation", (_vectors select _forEachIndex)];
					} forEach _objects;
				};
			};
		};
	};
	case "toggleUnitSim": {
		diag_log "ct toggle unit sim";
		_toggle = (_this select 1) select 1;
		if (_toggle == 0) then {
			uinamespace setVariable ["CT_var_gui_enableUnitsSim", false];
		} else {
			uinamespace setVariable ["CT_var_gui_enableUnitsSim", true];
		};
	};
	case "toggleObjectsSim": {
		_toggle = (_this select 1) select 1;
		if (_toggle == 0) then {
			uinamespace setVariable ["CT_var_gui_enableObjectsSim", false];
		} else {
			uinamespace setVariable ["CT_var_gui_enableObjectsSim", true];
		};
		diag_log "ct toggle object sim";
	};

	//EXPORTING
	case "exportLib": {
		["libs"] call CT_fnc_saveFile;
		diag_log "ct lib exported";
	};
	case "exportProjects": {
		["projects"] call CT_fnc_saveFile;
		diag_log "ct project exported";
	};

};














