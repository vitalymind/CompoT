/* 
   File: fn_toggleSlopeMode.sqf 
   Function: CT_fnc_toggleSlopeMode 
   Folder: BuildTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_pivots","_pivot"];
if (CT_var_slopeMode) then {
	CT_var_slopeMode = false;
	["Slope mode de-activated"] call CT_fnc_notification;
} else {
	if (!CT_var_slopeMode) then {
		CT_var_slopeMode = true;
		["Slope mode activated"] call CT_fnc_notification;
	};
};
_pivots = [];
if SOMETHING_SELECTED then {
	if (SEL_STATE == "empty") then {
		{
			if (SEL_LIB == "pivot") then {
				[[FIRST_SELECTION]] call CT_fnc_reBuild;
				_pivots pushBack FIRST_SELECTION;
			};
			if (SEL_LIB == "object") then {
				[(_x select 0)] call CT_fnc_alignWithSurface;
				_pivot = (_x select 0) getVariable "pivot";
				if (!(_pivot in _pivots)) then {_pivots pushBack _pivot};
			};
			call CT_fnc_reDrawSelection;
			{[_x] call CT_fnc_saveElement} forEach _pivots;
			_pivots call CT_fnc_cloneComposition;
		} forEach SELECTION;
	};
};
call CT_fnc_clearPreview;
call CT_fnc_pickCurrentBuildable;