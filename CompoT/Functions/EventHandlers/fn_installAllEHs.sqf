/* 
   File: fn_installAllEHs.sqf 
   Function: CT_fnc_installAllEHs 
   Folder: EventHandlers 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

(findDisplay 46) displayAddEventHandler ["keyDown", "_this call CT_fnc_handleKeyDown"];
(findDisplay 46) displayAddEventHandler ["keyUp", "_this call CT_fnc_handleKeyUp"];
(findDisplay 46) displayAddEventHandler ["mouseMoving", "_this call CT_fnc_handleMouseMove"];
(findDisplay 46) displayAddEventHandler ["mouseHolding", "_this call CT_fnc_handleMouseHold"];
(findDisplay 46) displayAddEventHandler ["mouseZChanged", "_this call CT_fnc_handleMouseWheel"];
(findDisplay 46) displayAddEventHandler ["mouseButtonDown", "_this call CT_fnc_handleMouseButtonDown"];
(findDisplay 46) displayAddEventHandler ["mouseButtonUp", "_this call CT_fnc_handleMouseButtonUp"];
addMissionEventHandler ["draw3D", {call CT_fnc_handleDraw3D}];