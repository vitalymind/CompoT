/* 
   File: fn_cursorUpdate.sqf 
   Function: CT_fnc_cursorUpdate 
   Folder: Cursor 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_pos","_objPos","_objDir","_id","_points","_objHeight","_contact","_posCam","_posTarget","_skipIntersect","_oldPos","_newPos",
"_selectedObjects", "_size","_distance","_skipSpecial","_data","_dirOffset","_distanceOffset","_heightOffset","_object","_height",
"_newHeight","_intersections","_primaryObjectHeight"];

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
		if ((count CT_var_builtPreview == 0) AND CT_var_stickToObjectMode) then {
			_intersections = lineIntersectsSurfaces [getPosASL ct_var_cam, _pos, objNull, objNull, true, 1];
			if (count _intersections != 0) then {_pos = (_intersections select 0) select 0};
		};
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
				_object = (CT_var_builtPreview select 0);
				_intersections = [];
				if (CT_var_stickToObjectMode) then {
					_intersections = lineIntersectsSurfaces [getPosASL ct_var_cam, _pos, _object, objNull, true, 1];
				};
				if (count _intersections != 0) then {
					_pos = (_intersections select 0) select 0;
					_pos set [2,((_pos select 2) + CT_var_buildToolHeight)];
				} else {
					_pos set [2,((getTerrainHeightASL _pos) + CT_var_buildToolHeight)];
				};
				[_object, 0, 0] call CT_fnc_setPB;

				_object setPosASL _pos;
				[_object] call CT_fnc_alignWithSurface;
				CT_var_cursor setPosASL _pos;
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

		_contact = [];
		if (!_skipIntersect) then {
			_posCam = getPosASL CT_var_cam;
			_posTarget = screenToWorld CT_var_mousePos;
			_posTarget = [_posTarget select 0, _posTarget select 1, getTerrainHeightASL _posTarget];
			_contact = lineIntersectsSurfaces [_posCam, _posTarget, objnull, objNull, true, 1];
			if (count _contact != 0) then {
				_pos = ASLToATL ((_contact select 0) select 0);
				if (((_contact select 0) select 3) in CT_var_builtObjects) then {
					CT_var_cursorBestSelect = (_contact select 0) select 3;
				} else {CT_var_cursorBestSelect = objNull};
			} else {CT_var_cursorBestSelect = objNull;};
		};
		
		CT_var_cursor setPosATL _pos;
		if (CT_var_mouseCursorActive) then {CT_var_cursor hideObject true} else {CT_var_cursor hideObject false};
		if SOMETHING_SELECTED then {
			if (SEL_STATE == "busy") then {
				CT_var_cursor hideObject true;
				_mousePos = screenToWorld CT_var_mousePos;
				_primaryObjectHeight = 0;
				_selectedObjects = [];
				{
					_selectedObjects pushBack (_x select 0);
					if ((_x select 0) == ([_selectedObjects] call CT_fnc_cursorFindClosestObject)) then {_primaryObjectHeight = (_x select 3) select 2};
				} forEach SELECTION;
				
				if (CT_var_stickToObjectMode) then {
					_posCam = getPosASL CT_var_cam;
					_posTarget = _mousePos;
					_posTarget = [_posTarget select 0, _posTarget select 1, getTerrainHeightASL _posTarget];
					_contact = lineIntersectsSurfaces [_posCam, _posTarget, objNull, objNull, true, 10];
					{
						if ((_x select 3) in _selectedObjects) then {_contact set [_forEachIndex, "delMe"]};
					} forEach _contact;
					if (!isNil "noLootIntersect") then {
						if (noLootIntersect) then {
							{
								if (typeName _x == "ARRAY") then {
									if ((_x select 3) in ct_var_builtObjects) then {_contact set [_forEachIndex, "delMe"]};
								};
							} forEach _contact;
						};
					};
					_contact = _contact - ["delMe"];
					if (count _contact != 0) then {
						_pos = ASLtoATL ((_contact select 0) select 0);
					};
				} else {
					_lengthT = _primaryObjectHeight * ((sin 90) / (sin (((ct_var_cam call ct_fnc_getPB) select 0) * -1)));
					_endPosT = _mousePos;
					_startPosT = getPosATL ct_var_cam;
					_distanceT = _endPosT distance _startPosT;
					_pos = (((_endPosT vectorDiff _startPosT) vectorMultiply (1 - (_lengthT / _distanceT))) vectorAdd _startPosT);
				};
				{
					_object = (_x select 0);
					_pb = _object call CT_fnc_getPB;
					[_object, 0, 0] call CT_fnc_setPB;
					_newPos = []; _newHeight = 0;
					_relPos = _x select 2;
					_newPos = [
						(_pos select 0) - (_relPos select 0),
						(_pos select 1) - (_relPos select 1)
					];
					if (CT_var_stickToObjectMode) then {
						_newHeight = (_pos select 2) - (_relPos select 2);
					} else {
						_newHeight = _primaryObjectHeight - (_relPos select 2);
					};
					
					_newPos pushBack _newHeight;
					_object setPosATL _newPos;
					if (ct_var_vectorUpMode == 0) then {
						[_object] call CT_fnc_alignWithSurface;
					};
					if (ct_var_vectorUpMode == 1) then {
						[_object, _pb select 0, _pb select 1] call CT_fnc_setPB;
					};
				} forEach SELECTION;
			};
		};
	};
};