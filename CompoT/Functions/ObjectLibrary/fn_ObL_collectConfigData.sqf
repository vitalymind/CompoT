/* 
   File: fn_ObL_collectConfigData.sqf 
   Function: CT_fnc_ObL_collectConfigData 
   Folder: ObjectLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_filter","_configs","_result","_scope","_array","_mapSize","_allVehicleClasses","_mod","_displayName",
"_model","_modFolder"];
_filter = "true";
_configs = _filter configClasses (configFile >> "CfgVehicles");
_allVehicleClasses = [];
{
	_vehicleClass = (configFile >> 'CfgVehicles' >> (configName _x) >> 'vehicleClass') call BIS_fnc_getCfgData;
	if (!(_vehicleClass in _allVehicleClasses)) then {_allVehicleClasses pushBack _vehicleClass};
	true;
} count _configs;
{
	_result = [];
	_filter = format ["if ((getText (configFile >> 'CfgVehicles' >> (configName _x) >> 'vehicleClass')) == '%1') then {true} else {false};", _x];
	_configs = _filter configClasses (configFile >> "CfgVehicles");
	{
		_array = [];
		_model = (configFile >> 'CfgVehicles' >> (configName _x) >> 'model') call BIS_fnc_getCfgData;
		_scope = (configFile >> 'CfgVehicles' >> (configName _x) >> 'scope') call BIS_fnc_getCfgData;
		_displayName = (configFile >> 'CfgVehicles' >> (configName _x) >> 'displayName') call BIS_fnc_getCfgData;
		_mapSize = (configFile >> 'CfgVehicles' >> (configName _x) >> 'mapSize') call BIS_fnc_getCfgData;
		_mod = "";
		_modFolder = configSourceMod (configFile >> 'CfgVehicles' >> (configName _x));
		switch (_modFolder) do {
			case "": {_mod = "STD"};
		
			case "@CUP_Terrains": {_mod = "CUP"};
			case "@CUP_Bukovina": {_mod = "CUP"};
			case "@CUP_Bystrica": {_mod = "CUP"};
			case "@CUP_Chernarus": {_mod = "CUP"};
			case "@CUP_Chernarus_Summer": {_mod = "CUP"};
			case "@CUP_Desert": {_mod = "CUP"};
			case "@CUP_Porto": {_mod = "CUP"};
			case "@CUP_Proving_Grounds": {_mod = "CUP"};
			case "@CUP_Rahmadi": {_mod = "CUP"};
			case "@CUP_Sahrani": {_mod = "CUP"};
			case "@CUP_Sahrani_Lite": {_mod = "CUP"};
			case "@CUP_Shapur": {_mod = "CUP"};
			case "@CUP_Takistan": {_mod = "CUP"};
			case "@CUP_Takistan_Mountains": {_mod = "CUP"};
			case "@CUP_United_Sahrani": {_mod = "CUP"};
			case "@CUP_Utes": {_mod = "CUP"};
			case "@CUP_Zargabad": {_mod = "CUP"};

			case "Kart": {_mod = "kart"};
			case "Heli": {_mod = "heli"};
			case "Mark": {_mod = "mark"};
			case "curator": {_mod = "curator"};
			default {_mod = _modFolder};
		};
		
		if (isNil "_model") then {_model = "n/a"};
		if (isNil "_scope") then {_scope = "n/a"};
		if (isNil "_displayName") then {_displayName = "n/a"};
		if (isNil "_mapSize") then {_mapSize = 10};
		_array pushback (configName _x);
		_array pushback _scope;
		_array pushback _model;
		_array pushback _displayName;
		_array pushback _mapSize;
		_array pushback _mod;
		_result pushBack _array;
		true;
	} count _configs;
	CT_var_ObL_configContent pushBack [_x, _result];
} forEach _allVehicleClasses;