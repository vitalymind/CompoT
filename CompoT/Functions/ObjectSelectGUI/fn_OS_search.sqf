/* 
   File: fn_OS_search.sqf 
   Function: CT_fnc_OS_search 
   Folder: ObjectSelectGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_searchEdit","_delay","_text","_resetScrollPos"];
_dialog = displayNull;
_searchEdit = controlNull;

if ((uinameSpace getVariable ["CT_var_gui_runMode",""]) == "3den") then {
	_dialog = findDisplay 313;
	_searchEdit = _dialog displayCtrl CT_OSMSEARCH_IDC;
} else {
	_dialog = findDisplay 25259;
	_searchEdit = _dialog displayCtrl 360;
};

_delay = _this select 0;
_resetScrollPos = _this select 1;
if (((_this select 2) == DIK_ARROW_DOWN) OR ((_this select 2) == DIK_ARROW_UP)) exitWith {false};

_text = ctrlText _searchEdit;
CT_var_OS_searchText = _text;
if (!isNull CT_var_OS_searchThreadHandle) then {
	terminate CT_var_OS_searchThreadHandle;
};

if (_text == "") exitWith {[false] call CT_fnc_OS_groupBy;true;};

if (_resetScrollPos) then {CT_var_OS_searchScrollPos = 0};
CT_var_OS_searchThreadHandle = _delay spawn {
	disableSerialization;
	_delay = _this;
	sleep _delay;
	_dialog = displayNull;
	if ((uinameSpace getVariable ["CT_var_gui_runMode",""]) == "3den") then {
		_dialog = findDisplay 313;
	} else {
		_dialog = findDisplay 25259;
	};
	if (isNull _dialog) exitWith {};
	CT_var_OS_shownSearchResults = [];
	_text = CT_var_OS_searchText;
	{
		_classname = toLower (_x select 0);
		if ((_classname find (toLower _text)) >= 0) then {
			CT_var_OS_shownSearchResults pushBack _x;
		};
	} forEach CT_var_OS_shownObjects;
	_elements = CT_var_OS_shownSearchResults select [CT_var_OS_searchScrollPos,32];
	_elements call CT_fnc_OS_draw;
};
true;