/* 
   File: fn_EM_performExport.sqf 
   Function: CT_fnc_EM_performExport 
   Folder: ExportMenuGUI 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

private ["_dialog","_firstList","_secondList","_thirdList","_formatCombo","_toClipCheck","_toDispCheck","_incTempCheck",
"_fl","_sl","_tl","_ef","_to","_dropEdit","_newLine","_tab","_text","_count"];
_dialog = findDisplay 25260;
_firstList = _dialog displayCtrl 100;
_secondList = _dialog displayCtrl 101;
_thirdList = _dialog displayCtrl 102;
_formatCombo = _dialog displayCtrl 400;
_toClipCheck = _dialog displayCtrl 300;
_toDispCheck = _dialog displayCtrl 301;
_incTempCheck = _dialog displayCtrl 302;
_dropEdit = _dialog displayCtrl 500;
_fl = lbCurSel _firstList;
_sl = lbCurSel _secondList;
_tl = lbSelection _thirdList;
_ef = lbCurSel _formatCombo;
_tc = if (cbChecked _incTempCheck) then {true} else {false};
_to = if (cbChecked _toClipCheck) then {0} else {if (cbChecked _toDispCheck) then {1};};
_br = toString [13,10];

_newLine = toString [10]; _tab = toString [9];
_text = '["Author:' + _tab + _tab + 'Unknown",' + _newLine + '"Date:' + _tab + _tab + _tab + '01.01.2015",' + _newLine + 
'"Decription:' + _tab + 'none",' + _newLine + '"Type:' + _tab + _tab + _tab;

if (_fl == 0) then {
	_text = _text + 'All libraries",' + _newLine + '[0], [';
	_text = _text + str (["object",_tc] call CT_fnc_EM_exportLibrary) + ',' +_newLine;
	_text = _text + str (["composition",_tc] call CT_fnc_EM_exportLibrary) + ',' + _newLine;
	_text = _text + str (["collection",_tc] call CT_fnc_EM_exportLibrary) + ',' + _newLine;
	_text = _text + str (["prefab",_tc] call CT_fnc_EM_exportLibrary)+ ']]' + _newLine;
};
if (_fl == 1) then {
	_text = _text + 'Single library, ';
	if (_sl == 0) then {_text = _text + 'objects",' + _newLine + '[1, 0], ' + str (["object",_tc] call CT_fnc_EM_exportLibrary)};
	if (_sl == 1) then {_text = _text + 'compositions",' + _newLine + '[1, 1], ' + str (["composition",_tc] call CT_fnc_EM_exportLibrary)};
	if (_sl == 2) then {_text = _text + 'collections",' + _newLine + '[1, 2], ' + str (["collection",_tc] call CT_fnc_EM_exportLibrary)};
	if (_sl == 3) then {_text = _text + 'prefabs",' + _newLine + '[1, 3], ' + str (["prefab",_tc] call CT_fnc_EM_exportLibrary)};
	_text = _text + ']' + _newLine;
};
if (_fl == 2) then {
	_text = _text + 'Single elements, ';
	_data = [];
	{
		_data pushBack (call compile(_thirdList lbData _x));
	} forEach _tl;
	if (_sl == 0) then {_text = _text + 'objects' + '",' + _newLine + '[2,0], ' + str _data};
	if (_sl == 1) then {_text = _text + 'compositions' + '",' + _newLine + '[2,1], ' + str _data};
	if (_sl == 2) then {_text = _text + 'collections' + '",' + _newLine + '[2,2], ' + str _data};
	if (_sl == 3) then {_text = _text + 'prefabs' + '",' + _newLine + '[2,3], ' + str _data};
	_text = _text + ']' + _newLine;
};
if (_fl == 3) then {
	_text = _text + 'Single category, ';
	_data = [];
	{
		_data pushBack (call compile(_thirdList lbData _x));
	} forEach _tl;
	if (_sl == 0) then {_text = _text + 'objects' + '",' + _newLine + '[3,0], ' + str _data};
	if (_sl == 1) then {_text = _text + 'compositions' + '",' + _newLine + '[3,1], ' + str _data};
	if (_sl == 2) then {_text = _text + 'collections' + '",' + _newLine + '[3,2], ' + str _data};
	if (_sl == 3) then {_text = _text + 'prefabs' + '",' + _newLine + '[3,3], ' + str _data};
	_text = _text + ']' + _newLine;
};
if (_fl == 4) then {
	_text = "";
	{
		_position = _x getVariable ["position",[]];
		_class = _x getVariable ["class",""];
		_model = _x getVariable ["model",""];
		_dir = _x getVariable ["dir",0];
		_pb = _x getVariable ["pb",[0,0]];
		_text = _text + (format ['[%1,"%2"],',ASLtoAGL _position,_model]) + _br;
	} forEach ct_var_subCubes;
};
if (_to == 0) then {
	["Exported to clipboard"] call CT_fnc_notification;
	copyToClipboard _text;
};
if (_to == 1) then {
	_count = count _text;
	if (_count < 1000) then {_dropEdit ctrlSetFontHeight 0.025};
	if ((_count > 1000) AND (_count <= 10000)) then {_dropEdit ctrlSetFontHeight 0.014};
	if ((_count > 10000) AND (_count <= 20000)) then {_dropEdit ctrlSetFontHeight 0.008};
	if ((_count > 20000) AND (_count <= 40000)) then {_dropEdit ctrlSetFontHeight 0.006};
	if ((_count > 40000) AND (_count <= 80000)) then {_dropEdit ctrlSetFontHeight 0.004};
	if ((_count > 80000) AND (_count <= 150000)) then {_dropEdit ctrlSetFontHeight 0.0035};
	if (_count > 150000) then {_dropEdit ctrlSetFontHeight 0.003};
	_dropEdit ctrlSetText _text;
};