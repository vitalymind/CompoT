/* 
   File: fn_handleDrawOrders.sqf 
   Function: CT_fnc_handleDrawOrders 
   Folder: Draw 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_case","_type","_points","_ids","_id" ,"_result"];
_case = _this select 0;
_result = -1;
if (CT_var_drawOrderId > 10000) then {CT_var_drawOrderId = 0};
switch (_case) do {
	case "add": {
		_type = _this select 1;
		_points = _this select 2;
		if (count _points != 0) then {
			CT_var_drawOrderId = CT_var_drawOrderId + 1;
			CT_var_drawOrders pushBack [CT_var_drawOrderId, _type, _points];
			_result = CT_var_drawOrderId;
		};
	};
	case "remove": {
		_ids = _this select 1;
		{
			_id = _x;
			{
				if (_id == (_x select 0)) then {
					CT_var_drawOrders set [_forEachIndex, "delMe"];
					CT_var_drawOrders = CT_var_drawOrders - ["delMe"];
				};
			} forEach CT_var_drawOrders;
		} forEach _ids;
	};
};
_result;