/* 
   File: fn_notification.sqf 
   Function: CT_fnc_notification 
   Folder: UserInformation 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

disableSerialization;
private ["_text","_dialog","_control","_textSize","_colorYellow","_resultText","_colorWhite"];
7 cutRsc ["message_GUI","PLAIN",0];
_dialog = (uiNamespace getVariable 'CT_var_GUI_messageHandle');
_control = _dialog displayCtrl 100;
_textSize = (1 / (getResolution select 5));
_colorYellow = "FFD30D";
_colorWhite = "FFFFFF";
_resultText = parseText format ["<t size='%1' align='center' color='#%2'>INFO: </t>", _textSize, _colorWhite];
_resultText = composeText [_resultText,(parseText format["<t size='%1' align='center' color='#%2'>%3</t>", _textSize, _colorYellow,(_this select 0)])];
_control ctrlSetStructuredText _resultText;