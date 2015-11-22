/* 
   File: fn_paste.sqf 
   Function: CT_fnc_paste 
   Folder: Clipboard 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_cancel","_type","_data","_element","_libraryName","_elementName","_naming","_pivot","_dir","_pos",
"_relPos","_height","_built"];
_cancel = false;
if (count CT_var_clipboard == 0) exitWith {};
if (CT_var_cursorTool != "selectTool") exitWith {};
_pivot = CT_var_mainPivot;
if SOMETHING_SELECTED then {
	if (SEL_STATE != "empty") then {
		_cancel = true;
	} else {
		if (SEL_LIB == "pivot") then {_pivot = FIRST_SELECTION};
	};
};
if (_cancel) exitWith {};

_type = CT_var_clipboard select 0;
_data = CT_var_clipboard select 1;
_height = CT_var_clipboard select 2;
_built = [];
{
	_elementName = _x select 0;
	_libraryName = _x select 1;
	_dir = _x select 2;
	_relPos = _x select 3;
	_pos = getPosATL CT_var_cursor;
	_pos set [2,0];
	_pos = [
		(_pos select 0) - (_relPos select 0), 
		(_pos select 1) - (_relPos select 1),
		(_pos select 2) - (_relPos select 2) + _height
	];
	
	_element = ["normal",_elementName,_libraryName] call CT_fnc_findBuildable;
	
	if (_type == "normalCopy") then {_naming = "random"};
	if (_type == "cloneCopy") then {_naming = "exact"};
	
	_built pushBack (["normal",_libraryName,["asParent",_element],_pos,_dir,_pivot,_naming] call CT_fnc_build);
} forEach _data;
[_pivot] call CT_fnc_saveElement;
[_pivot] call CT_fnc_cloneComposition;
["clean"] call CT_fnc_drawSelection;
call CT_fnc_clearSelect;
{["multi","default",_x] call CT_fnc_cursorSelect} forEach _built;
call CT_fnc_reDrawSelection;