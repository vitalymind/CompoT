/* 
   File: fn_OM_handleToggle.sqf 
   Function: ct_fnc_OM_handleToggle
   Folder: OptionMenu
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp"

private ["_case","_toggle"];
_case = _this select 0;
_toggle = (_this select 1) select 1;

if (_case == "unitSim") then {
	if (_toggle == 1) then {
		{_x enableSimulation true; _x allowDamage true;} forEach allUnits;
		{_x enableSimulation true; _x allowDamage true;} forEach vehicles;
		ct_var_disableUnitSim = false;
	} else {
		{_x enableSimulation false; _x allowDamage false;} forEach allUnits;
		{_x enableSimulation false; _x allowDamage false;} forEach vehicles;
		ct_var_disableUnitSim = true;
	};
};
if (_case == "objectSim") then {
	if (_toggle == 1) then {
		ct_var_disableSim = false;
		{_x enableSimulation true; _x allowDamage true;} forEach ct_var_builtObjects;
	} else {
		ct_var_disableSim = true;
		{_x enableSimulation false; _x allowDamage false;} forEach ct_var_builtObjects;
	};
};
