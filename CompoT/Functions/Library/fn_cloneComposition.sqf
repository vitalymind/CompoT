/* 
   File: fn_cloneComposition.sqf 
   Function: CT_fnc_cloneComposition 
   Folder: Library 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

_this spawn {
	{
		private ["_pivot","_name","_clones","_element","_getHighestCloneName","_parent"];
		_pivot = _x;
		if (typeName _pivot == "OBJECT") then {
			if (typeOf _pivot == PIVOT) then {
				_name = _pivot getVariable "name";
				_parent = objNull; _clones = [];
				{
					if ((_x getVariable "name") == _name) then {_clones pushBack _x};
				} forEach CT_var_builtPivots;
				_clones = _clones - [_pivot];
				_element = ["normal",_name,"composition"] call CT_fnc_findBuildable;
				{
					_pivot = _x;
					_pos = getPosATL _pivot;
					_pos set [2,0];
					_dir = getDir _pivot;
					_parent = _pivot getVariable "pivot";
					
					["special", "pivot", [[_pivot]]] call CT_fnc_deleteObject;
					
					_tc = count CT_var_btc; CT_var_btc pushBack _tc;
					sleep 0.01;
					["normal","composition",["asParent",_element],_pos,_dir,_parent,"exact"] call CT_fnc_build;
					CT_var_btc = CT_var_btc - [_tc];
				} forEach _clones;
			};
		};
	} forEach _this;
};