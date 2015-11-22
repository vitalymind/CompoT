/* 
   File: fn_cursorChangeTool.sqf 
   Function: CT_fnc_cursorChangeTool 
   Folder: Cursor 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_case"];
_case = _this;
switch (_case) do {
	case "buildTool": {
		if SOMETHING_SELECTED then {
			if (SEL_STATE in ["busy","busySpecial"]) then {
				["release"] call CT_fnc_cursorGrab;
			};
		};
		deleteVehicle CT_var_cursor;
		CT_var_cursor = ADD_TOOL createVehicleLocal [0,0,0];
		[CT_var_cursor, 0, 0] call CT_fnc_setPB;
		CT_var_cursor setVariable ["forbidden",[]];
		CT_var_cursor setVariable ["childObjects",[]];
		CT_var_cursor setVariable ["childPivots",[]];
		
		call CT_fnc_clearPreview;
		if (CT_var_cursorTool != "buildTool") then {
			call CT_fnc_pickCurrentBuildable;
		} else {
			if CT_var_buildToolEmpty then {
				CT_var_buildToolEmpty = false;
				call CT_fnc_pickCurrentBuildable;
			} else {
				CT_var_buildToolEmpty = true;
				call CT_fnc_clearPreview;
			};
		};
		
		CT_var_buildToolCamMoved = false;
		CT_var_cursorTool = "buildTool";
	};
	case "selectTool": {
		call CT_fnc_clearPreview;
		deleteVehicle CT_var_cursor;
		if (CT_var_selectToolSize == "big") then {CT_var_cursor = SELECT_TOOL_B createVehicleLocal [0,0,0]};
		if (CT_var_selectToolSize == "small") then {CT_var_cursor = SELECT_TOOL_S createVehicleLocal [0,0,0]};
		[CT_var_cursor, 0, 0] call CT_fnc_setPB;
		CT_var_cursor setVariable ["forbidden",[]];
		CT_var_cursor setVariable ["childObjects",[]];
		CT_var_cursor setVariable ["childPivots",[]];
		CT_var_cursorTool = "selectTool";
	};
};