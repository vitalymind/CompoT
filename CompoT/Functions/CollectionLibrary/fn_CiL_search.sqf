/* 
   File: fn_CiL_search.sqf 
   Function: CT_fnc_CiL_search
   Folder: CollectionLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_searchEdit","_delay","_dikKey","_text"];
_dialog = findDisplay 25257;
_searchEdit = _dialog displayCtrl 407;
_delay = _this select 0;
_dikKey = _this select 1;

_text = ctrlText _searchEdit;
if (_text == "") exitWith {call CT_fnc_CiL_fillObjects;true;};

if (!isNull CT_var_CiL_searchThreadHandle) then {
	terminate CT_var_CiL_searchThreadHandle;
};

CT_var_CiL_searchThreadHandle = [_delay, _text] spawn {
	disableSerialization;
	_delay = _this select 0;
	_text = _this select 1;
	sleep _delay;
	_dialog = findDisplay 25257;
	_tree = _dialog displayCtrl 200;
	tvClear _tree;
	if (isNull _dialog) exitWith {};
	{
		{
			_classname = _x select 0;
			if (isClass (configFile >> "CfgVehicles" >> _classname)) then {
				if (((toLower _classname) find (toLower _text)) >= 0) then {
					_objIndex = _tree tvAdd [[],_classname];
					_tree tvSetData [[_objIndex], str _x];
				};
			};
		} forEach (_x select 1);
	} forEach CT_var_objects;
};
true;