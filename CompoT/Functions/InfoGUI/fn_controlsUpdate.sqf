/* 
   File: fn_controlsUpdate.sqf 
   Function: CT_fnc_controlsUpdate 
   Folder: InfoGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

if (!CT_var_controlsGuiVisible) exitWith {};
disableSerialization;
private ["_dialog","_textCtrl","_resultText","_textSize","_colorWhite","_colorYellow","_backCtrl","_posX","_posY","_width","_height","_rows"];
_dialog = (uiNamespace getVariable 'CT_var_GUI_controlsHandle');
_textCtrl = _dialog displayCtrl 100;
_backCtrl = _dialog displayCtrl 101;
_resultText = parseText "";
_textCtrl ctrlSetStructuredText _resultText;
_textSize = (0.6 / (getResolution select 5));
_colorWhite = "FFFFFF";
_colorYellow = "FFD30D";
_posX = 0;_posY = 0;_width = 0;_height = 0;
if (CT_var_curGUIMode == "info+basicControls") then {
	_posX = 0.8;
	_width = 0.2;
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>ESC<t align='right' color='#%3'>Cancel selection/grab</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>W, A, S, D<t align='right' color='#%3'>Camera movement</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Q, E<t align='right' color='#%3'>Camera height</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Mouse Wheel<t align='right' color='#%3'>Camera speed</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>F1<t align='right' color='#%3'>Options</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>F2<t align='right' color='#%3'>Switch GUI mode</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>F3<t align='right' color='#%3'>Export manager</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>F4<t align='right' color='#%3'>Import manager</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>F5<t align='right' color='#%3'>Object library</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>F6<t align='right' color='#%3'>Composition library</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>F7<t align='right' color='#%3'>Collections library</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>F8<t align='right' color='#%3'>Prefab libaray</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>F11<t align='right' color='#%3'>Open/close editor</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>1<t align='right' color='#%3'>Build tool</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>2<t align='right' color='#%3'>Select tool</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>L<t align='right' color='#%3'>Toggle alignment mode</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>CAPSLOCK<t align='right' color='#%3'>Toggle cursor mode</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>CTRL+Q<t align='right' color='#%3'>Toggle rotation mode</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>CTRL+S<t align='right' color='#%3'>Toggle stick to object mode</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>SHIFT+CTRL+K<t align='right' color='#%3'>Delete everything</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>SHIFT+CTRL+E<t align='right' color='#%3'>Re-Build everything</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>CTRL+G<t align='right' color='#%3'>Set main pivot position</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
	_rows = 22;
	_posY = 1 - (_rows * 0.021);
	_height = _rows * 0.021;
};
if (CT_var_curGUIMode == "info+cursorControls") then {
	_posX = 0.80;
	_width = 0.20;
	if (CT_var_cursorTool == "buildTool") then {
		_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>1<t align='right' color='#%3'>Toggle empty hands</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
		_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>TAB<t align='right' color='#%3'>Reset build height</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
		_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>LMB<t align='right' color='#%3'>Build element</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
		_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>CTRL+LMB<t align='right' color='#%3'>Build multiply elements</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
		_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Hold RMB<t align='right' color='#%3'>Select building library</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
		_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>SHIFT+F<t align='right' color='#%3'>Build new pivot</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
		_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>SHIFT+MW<t align='right' color='#%3'>Rotate build tool</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
		_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>ALT+MW<t align='right' color='#%3'>Adjust build tool height</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
		_rows = 8;
		if (((CT_var_buildMode select 0) select 0) == "object") then {
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>SPACE<t align='right' color='#%3'>Object selection menu</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
			_rows = _rows + 1;
		} else {
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>CTRL+MW<t align='right' color='#%3'>Next/previous element</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>SHIFT+CTRL+MW<t align='right' color='#%3'>Next/previous category</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
			_rows = _rows + 2;
		};
		_posY = 1 - (_rows * 0.021);
		_height = _rows * 0.021;
	};
	if (CT_var_cursorTool == "selectTool") then {
		if NOTHING_SELECTED then {
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>TAB<t align='right' color='#%3'>Toggle cursor size</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>LMB<t align='right' color='#%3'>Select near object/composition</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>SHIFT+LMB<t align='right' color='#%3'>Add/Remove object to selection</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>CTRL+LMB<t align='right' color='#%3'>Select near pivot</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>RMB<t align='right' color='#%3'>Grab nearest object/composition</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>ALT+RMB<t align='right' color='#%3'>Special object grab</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>CTRL+C<t align='right' color='#%3'>Copy object(-s)/composition</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>CTRL+V<t align='right' color='#%3'>Paste object(-s)/composition</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
			_rows = 8;
			_posY = 1 - (_rows * 0.021);
			_height = _rows * 0.021;
		};
		if SOMETHING_SELECTED then {
			if (SEL_LIB == "object") then {
				if (SEL_STATE == "busySpecial") then {
					_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>SHIFT+MW<t align='right' color='#%3'>Rotate object</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
					_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>CTRL+MW<t align='right' color='#%3'>Push/Pull object from camera</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
					_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>ALT+MW<t align='right' color='#%3'>Adjust object height</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
					_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>ALT+RMB<t align='right' color='#%3'>Place object</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
					_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>ESC<t align='right' color='#%3'>Cancel grab</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
					_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>RMB<t align='right' color='#%3'>Preview placement</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
					_rows = 6;
					_posY = 1 - (_rows * 0.021);
					_height = _rows * 0.021;
				};
				if (SEL_STATE == "emptySpecial") then {
					_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>ESC<t align='right' color='#%3'>Cancel grab</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
					_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>RMB<t align='right' color='#%3'>Continue grab</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
					_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>ALT+RMB<t align='right' color='#%3'>Place object</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
					_rows = 3;
					_posY = 1 - (_rows * 0.021);
					_height = _rows * 0.021;
				};
				if (SEL_STATE in ["empty","busy"]) then {
					_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>CTRL+RMB<t align='right' color='#%3'>Grab nearest selected object(-s)</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
					_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>SHIFT+MW<t align='right' color='#%3'>Rotate object(-s)</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
					_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>ALT+MW<t align='right' color='#%3'>Adjust object(-s) height</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
					_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>ALT+R<t align='right' color='#%3'>Reset object(-s) ownership</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
					_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>DEL<t align='right' color='#%3'>Delete object(-s)</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
					_rows = 5;
					_posY = 1 - (_rows * 0.021);
					_height = _rows * 0.021;
				};
			};
			if (SEL_LIB == "pivot") then {
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>CTRL+RMB<t align='right' color='#%3'>Grab nearest selected pivot</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>SHIFT+RMB<t align='right' color='#%3'>Grab pivot with child objects</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>CTRL+SHIFT+RMB<t align='right' color='#%3'>Grab only pivot</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>CTRL+MW<t align='right' color='#%3'>Adjust composition size</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>SHIFT+MW<t align='right' color='#%3'>Rotate composition</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>CTRL+SHIFT+MW<t align='right' color='#%3'>Rotate whole tree</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>ALT+MW<t align='right' color='#%3'>Adjust composition height</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>SHIFT+ALT+MW<t align='right' color='#%3'>Adjust whole tree height</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>ALT+R<t align='right' color='#%3'>Reset pivot owner</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>CTRL+D<t align='right' color='#%3'>Clone composition</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>CTRL+R<t align='right' color='#%3'>Reclaim pivot ownership</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>CTRL+E<t align='right' color='#%3'>Re-Build composition</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>SHIFT+R<t align='right' color='#%3'>Reclaim objects in radius</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>CTRL+F<t align='right' color='#%3'>Save composition</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>DEL<t align='right' color='#%3'>Delete composition</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>SHIFT+DEL<t align='right' color='#%3'>Delete whole tree</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>SHIFT+CTRL+DEL<t align='right' color='#%3'>Delete only pivot</t>", _textSize, _colorWhite,_colorYellow]), lineBreak];
				_rows = 17;
				_posY = 1 - (_rows * 0.021);
				_height = _rows * 0.021;
			};
		};

	};
};
_textCtrl ctrlSetPosition [
	_posX * safezoneW + safezoneX,
	_posY * safezoneH + safezoneY,
	_width * safezoneW,
	_height * safezoneH
];
_backCtrl ctrlSetPosition [
	_posX * safezoneW + safezoneX,
	_posY * safezoneH + safezoneY,
	_width * safezoneW,
	_height * safezoneH
];
_textCtrl ctrlCommit 0;
_backCtrl ctrlCommit 0;
_textCtrl ctrlSetStructuredText _resultText;