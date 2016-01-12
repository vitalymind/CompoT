/* 
   File: fn_errorMsg.sqf 
   Function: CT_fnc_errorMsg 
   Folder: UserInformation 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
if ((uiNameSpace getVariable ["CT_var_gui_runMode", "mission"]) == "editor") then {
	private ["_text","_dialog","_control","_textSize","_colorYellow","_resultText","_colorRed"];
	7 cutRsc ["ct_message_GUI","PLAIN",0];
	_dialog = (uiNamespace getVariable 'CT_var_GUI_messageHandle');
	_control = _dialog displayCtrl 100;
	_textSize = (1 / (getResolution select 5));
	_colorYellow = "FFD30D";
	_colorRed = "FF5959";
	_resultText = parseText format ["<t size='%1' align='center' color='#%2'>ERROR: </t>", _textSize, _colorRed];
	_resultText = composeText [_resultText,(parseText format["<t size='%1' align='center' color='#%2'>%3</t>", _textSize, _colorYellow,(_this select 0)])];
	_control ctrlSetStructuredText _resultText;
} else {
	diag_log format ["CT ERROR: %1",(_this select 0)];
};