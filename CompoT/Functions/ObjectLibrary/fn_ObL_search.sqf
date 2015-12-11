/* 
   File: fn_ObL_search.sqf 
   Function: CT_fnc_ObL_search
   Folder: ObjectLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_searchEdit","_delay","_dikKey","_text"];
_dialog = findDisplay 25250;
_searchEdit = _dialog displayCtrl 400;
_delay = _this select 0;
_dikKey = _this select 1;

_text = ctrlText _searchEdit;
if (_text == "") exitWith {call call CT_fnc_ObL_groupBy; true;};

if (!isNull CT_var_ObL_searchThreadHandle) then {
	terminate CT_var_ObL_searchThreadHandle;
};

CT_var_ObL_searchThreadHandle = [_delay, _text] spawn {
	disableSerialization;
	_delay = _this select 0;
	_text = _this select 1;
	sleep _delay;
	_dialog = findDisplay 25250;
	_tree = _dialog displayCtrl 200;
	if (isNull _dialog) exitWith {};
	_data = [];
	_classnames = [];
	
	for "_i" from 0 to ((_tree tvCount []) - 1) do {
		_curText = _tree tvText [_i];
		if (((toLower _curText) find (toLower _text)) >= 0) then {
			_data pushBack (_tree tvData [_i]);
			_classnames pushBack _curText;
		};
	};
	tvClear _tree;
	{
		_objIndex = _tree tvAdd [[],(_classnames select _forEachIndex)];
		_tree tvSetData [[_objIndex], _x];
	} forEach _data;
};
true;