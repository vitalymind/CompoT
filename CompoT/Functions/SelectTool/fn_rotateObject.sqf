/* 
   File: fn_rotateObject.sqf 
   Function: CT_fnc_rotateObject 
   Folder: SelectTool 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_case"];
_case = _this select 0;
switch (_case) do {
	case "pivot": {
		private ["_object","_rotateAngle","_type",
		"_childObjects","_childPivots",
		"_objectPos","_objectDir",
		"_oldChildPos","_relChildPos","_newChildPos",
		"_objectNewPos","_offset","_objectHeight","_childHeight"];
		_object = _this select 1;
		_rotateAngle = _this select 2;
		[_object,0,0] call CT_fnc_setPB;
		_objectPos = getPosATL _object;
		
		_objectPos set [2,0];
		_objectHeight = (getPosATL _object) select 2;
		
		_type = [_this, 3, "single", [""]] call BIS_fnc_param;
		_objectNewPos = [_this, 4, _objectPos, [[]]] call BIS_fnc_param;
		_offset = [
			(_objectNewPos select 0) - (_objectPos select 0),
			(_objectNewPos select 1) - (_objectPos select 1),
			(_objectNewPos select 2) - (_objectPos select 2)
		];
		_childObjects = [_this, 5, (_object getVariable "childObjects"), [[]]] call BIS_fnc_param;
		_childPivots = [_this, 6, (_object getVariable "childPivots"), [[]]] call BIS_fnc_param;
		_object setDir ((getDir _object) + _rotateAngle);
		_objectDir = getDir _object;
		
		_objectNewPos set [2,_objectHeight];
		
		_object setPosATL _objectNewPos;
		[_object] call CT_fnc_alignWithSurface;
		{
			_object = _x;
			[_object,0,0] call CT_fnc_setPB;
			
			_oldChildPos = getPosATL _object;
			_oldChildPos set [2,0];
			_childHeight = (getPosATL _object) select 2;
			_relChildPos = [
				(_oldChildPos select 0) - (_objectPos select 0), 
				(_oldChildPos select 1) - (_objectPos select 1), 
				(_oldChildPos select 2) - (_objectPos select 2)
			];
			_newChildPos = [_relChildPos, _objectPos, _rotateAngle] call CT_fnc_getRelPos;
			_newChildPos = [
				(_newChildPos select 0) + (_offset select 0),
				(_newChildPos select 1) + (_offset select 1),
				(_newChildPos select 2) + (_offset select 2)
			];
			_newChildPos set [2,_childHeight];
			_object setDir ((getDir _object) + _rotateAngle);
			_object setPosATL _newChildPos;
			
			[_object] call CT_fnc_alignWithSurface;
		} forEach _childObjects;
		{
			if (_type == "multi") then {
				_oldChildPos = getPosATL _x;
				_relChildPos = [
					(_oldChildPos select 0) - (_objectPos select 0), 
					(_oldChildPos select 1) - (_objectPos select 1), 
					(_oldChildPos select 2) - (_objectPos select 2)
				];
				_newChildPos = [_relChildPos, _objectNewPos, _rotateAngle] call CT_fnc_getRelPos;
				["pivot", _x, _rotateAngle, "multi", _newChildPos] call CT_fnc_rotateObject;
			};
		} forEach _childPivots;
	};
	case "object": {
		private ["_object", "_rotateAngle","_pb"];
		_object = _this select 1;
		_rotateAngle = _this select 2;
		_pb = _object call CT_fnc_getPB;
		[_object,0,0] call CT_fnc_setPB;
		_object setDir ((getDir _object) + _rotateAngle);
		if (ct_var_vectorUpMode == 0) then {
			[_object] call CT_fnc_alignWithSurface;
		};
		if (ct_var_vectorUpMode == 1) then {
			[_object, _pb select 0, _pb select 1] call CT_fnc_setPB;
		};
	};
};