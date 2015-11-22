/* 
   File: fn_infoUpdate.sqf 
   Function: CT_fnc_infoUpdate 
   Folder: InfoGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

if (!CT_var_infoGuiVisible) exitWith {};
disableSerialization;
private ["_name","_category","_library","_size","_dialog","_curCatIndex","_curElemIndex","_libraryPointer","_element","_prefab","_forbidden","_className","_displayName",
"_total","_elements","_control","_textSize","_colorWhite","_colorYellow","_resultText","_pos","_dir","_pivot","_childPivots","_childObjects","_mod","_height"];

_dialog = (uiNamespace getVariable 'CT_var_GUI_infoHandle');
_control = _dialog displayCtrl 100;
_resultText = parseText "";
_control ctrlSetStructuredText _resultText;
_textSize = (0.6 / (getResolution select 5));
_colorWhite = "FFFFFF";
_colorYellow = "FFD30D";
_height = CT_var_buildToolHeight;
if ((_height < 0.01 AND _height > 0) OR (_height > -0.01 AND _height < 0)) then {_height = 0};

_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>CURSOR  Dir: </t>", _textSize, _colorWhite])];
_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3   </t>", _textSize, _colorYellow, round CT_var_buildToolAngle])];
_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Height: </t>", _textSize, _colorWhite])];
_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3  </t>", _textSize, _colorYellow, _height])];
_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Pos: </t>", _textSize, _colorWhite])];
_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3-%4  </t>", _textSize, _colorYellow, (round((getPosASL CT_var_cursor) select 0)),(round((getPosASL CT_var_cursor) select 1))]), lineBreak];
_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Alignment:  </t>", _textSize, _colorWhite])];
_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3   </t>", _textSize, _colorYellow,if (CT_var_slopeMode) then {"land"} else {"sea"}])];
_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Build mode:  </t>", _textSize, _colorWhite])];
_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3</t>", _textSize, _colorYellow,((CT_var_buildMode select 0) select 0)]), lineBreak,lineBreak];

if (CT_var_cursorTool == "buildTool") then {
	_library = (CT_var_buildMode select 0) select 0;
	_curCatIndex = (CT_var_buildMode select 0) select 1;
	_curElemIndex = (CT_var_buildMode select 0) select 2;
	_libraryPointer = switch (_library) do {
		case "object": {CT_var_objects};
		case "collection": {CT_var_collections};
		case "composition": {CT_var_compositions};
		case "prefab": {CT_var_prefabs};
		default {[]};
	};
	if (count _libraryPointer == 0) exitWith {};
	_curCatIndex = _curCatIndex max 0 min ((count _libraryPointer) - 1);
	_curElemIndex = _curElemIndex max 0 min ((count ((_libraryPointer select _curCatIndex) select 1)) - 1);
	if (_curElemIndex == -1) then {_curElemIndex = 0};
	_element = ((_libraryPointer select _curCatIndex) select 1) select _curElemIndex;
	_name = _element select 0;
	_category = (_libraryPointer select _curCatIndex) select 0; 
	if (_library == "object") then {_size = str (_element select 4); _name = _element select 3;};
	if (_library == "composition") then {_size = str (_element select 1)};
	if (_library in ["prefab","collection"]) then {_size = "variant"};
	_total = count ((_libraryPointer select _curCatIndex) select 1);
	if (_total == 0) then {
		_elements = localize "STR_A3_info_gui_empty";
	} else {
		_elements = format ["%1 of %2",(_curElemIndex + 1), _total];
	};

	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Elements:   </t>", _textSize, _colorWhite])];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3</t>", _textSize, _colorYellow,_elements]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Name:      </t>", _textSize, _colorWhite])];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3</t>", _textSize, _colorYellow,_name]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Category:  </t>", _textSize, _colorWhite])];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3</t>", _textSize, _colorYellow,_category]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Library:    </t>", _textSize, _colorWhite])];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3</t>", _textSize, _colorYellow,_library]), lineBreak];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Size:       </t>", _textSize, _colorWhite])];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3</t>", _textSize, _colorYellow,_size]), lineBreak];
};
if (CT_var_cursorTool == "selectTool") then {
	if SOMETHING_SELECTED then {
		if (SEL_LIB == "pivot") then {
			_name = FIRST_SELECTION getVariable "name";
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Composition name: </t>", _textSize, _colorWhite])];
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3</t>", _textSize, _colorYellow,_name]), lineBreak];
			_prefab = FIRST_SELECTION getVariable ["prefab", "n/a"];
			if (typename _prefab == "ARRAY") then {
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Is prefab: </t>", _textSize, _colorWhite])];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3</t>", _textSize, _colorYellow,(_prefab select 0)]), lineBreak];
			};
			_pos = getPosATL FIRST_SELECTION;
			_dir = getDir FIRST_SELECTION;
			_size = FIRST_SELECTION getVariable "size";
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Pos: </t>", _textSize, _colorWhite])];
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3   </t>", _textSize, _colorYellow,_pos])];
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Dir: </t>", _textSize, _colorWhite])];
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3   </t>", _textSize, _colorYellow,_dir])];
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Size: </t>", _textSize, _colorWhite])];
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3</t>", _textSize, _colorYellow,_size]), lineBreak];
			_pivot = (FIRST_SELECTION getVariable "pivot") getVariable "name";
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Parent pivot: </t>", _textSize, _colorWhite])];
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3   </t>", _textSize, _colorYellow,_pivot]), lineBreak];
			_childPivots = count (FIRST_SELECTION getVariable "childPivots");
			_childObjects = count (FIRST_SELECTION getVariable "childObjects");
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Child pivots: </t>", _textSize, _colorWhite])];
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3   </t>", _textSize, _colorYellow,_childPivots])];
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Child objects: </t>", _textSize, _colorWhite])];
			_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3</t>", _textSize, _colorYellow,_childObjects]), lineBreak];
		};
		if (SEL_LIB == "object") then {
			if (count SELECTION == 0) then {
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Nothing selected</t>", _textSize, _colorWhite])];
			};
			if (count SELECTION == 1) then {
				_className = FIRST_SELECTION getVariable "name";
				_mod = configSourceMod (configFile >> 'CfgVehicles' >> _className);
				switch (_mod) do {
					case "": {_mod = "STD"};
					case "@CUP_Terrains": {_mod = "CUP"};
					default {};
				};
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Class name: </t>", _textSize, _colorWhite])];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3   </t>", _textSize, _colorYellow,_className])];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Mod: </t>", _textSize, _colorWhite])];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3</t>", _textSize, _colorYellow,_mod]), lineBreak];
				_displayName = (configFile >> 'CfgVehicles' >> _className >> "displayName") call BIS_fnc_getCfgData;
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Display name: </t>", _textSize, _colorWhite])];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3</t>", _textSize, _colorYellow,_displayName]), lineBreak];
				_pos = getPosATL FIRST_SELECTION;
				_dir = getDir FIRST_SELECTION;
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Pos: </t>", _textSize, _colorWhite])];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3   </t>", _textSize, _colorYellow,_pos])];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Dir: </t>", _textSize, _colorWhite])];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3   </t>", _textSize, _colorYellow,_dir]), lineBreak];
				_pivot = (FIRST_SELECTION getVariable "pivot") getVariable "name";
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Pivot: </t>", _textSize, _colorWhite])];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3   </t>", _textSize, _colorYellow,_pivot]), lineBreak];
			};
			if (count SELECTION > 1) then {
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>%3 </t>", _textSize, _colorYellow,count SELECTION])];
				_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>objects selected</t>", _textSize, _colorWhite])];
			};
		};
	} else {
		_resultText = composeText [_resultText,(parseText format["<t size='%1' align='left' color='#%2'>Nothing selected</t>", _textSize, _colorWhite])];
	};
};
_control ctrlSetStructuredText _resultText;