/* 
   File: fn_forceAlignObjectToSurface.sqf 
   Function: CT_fnc_forceAlignObjectToSurface
   Folder: Cursor 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_object","_vSide","_vUp","_vDir","_toLand","_toSea","_objectNormal","_toObject"];
if NOTHING_SELECTED exitWith {};
if (SEL_STATE != "busy") exitWith {};
_selectedObjects = [];
ALL_SELECTED(_selectedObjects);
if (!CT_var_stickToObjectMode) exitWith {["Switch on 'stick to object' mode"] call CT_fnc_notification};
if (count _selectedObjects != 1) exitWith {["1 object must be selected"] call CT_fnc_notification};
_object = _selectedObjects select 0;

_posCam = getPosASL CT_var_cam;
_posTarget = screenToWorld CT_var_mousePos;
_posTarget = [_posTarget select 0, _posTarget select 1, getTerrainHeightASL _posTarget];
_contact = lineIntersectsSurfaces [_posCam, _posTarget, objNull, objNull, true, 10];
{
	if ((_x select 3) == _object) then {_contact set [_forEachIndex, "delMe"]};
} forEach _contact;
_contact = _contact - ["delMe"];
if (count _contact == 0) exitWith {["No objects to stick to"] call CT_fnc_notification};

_contactNormal = ((_contact select 0) select 1);

_object setVectorUp _contactNormal;