/* 
   File: fn_ObL_collectConfigData.sqf 
   Function: CT_fnc_ObL_collectConfigData 
   Folder: ObjectLibrary 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

startLoadingScreen ["Scanning configs, please wait..."];

private ["_filter","_configs","_result","_scope","_array","_mapSize","_allVehicleClasses","_mod","_displayName",
"_model","_modFolder","_addon","_configContent"];
_filter = "true";
_configs = _filter configClasses (configFile >> "CfgVehicles");
_configContent = uinamespace getVariable "CT_var_GUI_ObL_configContent";
_allVehicleClasses = [];
_addon = "";
{
	_vehicleClass = (configFile >> 'CfgVehicles' >> (configName _x) >> 'vehicleClass') call BIS_fnc_getCfgData;
	if (!isnil "_vehicleClass") then {
		if (!(_vehicleClass in _allVehicleClasses)) then {_allVehicleClasses pushBack _vehicleClass};
	};
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
		_modFolder = configSourceMod (configFile >> 'CfgVehicles' >> (configName _x));
		_mod = _modFolder;
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
			default {
				_addon = (unitAddons (configName _x)) select 0;
				if (isNil "_addon") exitWith {};
				if (_addon == "brg_africa") exitWith {_mod = "BRG African Foliage"};
				if (_addon in ["A3_Bush","A3_Plants","A3_rocks","A3_Trees"]) exitWith {_mod = "ArmA nature"};
				if (_addon in ["mm_bank","mm_buildings","mm_buildings2","mm_buildings3","mm_buildings4","mm_fence","MM_objects","mm_post","mm_residential","mm_residential2","MM_Shopping","mm_showroom"]) exitWith {_mod = "mattaust buildings"};
				if (_addon == "mbg_killhouses_a3") exitWith {_mod = "MBG Killhouses"};
				if (_addon == "plp_beachobjects") exitWith {_mod = "PLP Beach objects"};
				if (_addon == "plp_containers") exitWith {_mod = "PLP Containers"};
			};
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
	_configContent pushBack [_x, _result];
	progressLoadingScreen (_forEachIndex / count _allVehicleClasses);
} forEach _allVehicleClasses;

endLoadingScreen;
call CT_fnc_ObL_openGUI;