/* 
   File: fn_IM_performImport.sqf 
   Function: CT_fnc_IM_performImport 
   Folder: ImportMenuGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_importList","_collisionOption","_importType","_importData","_targetCat"];
_dialog = findDisplay 25261;
_importList = _dialog displayCtrl 400;
if (count CT_var_IM_importOptions == 0) exitWith {["Import data is not loaded"] call CT_fnc_errorMsg};
{
	_collisionOption = _x select 5;
	_importType = _x select 4;
	_targetCat = _x select 6;
	_importData = call compile (_importList lbData _forEachIndex);
	if ((_importType select 0) == 0) then {
		["object",_collisionOption,(_importData select 0)] call CT_fnc_IM_importLibrary; 
		["composition",_collisionOption,(_importData select 1)] call CT_fnc_IM_importLibrary; 
		["collection",_collisionOption,(_importData select 2)] call CT_fnc_IM_importLibrary; 
		["prefab",_collisionOption,(_importData select 3)] call CT_fnc_IM_importLibrary; 
	};
	if ((_importType select 0) in [1,3]) then {
		if ((_importType select 1) == 0) then {["object",_collisionOption,_importData] call CT_fnc_IM_importLibrary};
		if ((_importType select 1) == 1) then {["composition",_collisionOption,_importData] call CT_fnc_IM_importLibrary};
		if ((_importType select 1) == 2) then {["collection",_collisionOption,_importData] call CT_fnc_IM_importLibrary};
		if ((_importType select 1) == 3) then {["prefab",_collisionOption,_importData] call CT_fnc_IM_importLibrary};
	};
	if ((_importType select 0) == 2) then {
		if ((_importType select 1) == 0) then {["object",_collisionOption,[_targetCat, _importData],[]] call CT_fnc_IM_importCategory};
		if ((_importType select 1) == 1) then {["composition",_collisionOption,[_targetCat, _importData],[]] call CT_fnc_IM_importCategory};
		if ((_importType select 1) == 2) then {["collection",_collisionOption,[_targetCat, _importData],[]] call CT_fnc_IM_importCategory};
		if ((_importType select 1) == 3) then {["prefab",_collisionOption,[_targetCat, _importData],[]] call CT_fnc_IM_importCategory};
	};
} forEach CT_var_IM_importOptions;
["Importing successful"] call CT_fnc_notification;
_dialog closeDisplay 0;