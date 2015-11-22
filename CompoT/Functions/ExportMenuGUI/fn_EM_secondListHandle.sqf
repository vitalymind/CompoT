/* 
   File: fn_EM_secondListHandle.sqf 
   Function: CT_fnc_EM_secondListHandle 
   Folder: ExportMenuGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_dialog","_firstList","_secondList","_thirdList","_formatCombo","_firstIndex","_secIndex","_index","_library"];
_dialog = findDisplay 25260;
_firstList = _dialog displayCtrl 100;
_secondList = _dialog displayCtrl 101;
_thirdList = _dialog displayCtrl 102;
_formatCombo = _dialog displayCtrl 400;
_firstIndex = lbCurSel _firstList;
_secIndex = lbCurSel _secondList;
if (_firstIndex == -1) exitWith {};
lbClear _thirdList;
lbClear _formatCombo;
_formatCombo lbSetCurSel -1;
ctrlShow [400, false]; ctrlShow [602, false];
switch (_firstIndex) do {
	case 0: { //"All libraries"
	};
	case 1: { //"Single library"
	};
	case 2: { //"Single element"
		_library = [];
		switch (_secIndex) do {
			case 0: {//"Objects"
				_library = CT_var_objects;
			};
			case 1: {//"Compositions"
				_library = CT_var_compositions;
			};
			case 2: {//"Collections"
				_library = CT_var_collections;
			};
			case 3: {//"Prefabs"
				_library = CT_var_prefabs;
			};
		};
		{
			{
				_index = _thirdList lbAdd (_x select 0);
				_thirdList lbSetData [_index, str(_x)];
			} forEach (_x select 1);
		} forEach _library;
		_thirdList lbSetCurSel 0;
	};
	case 3: { //"Setup"
		switch (_secIndex) do {
			case 1: {//"Objects only"
				ctrlShow [400, true]; ctrlShow [602, true];
				_formatCombo lbAdd (localize "STR_A3_export_tool_format_default");
				_formatCombo lbAdd (localize "STR_A3_export_tool_format_mission");
				_formatCombo lbAdd (localize "STR_A3_export_tool_format_xCam");
				_formatCombo lbSetCurSel 0;
			};
		};
	};
};
call CT_fnc_EM_thirdListHandle;