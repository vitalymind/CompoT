/* 
   File: fn_cursorSelect.sqf 
   Function: CT_fnc_cursorSelect 
   Folder: SelectTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_type","_object","_id","_cleanSelection","_method","_index","_deleted","_cancel","_pivot","_data","_camPos",
"_camDir","_pitchbank","_skipSpecial","_filter"];
_cleanSelection = false;
_type = _this select 0;
_filter = [_this, 1, "default", [""]] call BIS_fnc_param;
_method = "add";
_cancel = false;

//HANDLE SPECIAL GRAB
if SOMETHING_SELECTED then {
	if (SEL_STATE == "busySpecial") then {
		CT_var_sel set [2, "emptySpecial"];
		FIRST_SELECTION setVariable ["specialGrabCam", [getPosATL CT_var_cam, getDir CT_var_cam, CT_var_cam call CT_fnc_getPB]];
		_skipSpecial = true;
	} else {
		if (SEL_STATE == "emptySpecial") then {
			CT_var_sel set [2, "busySpecial"];
			_data = FIRST_SELECTION getVariable ["specialGrabCam", [getPosATL CT_var_cam, getDir CT_var_cam]];
			_camPos = _data select 0;
			_camDir = _data select 1;
			_pitchbank = _data select 2;
			CT_var_cam setDir _camDir;
			[CT_var_cam, _pitchbank select 0, _pitchbank select 1] call BIS_fnc_setPitchbank;
			CT_var_cam setPosATL _camPos;
			_skipSpecial = true;
		};
	};
};
if (_skipSpecial) exitWith {};

//GETTING OBJECT
_object = [[],"normal",_filter] call CT_fnc_cursorFindClosestObject;
if (!isNull CT_var_cursorBestSelect) then {_object = CT_var_cursorBestSelect};
if (count _this == 3) then {_object = _this select 2};

//CHECK IF SOMETHING IS GRABBED
if SOMETHING_SELECTED then {
	if (SEL_STATE == "busy") then {
		_cancel = true;
		["place"] call CT_fnc_cursorGrab;
	};
};
if (_cancel) exitWith {};

//IF CLONED OBJECT SELECTED, CHECK IF SELECTION IS FROM SAME COPY
_pivot = _object getVariable "pivot";
if (_pivot call CT_fnc_isPivotCloned) then {
	if (!isNull CT_var_selectedClone) then {
		if (_pivot != CT_var_selectedClone) then {_cleanSelection = true};
	};
};

//CHECK IF MULTI SELECTION ALLOWED OR NEEDED
if SOMETHING_SELECTED then {
	if ((isNull _object) AND !HK_SHIFT) then {_cleanSelection = true};
	if ((_type == "single") OR ((_type == "multi") AND (typeOf _object == PIVOT))) then {_cleanSelection = true};
	if ((CT_var_sel select 1) == "pivot") then {_cleanSelection = true};
	if (_cleanSelection) then {
		["clean"] call CT_fnc_drawSelection;
		call CT_fnc_clearSelect;
	};
};
if (isNull _object) exitWith {};

//IF CLONED OBJECT SELECTED, SETTING ITS PIVOT AS NEW SELECTED CLONE
if (_pivot call CT_fnc_isPivotCloned) then {CT_var_selectedClone = _pivot};

//CHECK IF ITEM ALREADY SELECTED
if SOMETHING_SELECTED then {
	{if ((_x select 0) == _object) then {_method = "delete"; _index = _forEachIndex;}} forEach SELECTION;
};

//ADDING TO SELECTION
if (_method == "add") then {
	_type = if (typeOf _object == PIVOT) then {"pivot"} else {"object"};
	_id = [_type, _object] call CT_fnc_drawSelection;
	if SOMETHING_SELECTED then {
		SELECTION pushBack [_object, _id];
		CT_var_sel set [1,_type];
		CT_var_sel set [2, "empty"];
	} else {
		CT_var_sel pushBack [[_object, _id]]; //OBJECTS + DRAW IDs
		CT_var_sel pushBack _type; //PIVOT OR OBJECTS
		CT_var_sel pushBack "empty"; //CURRENT STATUS OF CURSOR
	};
	if (_type == "pivot") then {
		{
			ct_var_selDrawIcons pushBack _x;
		} forEach (_object getVariable "childObjects");
	} else {
		ct_var_selDrawIcons pushBack _object;
	};
};

//REMOVING FROM SELECTION
if (_method == "delete") then {
	_deleted = SELECTION deleteAt _index;
	["remove", (_deleted select 1)] call CT_fnc_handleDrawOrders;
	_index = -1;
	{if (_object == _x) exitWith {_index = _forEachIndex}} forEach ct_var_selDrawIcons;
	ct_var_selDrawIcons deleteAt _index;
	if NOTHING_SELECTED then {
		call CT_fnc_clearSelect;
	};
};