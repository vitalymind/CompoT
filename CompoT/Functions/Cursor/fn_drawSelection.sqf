/* 
   File: fn_drawSelection.sqf 
   Function: CT_fnc_drawSelection 
   Folder: Cursor 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_case","_id"];
_case = _this select 0;
_id = [];
switch (_case) do {
	case "clean": {
		if SOMETHING_SELECTED then {
			{
				_id append (_x select 1);
			} forEach SELECTION;
			["remove", _id] call CT_fnc_handleDrawOrders;
		};
	};
	case "pivot": {
		private ["_object","_size","_childrenObj","_points","_childrenPiv","_parentPiv"];
		_object = _this select 1;
		_size = _object getVariable "size";
		_childrenObj = _object getVariable "childObjects";
		_childrenPiv = _object getVariable "childPivots";
		_parentPiv = _object getVariable "pivot";
		_points = [getPosATL _object, _size] call CT_fnc_findCirclePoints;
		_id pushBack (["add","circle",_points] call CT_fnc_handleDrawOrders);
		_points = [getPosATL _object, _size, getDir _object] call CT_fnc_findSquarePoints;
		_id pushBack (["add","circle",_points] call CT_fnc_handleDrawOrders);
		_points = _childrenObj call CT_fnc_findLineUpPoints;
		_id pushBack (["add","lineUp",_points] call CT_fnc_handleDrawOrders);
		_points = _object call CT_fnc_findToClonesPoints;
		_id pushBack (["add","clones",_points] call CT_fnc_handleDrawOrders);
		{_id pushBack (["add","parentToChildLine",[position _object, position _x]] call CT_fnc_handleDrawOrders)} forEach _childrenPiv;
		_id pushBack (["add","childToParentLine",[position _object, position _parentPiv]] call CT_fnc_handleDrawOrders);
	};
	case "object": {
		private ["_pivot"];
		_object = _this select 1;
		_pivot = _object getVariable "pivot";
		_id pushBack (["add","childToParentLine",[position _object, position _pivot]] call CT_fnc_handleDrawOrders);
		_points = [_object] call CT_fnc_findLineUpPoints;
		_id pushBack (["add","lineUp",_points] call CT_fnc_handleDrawOrders);
	};
};
_id;