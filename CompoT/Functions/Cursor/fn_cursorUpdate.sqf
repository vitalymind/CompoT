/* 
   File: fn_cursorUpdate.sqf 
   Function: CT_fnc_cursorUpdate 
   Folder: Cursor 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_pos","_objPos","_objDir","_id","_points","_objHeight","_contact","_posCam","_posTarget","_skipIntersect","_oldPos",
"_size","_distance","_skipSpecial","_data","_dirOffset","_distanceOffset","_heightOffset","_object","_height","_newHeight"];

if (CT_var_camIsMoving OR CT_var_camIsRotating) then {
	if (!CT_var_cursorMoving) then {CT_var_cursorMoving = true};
};
if (!CT_var_camIsMoving AND !CT_var_camIsRotating) then {
	if (CT_var_cursorMoving) then {CT_var_cursorMoving = false};
};
switch (CT_var_cursorTool) do {
	case "buildTool": {			
		_pos = screenToWorld CT_var_mousePos;
		_pos = [(_pos select 0), (_pos select 1), (getTerrainHeightASL _pos)];
		CT_var_cursor setPosASL _pos;

		if (count CT_var_builtPreview != 0) then {
			if (((CT_var_buildMode select 0) select 0) in ["composition","prefab"]) then {
				CT_var_cursor hideObject false;
				if (!CT_var_cursorMoving) then {
					if (!CT_var_buildToolCamMoved) then {
						CT_var_buildToolCamMoved = true;
						call CT_fnc_clearPreview; 
						call CT_fnc_pickCurrentBuildable;
					};
				} else {
					if (CT_var_buildToolCamMoved) then {CT_var_buildToolCamMoved = false};
				};
			};
			
			if (((CT_var_buildMode select 0) select 0) in ["object","collection"]) then {
				CT_var_cursor hideObject true;
				_pos set [2,((getTerrainHeightASL _pos) + CT_var_buildToolHeight)];
				
				_object = (CT_var_builtPreview select 0);
				[_object, 0, 0] call CT_fnc_setPB;

				_object setPosASL _pos;
				[_object] call CT_fnc_alignWithSurface;
			};
		};
	};
	case "selectTool": {
		_skipSpecial = false;
		if SOMETHING_SELECTED then {
			if (SEL_STATE == "busySpecial") then {
				_skipSpecial = true;
				CT_var_cursor setPosATL [0,0,1000];
				_object = (SELECTION select 0) select 0;
				_data = _object getVariable ["specialGrab", [0,20,0]];
				_dirOffset = _data select 0;
				_distanceOffset = _data select 1;
				_heightOffset = _data select 2;
				_objPos = CT_var_cam modelToWorld [0,_distanceOffset,0 + _heightOffset];
				_objPos set [2, (_objPos select 2) + (getTerrainHeightASL _objPos)];
				_object setDir ((getDir CT_var_cam) + 180 + _dirOffset);
				_object setPosASL _objPos;
				[_object] call CT_fnc_alignWithSurface;
			};
			if (SEL_STATE == "emptySpecial") then {
				CT_var_cursor setPosATL [0,0,1000];
				_skipSpecial = true;
			};
		};
		if (_skipSpecial) exitWith {};
		
		_skipIntersect = false;
		if SOMETHING_SELECTED then {
			if (SEL_STATE == "busy") then {_skipIntersect = true};
		};
		
		_pos = screenToWorld CT_var_mousePos;
		
		if (CT_var_selectToolSize == "big") then {_pos set [2, 0.5]};
		if (CT_var_selectToolSize == "small") then {_pos set [2, 0.02]};

		_contact = [];
		if (!_skipIntersect) then {
			_posCam = getPosASL CT_var_cam;
			_posTarget = screenToWorld CT_var_mousePos;
			_posTarget = [_posTarget select 0, _posTarget select 1, getterrainheightasl _posTarget];
			_contact = (lineIntersectsObjs [_posCam, _posTarget, objnull,objnull,false,2]);
			if (count _contact != 0) then {
				if ((_contact select 0) in CT_var_builtObjects) then {
					_size = sizeOf (typeOf (_contact select 0));
					_distance = CT_var_cam distance (_contact select 0);
					_pos = CT_var_cam modelToWorldVisual [0,_distance - (_size/2),0];
					if (CT_var_mouseCursorActive) then {
						_pos = getPosATL (_contact select 0);
						_height = _pos select 2;
						_pos set [2, (_height +(_size/2))];
					};
					CT_var_cursorBestSelect = _contact select 0;
				} else {CT_var_cursorBestSelect = objNull};
			} else {CT_var_cursorBestSelect = objNull;};
		};

		CT_var_cursor setPosATL _pos;
		if SOMETHING_SELECTED then {
			if (SEL_STATE == "busy") then {
				{
					_object = (_x select 0);
					[_object, 0, 0] call CT_fnc_setPB;
					
					_relPos = _x select 2;
					_oldPos = getPosASL _object;
					_heightDiff = (_oldPos select 2) - (getTerrainHeightASL _oldPos);
					_newPos = [
						(_pos select 0) - (_relPos select 0),
						(_pos select 1) - (_relPos select 1)
					];
					_newHeight = (getTerrainHeightASL _newPos) + _heightDiff;
					_newPos pushBack _newHeight;
					_object setPosASL _newPos;
					[_object] call CT_fnc_alignWithSurface;
				} forEach SELECTION;
			};
		};
	};
};