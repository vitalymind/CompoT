//Stop script execution while in CompoT editor
if ((uiNameSpace getVariable ["CT_var_gui_runMode", "mission"]) == "editor") exitWith {};

mission_currentTask = 0;
mission_compoundEnemies = [compound1,compound2,compound3,compound4];
mission_tankSquad = [tank1,tank2,tank3,tank4,tank5];
mission_firstTask = {
	if (mission_currentTask != 0) exitWith {};
	[] spawn {
		hint parseText format ["<t color='#ff0000' size='1.3'>New task: <t color='#FFFFFF'>Find a weapon in near by village</t>"];
		(group player) addWaypoint [[10450,16440,0],0];
		_mk = createMarker ["first_task", [10450,16440,0]];
		_mk setMarkerColor "ColorRed";
		_mk setMarkerShape "ELLIPSE";
		_mk setMarkerSize [25,25];
		_mk setMarkerAlpha 0.3;
		mission_currentTask = 1;
		task0 = player createSimpleTask ["Find a weapon"];
		task0 setSimpleTaskDescription ["Search nearby village for weapon. Unfinished buildings looks like ideal place for it.","Find a weapon",""];
		sleep 4;
		hintsilent "";
	};
};
mission_secondTask = {
	if (mission_currentTask != 1) exitWith {};
	[] spawn {
		deleteWaypoint [(group player), 1];
		task0 setTaskState "Succeeded";
		hint parseText "<t color='#0AFF1F' size='1.3'>Task complete: <t color='#FFFFFF'>Nice! Weapon stash!</t>";
		sleep 3;
		task1 = player createSimpleTask ["Engage enemies"];
		task1 setSimpleTaskDescription ["Clear out all enemies from old castle compound.","Engage enemies",""];
		hint parseText format ["<t color='#ff0000' size='1.3'>New task: <t color='#FFFFFF'>Engage enemies at nearby compound</t>"];
		deleteMarker "first_task";
		_wp = (group player) addWaypoint [[10400,16500,0],0];
		_wp setWaypointType "SAD";
		mission_currentTask = 2;
		sleep 4;
		hintsilent "";
		[] spawn {
			waitUntil {sleep 1; ({alive _x} count mission_compoundEnemies) == 0};
			task1 setTaskState "Succeeded";
			deleteWaypoint [(group player), 1];
			hint parseText "<t color='#0AFF1F' size='1.3'>Task complete: <t color='#FFFFFF'>Good job! All enemies killed!</t>";
			sleep 5;
			task2 = player createSimpleTask ["Gather intel"];
			task2 setSimpleTaskDescription ["Get location of evac helicopter from officers PC.","Gather intel",""];
			hint parseText format ["<t color='#ff0000' size='1.3'>New task: <t color='#FFFFFF'>Search officers computer for evac helicopter location</t>"];
			_wp = (group player) addWaypoint [getPosATL mission_officerPC,0];
			_wp setWaypointType "MOVE";
			mission_officerPC addAction ["<t color='#FF0000'>Gather intel</t>", "call mission_thirdTask"];
			sleep 4;
			hintsilent "";
		};
	};
};
mission_thirdTask = {
	deleteWaypoint [(group player), 1];
	removeAllActions mission_officerPC;
	[] spawn {
		hint "";
		_arr = toArray "====================";
		for "_i" from 1 to 13 do {
			for "_g" from 0 to (_i-1) do {
				_arr set [_g, 42];
			};
			_t1 = "<t color='#FFFFFF' size='1.3'>Searching for intel...</t>";
			_t2 = format ["<t color='#FFEA00' size='1.3'>\%1\</t>",toString _arr];
			hintSilent composeText [parseText _t1, linebreak, linebreak, parseText _t2];
			sleep 0.3;
		};
		["Whhoops! Looks like you accidentally called for enemy reinforcement!",0,0,5,0,0,5] spawn BIS_fnc_dynamicText;
		sleep 3;
		_arr = toArray "*************=======";
		for "_i" from 1 to 7 do {
			for "_g" from 0 to (_i-1) do {
				_arr set [(_g+13), 42];
			};
			_t1 = "<t color='#FFFFFF' size='1.3'>Searching for intel...</t>";
			_t2 = format ["<t color='#FFEA00' size='1.3'>\%1\</t>",toString _arr];
			hintSilent composeText [parseText _t1, linebreak, linebreak, parseText _t2];
			sleep 0.3;
		};
		task2 setTaskState "Succeeded";
		hint parseText "<t color='#0AFF1F' size='1.3'>Task complete: <t color='#FFFFFF'>You have found evac helicopter location!</t>";
		sleep 3;
		task3 = player createSimpleTask ["Prepare for fight"];
		task3 setSimpleTaskDescription ["While searching officers computer for intel, you accidentally called for enemies reinforcement. 
		Now you have to get ready for incoming tank squad. You will need AT weapon, according to officers notes, there is a rocket launcher in a stash at the top of castle tower.",
		"Prepare for fight",""];
		hint parseText format ["<t color='#ff0000' size='1.3'>New task: <t color='#FFFFFF'>Prepare for enemy reinforcement, search old castle tower for AT weapon</t>"];
		_wp = (group player) addWaypoint [[10410.6,16517.5,0],0];
		_wp setWaypointType "MOVE";
		sleep 5;
		hintsilent "";
		[] spawn {
			waitUntil {sleep 0.5; ((player distance ATweaponsBox) < 2)};
			call mission_forthTask;
		};
	};
};
mission_forthTask = {
	[] spawn {
		deleteWaypoint [(group player), 1];
		hint parseText "<t color='#0AFF1F' size='1.3'>Task complete: <t color='#FFFFFF'>Here it is!</t>";
		sleep 3;
		[] spawn {
			hint parseText format ["<t color='#ff0000' size='1.3'>New task: <t color='#FFFFFF'>Defend against enemy tank squad</t>"];
			sleep 5;
			hintsilent "";
			{
				_x enableSimulation true;
				_x hideObject false;
			} forEach mission_tankSquad;
			_wp = (group tank1) addWaypoint [[10470,16491,0],0];
			_wp setWaypointType "SAD";
			call mission_fifthTask;
		};
	};
};
mission_fifthTask = {
	[] spawn {
		waitUntil {sleep 1; ({alive _x} count mission_tankSquad) == 0};
		hint parseText "<t color='#0AFF1F' size='1.3'>Task complete: <t color='#FFFFFF'>Great job!</t>";
		task3 setTaskState "Succeeded";
		sleep 5;
		task4 = player createSimpleTask ["Get to evac helicopter"];
		task4 setSimpleTaskDescription ["Tank squad is history, go to military base located north-west from castle, fight enemies and capture helicopter.", "Get to evac heli",""];
		hint parseText format ["<t color='#ff0000' size='1.3'>New task: <t color='#FFFFFF'>Get to evac heli</t>"];
		sleep 5;
		hintsilent "";
		_wp = (group player) addWaypoint [[9984,16627,0],0];
		call mission_sixthTask;
	};
};
mission_sixthTask = {
	[] spawn {
		waitUntil {sleep 1; ((player distance evacHeli) < 5)};
		hint parseText "<t color='#0AFF1F' size='1.3'>Task complete: <t color='#FFFFFF'>Evac heli found</t>";
		task4 setTaskState "Succeeded";
		sleep 3;
		task5 = player createSimpleTask ["Escape"];
		task5 setSimpleTaskDescription ["Fly to your freedom!", "Escape",""];
		hint parseText format ["<t color='#ff0000' size='1.3'>New task: <t color='#FFFFFF'>Fly into sunset!</t>"];
		sleep 5;
		hintsilent "";
		[] spawn {
			waitUntil {sleep 1; ((player distance [9982,16626,0]) > 1000)};
			"end1" call BIS_fnc_endMission;
		};
	};
};

[] spawn {
sleep 0.1;
"Welcome to CompoT example mission" hintC [
"This mission serves as an example of what can be done with composition tool.",
"Use this mission to find out how Composition Tool works.",
parseText "Additional information found on <a color='#AEFF00' href='https://forums.bistudio.com/topic/186056-composition-tool-eden-editor-plugin/'>forum</a>"
];
findDisplay 72 displayAddEventHandler ["unload", {_this spawn {hintSilent ""};}];
};








