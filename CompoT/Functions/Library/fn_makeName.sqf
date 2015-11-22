/* 
   File: fn_makeName.sqf 
   Function: CT_fnc_makeName 
   Folder: Library 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_done","_name","_symbols"];
_done = false;
_name = "";
_symbols = ["a","b","c","d","e","f","g","h","i","j","k","l","m",
			"n","o","p","q","r","s","t","u","v","w","x","y","z",
			"0","1","2","3","4","5","6","7","8","9"];
while {!_done} do {
	_name = "rnd_";
	for "_i" from 0 to 5 do {
		_name = _name + (_symbols select (floor (random (count _symbols))));
	};
	if (!([_name] call CT_fnc_isNameUsed)) then {_done = true};
};
_name;