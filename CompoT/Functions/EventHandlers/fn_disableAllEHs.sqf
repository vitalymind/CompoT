/* 
   File: fn_disableAllEHs.sqf 
   Function: CT_fnc_disableAllEHs 
   Folder: EventHandlers 
   Scope: private 
   Author Vitaly'mind'Chizhikov --- v@vlasport.com 
   Part of composition tool 
*/ 
#include "defines.hpp" 

(findDisplay 46) displayRemoveAllEventHandlers "KeyDown";
(findDisplay 46) displayRemoveAllEventHandlers "keyUp";
(findDisplay 46) displayRemoveAllEventHandlers "mouseMoving";
(findDisplay 46) displayRemoveAllEventHandlers "mouseHolding";
(findDisplay 46) displayRemoveAllEventHandlers "mouseZChanged";
(findDisplay 46) displayRemoveAllEventHandlers "mouseButtonDown";
(findDisplay 46) displayRemoveAllEventHandlers "mouseButtonUp";
removeAllMissionEventHandlers "draw3D";