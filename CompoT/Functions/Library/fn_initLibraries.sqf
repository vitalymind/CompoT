/* 
   File: fn_initLibraries.sqf 
   Function: CT_fnc_initLibraries 
   Folder: Library 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_name","_found","_nameMap","_nameIsGood","_i","_newName","_scanLib"];

uinamespace setVariable ["CT_var_gui_libraries", nil];

_libraries = call compile preprocessfilelinenumbers "ct_libraries.sqf";
if (isNil "_libraries") then {
	_libraries = call compile preprocessfilelinenumbers "composition_tool\Data\CT_libraries.sqf";
};

if (typeName _libraries != typeName []) exitWith {["message","CT_libsWrong",5] call CT_fnc_handler};

if (count _libraries == 0) then {
	uinamespace setVariable ["CT_var_gui_libraries",[[],[],[],[]]];
} else {
	uinamespace setVariable ["CT_var_gui_libraries",(_libraries select 5)];
};

ct_var_objects = (uinamespace getVariable "CT_var_gui_libraries") select 0;
ct_var_compositions = (uinamespace getVariable "CT_var_gui_libraries") select 1;
ct_var_collections = (uinamespace getVariable "CT_var_gui_libraries") select 2;
ct_var_prefabs = (uinamespace getVariable "CT_var_gui_libraries") select 3;

_found = false;
{
	if ((_x select 0) == "temporary") then {
		_x set [1,[]];
		_found = true;
	};
} forEach CT_var_compositions;
if (!_found) then {CT_var_compositions pushBack ["temporary",[]]};
_nameMap = [];
_scanLib = {
	{
		{
			_name = _x select 0;
			if (_name in _nameMap) then {
				_nameIsGood = false;
				_i = 0;
				_newName = "";
				while {!_nameIsGood} do {
					_i = _i + 1;
					_newName = format ["%1_%2",_name,_i];
					if (!(_newName in _nameMap)) then {_nameIsGood = true};
				};
				_x set [0, _newName];
				_nameMap pushBack _newName;
			} else {
				_nameMap pushBack _name;
			};
			CT_var_usedNames pushBack _name;
		} forEach (_x select 1);
	} forEach _this;
};
{_x call _scanLib} forEach [CT_var_compositions, CT_var_collections, CT_var_prefabs];