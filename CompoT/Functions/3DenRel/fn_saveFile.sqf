/* 
   File: fn_saveFile.sqf 
   Function: CT_fnc_saveFile
   Folder: 3DenRel 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool. This function is optional, it is using KK`s great makefile.dll v1.5. It is up to user to decide using this route.
*/ 
#include "defines.hpp"

private ["_project","_makeFileVersion","_filePath","_nl","_text","_projects","_i","_case","_curProjectName"];

_case = _this select 0;
_makeFileVersion = "";
_makeFileVersion = ("make_file" callExtension "ABOUT");
_filePath = uinamespace getVariable ["CT_var_gui_pathToMission",""];

_nl = "\n";
_text = ""; 
_projects = []; _cur = []; _rest = [];
_i = 0;

if (_case == "projects") then {
	if ((count (uinamespace getVariable "CT_var_gui_curProject")) != 0) then {
		_curProjectName = ((uinamespace getVariable "CT_var_gui_curProject") select 0);
		{
			if (_curProjectName == (_x select 0)) then {
				_cur pushback _x;
			} else {
				_rest pushback _x;
			};
		} forEach (uinamespace getVariable "CT_var_gui_projects");
		_projects append _cur;
		_projects append _rest;
	};
};

if ((_makeFileVersion != "") AND (_filePath != "") AND HK_SHIFT) then {
	switch (_case) do {
		case "libs": {
			_text = _text + '["Author:     Unknown",' + _nl + '"Date:        01.01.2015",' + _nl + '"Decription:  none",' + _nl + '"Type:        All libraries",' + _nl;
			_text = _text + '[0], [' + (str ct_var_objects) + ',' + _nl;
			_text = _text + (str ct_var_compositions) + ',' + _nl;
			_text = _text + (str ct_var_collections) + ',' + _nl;
			_text = _text + (str ct_var_prefabs) + ']];' + _nl;
			"make_file" callExtension (_filePath + "CT_libraries.sqf" + "|" + _text);
			["message","CT_libsToFile",5] call CT_fnc_handler;
		};
		case "projects": {
			if (count _projects == 0) exitWith {};
			_text = _text + '[';
			{
				_text = _text + '["Author:		Unknown",' + _nl + '"Date:			01.01.2015",' + _nl + '"Decription:	none",' + _nl + '"Type:			Project, with all data",' + _nl;
				_text = _text + '[3,0], ' + (str _x) + ']';
				if (_forEachIndex != (count _projects - 1)) then {_text = _text + ',' + _nl};
			} forEach _projects;
			_text = _text + '];' + _nl + ' ';
			"make_file" callExtension (_filePath + "CT_projects.sqf" + "|" + _text);
			["message","CT_projectsToFile",5] call CT_fnc_handler;
		};
	};
} else {
	_newLine = toString [10]; _tab = toString [9];
	switch (_case) do {
		case "libs": {
			_text = '["Author:' + _tab + _tab + 'Unknown",' + _newLine + '"Date:' + _tab + _tab + _tab + '01.01.2015",' + _newLine + 
			'"Decription:' + _tab + 'none",' + _newLine + '"Type:' + _tab + _tab + _tab + 'All libraries",' + _newLine + '[0], [';
			_text = _text + str (["object",false] call CT_fnc_EM_exportLibrary) + ',' +_newLine;
			_text = _text + str (["composition",false] call CT_fnc_EM_exportLibrary) + ',' + _newLine;
			_text = _text + str (["collection",false] call CT_fnc_EM_exportLibrary) + ',' + _newLine;
			_text = _text + str (["prefab",false] call CT_fnc_EM_exportLibrary)+ ']]' + _newLine;
			copyToClipboard _text;
			["message","CT_libsToClipboard",5] call CT_fnc_handler;
		};
		case "projects": {
			if (count _projects == 0) exitWith {};
			_text = _text + '[';
			{
				_text = _text + '["Author:' + _tab + _tab + 'Unknown",' + _newLine + '"Date:' + _tab + _tab + _tab + '01.01.2015",' + _newLine + '"Decription:' + _tab + 'none",' + 
				_newLine + '"Type:' + _tab + _tab + _tab + 'Project, with all data",' + _newLine + '[3,0], ' + (str _x) + ']';
				if (_forEachIndex != (count _projects - 1)) then {_text = _text + ',' + _newLine};
			} forEach _projects;
			_text = _text + '];' + _newLine + ' ';
			copyToClipboard _text;
			["message","CT_projectsToClipboard",5] call CT_fnc_handler;
		};
	};
};

