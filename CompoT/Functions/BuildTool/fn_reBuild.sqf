/* 
   File: fn_reBuild.sqf 
   Function: CT_fnc_reBuild 
   Folder: BuildTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_targets"];
_targets = [_this, 0, [], [[]]] call BIS_fnc_param;
if (SOMETHING_SELECTED AND (count _this == 0)) then {
	if (SEL_LIB == "pivot") then {
		_targets pushBack FIRST_SELECTION;
	};
};
if SOMETHING_SELECTED then {
	if (SEL_LIB == "object") then {
		["clean"] call CT_fnc_drawSelection;
		call CT_fnc_clearSelect;
	};
};
if (count _targets == 0) exitWith {};
_targets spawn {
	{
		private ["_pivot","_name","_element","_childObjects","_pos","_dir","_elem","_lib","_relPos","_relDir",
		"_built","_alignment"];
		_pivot = _x;
		if (typeName _pivot == "OBJECT") then {
			if (typeOf _pivot == PIVOT) then {
				//GETTING DATA
				_name = _pivot getVariable "name";
				_pos = getPosATL _pivot;
				_dir = getDir _pivot;
				_childObjects = _pivot getVariable "childObjects";
				_element = ["normal",_name,"composition"] call CT_fnc_findBuildable;
				_built = [];
				
				//DELETING OLD CHILDREN
				{deleteVehicle _x} forEach _childObjects;
				_childObjects deleteRange [0, count _childObjects];
				
				//LET SOME TIME FOR PHYSX ENGINE TO CLEANUP
				sleep 0.01;
				
				//MAKING NEW CHILDREN
				{
					_lib = _x select 0;
					_name = _x select 1;
					_relPos = _x select 2;
					_relDir = _x select 3;
					_alignment =  [_x, 4, "sea"] call BIS_fnc_param;
					if (_lib in ["object","collection"]) then {
						if (_lib == "object") then {
							_elem = [_name, _relPos, _relDir, _alignment];
						};
						if (_lib == "collection") then {
							_elem = [(["normal",_name,"collection"] call CT_fnc_findBuildable), _relPos, _relDir,_alignment];
						};
						_built pushBack (["normal",_lib,["asChild",_elem],_pos,_dir,_pivot,"exact"] call CT_fnc_build);
					};
				} forEach (_element select 2);
			};
		};
	} forEach _this;
	call CT_fnc_reDrawSelection;
};