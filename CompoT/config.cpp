class CfgPatches {
	class composition_tool {
		units[] = {};
		weapons[] = {};
		worlds[] = {""};
		requiredVersion = 1.55;
		requiredAddons[] = {"3DEN"};
	};
};

class compo_background_base
{
	access = 0; 
	idc = -1; 
	x = 0; 	y = 0; 	w = 0; 	h = 0; 
	type = 0; 
	style = 0; 
	colorText[] = { 0, 0, 0, 0 }; 
	text = ""; 
	shadow = 0; 
	font = "TahomaB"; 
	sizeEx = 0.03; 
	colorBackground[] = {0,0,0,0.4}; 
};
class compo_button_base
{
	access = 0; 
	type = 1; 
	text = ""; 
	x = 0; y = 0; w = 0; h = 0; 
	colorText[] = { 0.8784, 0.8471, 0.651, 1 }; 
	colorDisabled[] = { 1, 0.537, 0, 0.5 }; 
	colorBackground[] = { 1, 0.537, 0, 0.5 }; 
	colorBackgroundDisabled[] = { 0.7, 0.7, 0.7, 1 }; 
	colorBackgroundActive[] = { 1, 0.537, 0, 1 }; 
	colorFocused[] = { 1, 0.537, 0, 0.5 }; 
	colorShadow[] = { 0.023529, 0, 0.0313725, 1 }; 
	colorBorder[] = { 0.023529, 0, 0.0313725, 1 }; 
	style = 0x02; 
	shadow = 0; 
	font = "EtelkaNarrowMediumPro"; 
	sizeEx = 0.035; 
	offsetX = 0.003; 
	offsetY = 0.003; 
	offsetPressedX = 0.002; 
	offsetPressedY = 0.002; 
	borderSize = 0; 
	soundEnter[] = { "", 0, 0 }; 
	soundPush[] = { "", 0, 0 }; 
	soundClick[] = { "", 0, 0 }; 
	soundEscape[] = { "", 0, 0 }; 
};
class compo_tree_base 
{
	access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
	idc = 12; // Control identification (without it, the control won't be displayed)
	type = 12; // Type is 12
	style = 0; // Style
	blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.
	colorBorder[] = {0,0,0,1}; // Frame color
	colorBackground[] = {0.2,0.2,0.2,1}; // Fill color
	colorSelect[] = {1,0.5,0,1}; // Selected item fill color (when multiselectEnabled is 0)
	colorMarked[] = {1,0.5,0,0.5}; // Marked item fill color (when multiselectEnabled is 1)
	colorMarkedSelected[] = {1,0.5,0,1}; // Selected item fill color (when multiselectEnabled is 1)
	sizeEx = 0.048; // Text size
	font = "PuristaMedium"; // Font from CfgFontFamilies
	shadow = 0; // Shadow (0 - none, 1 - N/A, 2 - black outline)
	colorText[] = {1,1,1,1}; // Text color
	colorSelectText[] = {1,1,1,1}; // Selected text color (when multiselectEnabled is 0)
	colorMarkedText[] = {1,1,1,1}; // Selected text color (when multiselectEnabled is 1)

	tooltip = ""; // Tooltip text
	tooltipColorShade[] = {0,0,0,1}; // Tooltip background color
	tooltipColorText[] = {1,1,1,1}; // Tooltip text color
	tooltipColorBox[] = {1,1,1,1}; // Tooltip frame color

	multiselectEnabled = 0; // Allow selecting multiple items while holding Ctrl or Shift
	expandOnDoubleclick = 1; // Expand/collapse item upon double-click
	hiddenTexture = "A3\ui_f\data\gui\rsccommon\rsctree\hiddenTexture_ca.paa"; // Expand icon
	expandedTexture = "A3\ui_f\data\gui\rsccommon\rsctree\expandedTexture_ca.paa"; // Collapse icon
	maxHistoryDelay = 1; // Time since last keyboard type search to reset it

	// Scrollbar configuration
	class ScrollBar
	{
		width = 0; // width of ScrollBar
		height = 0; // height of ScrollBar
		scrollSpeed = 0.1; // scroll speed of ScrollBar

		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)

		color[] = {1,1,1,1}; // Scrollbar color
	};

	colorDisabled[] = {0,0,0,0}; // Does nothing, but must be present, otherwise an error is shown
	colorArrow[] = {0,0,0,0}; // Does nothing, but must be present, otherwise an error is shown
};
class compo_list_base
{
	style = 16;
	idc = -1;
	type = 5;
	w = 0.275;
	h = 0.04;
	font = "PuristaMedium";
	colorSelect[] = {1, 1, 1, 1};
	colorText[] = {1, 1, 1, 1};
	colorBackground[] = {0.28,0.28,0.28,1};
	colorSelect2[] = {1, 1, 1, 1};
	colorSelectBackground[] = {0.95, 0.95, 0.95, 0.5};
	colorSelectBackground2[] = {1, 1, 1, 0.5};
	colorScrollbar[] = {0.2, 0.2, 0.2, 1};
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	wholeHeight = 0.45;
	rowHeight = 0.04;
	color[] = {0.7, 0.7, 0.7, 1};
	colorActive[] = {0,0,0,1};
	colorDisabled[] = {0,0,0,0.3};
	sizeEx = 0.038;
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	class ListScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		shadow = 0;
		scrollSpeed = 0.4;
		width = 0;
		height = 0;
		autoScrollEnabled = 1;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
	};
};
class compo_combo_base
{
	access = 0;
	type = 4;
	style = 0;
	h = 0.05;
	wholeHeight = 0.25;
	colorSelect[] = {0.6,0.6,0.6,1};
	colorText[] = {1,1,1,1};
	colorBackground[] = {0.2,0.2,0.2,1};
	colorScrollbar[] = {1,1,1,1};
	font = "PuristaMedium";
	sizeEx = 0.04;
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 1.0;
	color[] = {1,1,1,0.6};
	colorActive[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.3};
	thumb =		"\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
	arrowEmpty =	"\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	arrowFull =	"\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	border =	"\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	shadow = 0;
	scrollSpeed = 0.06;	
	width = 0;
	height = 0;
	autoScrollEnabled = 0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	class ComboScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb =		"\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowEmpty =	"\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull =	"\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		border =	"\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		shadow = 0;
		scrollSpeed = 0.06;	
		width = 0;
		height = 0;
		autoScrollEnabled = 0;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
	};
};
class compo_edit_base
{
	type = 2;
	style = 0;
	font = "PuristaMedium";
	shadow = 2;
	sizeEx = 0.03;
	text = "";
	colorBackground[] = {0, 0, 0, 1};
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	colorText[] = {0.95, 0.95, 0.95, 1};
	colorDisabled[] = {1, 1, 1, 0.25};
	autocomplete = false;
	colorSelection[] = {1,1,1,1};
	canModify = 1;
	x = 0; 	y = 0; 	w = 0; 	h = 0; 
};
class compo_check_base
{
	idc = -1;
	type = 77;
	style = 0;
	checked = 0;
	x = "0.375 * safezoneW + safezoneX";
	y = "0.36 * safezoneH + safezoneY";
	w = "0.025 * safezoneW";
	h = "0.04 * safezoneH";
	color[] = {1, 1, 1, 0.7};
	colorFocused[] = {1, 1, 1, 1};
	colorHover[] = {1, 1, 1, 1};
	colorPressed[] = {1, 1, 1, 1};
	colorDisabled[] = {1, 1, 1, 0.2};
	colorBackground[] = {0, 0, 0, 0};
	colorBackgroundFocused[] = {0, 0, 0, 0};
	colorBackgroundHover[] = {0, 0, 0, 0};
	colorBackgroundPressed[] = {0, 0, 0, 0};
	colorBackgroundDisabled[] = {0, 0, 0, 0};
	textureChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureFocusedChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureFocusedUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureHoverChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureHoverUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	texturePressedChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	texturePressedUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureDisabledChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureDisabledUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	tooltipColorText[] = {1, 1, 1, 1};
	tooltipColorBox[] = {1, 1, 1, 1};
	tooltipColorShade[] = {0, 0, 0, 0.65};
	soundEnter[] = {"", 0.1, 1};
	soundPush[] = {"", 0.1, 1};
	soundClick[] = {"", 0.1, 1};
	soundEscape[] = {"", 0.1, 1};
};
class compo_3dpreview_base
{
	//Thanks KK!
	type = 82;
	model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
	scale = 1;
	direction[] = {0, -0.35, -0.65};
	up[] = {0, 0.65, -0.35}; 
	//position[] = {0,0,0.2}; optional
	x = 0.8;
	y = 0.85;
	z = 5;
	//positionBack[] = {0,0,1.2}; optional
	xBack = 0.8;
	yBack = 0.85;
	zBack = 5;
	inBack = 1;
	enableZoom = 0;
	zoomDuration = 0.001;
};
class compo_text_base
{
	access = 0; 
	type = 13; 
	x = 0; y = 0; w = 0; h = 0; 
	colorBackground[] = { 0, 0, 0, 0 };
	colorText[] = {1, 1, 1, 1.0};
	color = "#FFD30D";
	text = ""; 
	fixedWidth = 0; 
	style = 0;
	shadow = 1; 
	Size = 0.034; 
	class Attributes 
	{
		font = "PuristaMedium";
		color = "#FFD30D";
		align = "left";
		shadow = false;
		shadowColor = "#524300";
	};
};
class screen_text_base
{
	access = 0; 
	type = 13; 
	x = 0; y = 0; w = 0; h = 0; 
	colorBackground[] = { 0, 0, 0, 0 };
	colorText[] = {1, 1, 1, 1.0};
	color = "#ffffff";
	text = ""; 
	fixedWidth = 0; 
	style = 0;
	shadow = 1; 
	Size = 0.034; 
	class Attributes 
	{
		font = "PuristaMedium";
		color = "#ffffff";
		align = "center";
		valign = "top";
		shadow = false;
		shadowColor = "#524300";
	};
};
class compo_arrow_base
{
	access = 0;
	type = 0;
	idc = -1;
	style = 48;
	shadow = 0;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
	text = "";
	font = "PuristaMedium";
	sizeEx = 0;
	lineSpacing = 0;
	fixedWidth = 0;
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65}; 
};
class compo_screen_base
{
	access = 0;
	type = 0;
	idc = -1;
	style = 48;
	shadow = 0;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
	text = "";
	font = "PuristaMedium";
	sizeEx = 0;
	lineSpacing = 0;
	fixedWidth = 0;
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};
class change_name
{
	name = "change_name";
	idd = 25251;
	movingEnable = false; 
	enableSimulation = true; 
	class Controls
	{
		//BACKGROUND
		class main_background: compo_background_base
		{
			idc = 100;
			text = "";
			x = safezoneW;
			y = safezoneH;
			w = safezoneW;
			h = safezoneH;
		};
	};
};
class mouse_cursor
{
	name = "mouse_cursor";
	idd = 25252;
	movingEnable = false; 
	enableSimulation = true; 
	class Controls
	{
		//BACKGROUND
		class main_background: compo_background_base
		{
			idc = 100;
			text = "";
			x = safezoneX;
			y = safezoneY;
			w = safezoneW;
			h = safezoneH;
			colorBackground[] = {0,0,0,0}; 
		};
	};
};
class build_tool_menu
{
	name = "build_tool_menu";
	idd = 25253;
	movingEnable = false; 
	enableSimulation = true; 
	class Controls
	{
		class but_object: compo_button_base
		{
			idc = 100;
			text = $STR_A3_build_tool_menu_objects_but;
			x = 0.35 * safezoneW + safezoneX;
			y = 0.355 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class but_composition: compo_button_base
		{
			idc = 101;
			text = $STR_A3_build_tool_menu_composition_but;
			x = 0.35 * safezoneW + safezoneX;
			y = 0.485 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class but_collections: compo_button_base
		{
			idc = 102;
			text = $STR_A3_build_tool_menu_collections_but;
			x = 0.56 * safezoneW + safezoneX;
			y = 0.355 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class but_prefabs: compo_button_base
		{
			idc = 103;
			text = $STR_A3_build_tool_menu_prefabs_but;
			x = 0.56 * safezoneW + safezoneX;
			y = 0.485 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.1 * safezoneH;
		};
	};
};
class save_compo
{
	name = "save_compo";
	idd = 25254;
	movingEnable = false; 
	enableSimulation = true; 
	class Controls
	{
		class background: compo_background_base
		{
			idc = -1;
			text = "";
			x = 0.360737 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.283684 * safezoneW;
			h = 0.198 * safezoneH;
		};
		class cat_list: compo_list_base
		{
			idc = 100;
			x = 0.371053 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.108316 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class name_field: compo_edit_base
		{
			idc = 200;
			x = 0.489684 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.144421 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ok_but: compo_button_base
		{
			idc = 300;
			x = 0.494842 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0618947 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class camcel_but: compo_button_base
		{
			idc = 301;
			x = 0.57221 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0618947 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class cat_text: compo_text_base
		{
			idc = -1;
			text = "Categories";
			x = 0.371053 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0567368 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class name_text: compo_text_base
		{
			idc = -1;
			text = "Composition name";
			x = 0.489684 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0825262 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class info_text: compo_text_base
		{
			idc = 400;
			x = 0.494842 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.139263 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
};
class object_library
{
	name = "object_library";
	idd = 25250;
	movingEnable = false; 
	enableSimulation = true; 
	class Controls
	{
		
		//BACKGROUND
		
		class main_background: compo_background_base
		{
			idc = -1;
			text = "";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
		};

		//BUTTONS - 100

		class newcat_but: compo_button_base
		{
			idc = 100;
			text = $STR_A3_collection_library_create;
			x = 0.497 * safezoneW + safezoneX;
			y = 0.175 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.036 * safezoneH;
		};
		class renameCat_but: compo_button_base
		{
			idc = 101;
			text = $STR_A3_collection_library_rename;
			x = 0.45 * safezoneW + safezoneX;
			y = 0.175 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.036 * safezoneH;
		};

		//TREES - 200

		class config_tree: compo_tree_base
		{
			idc = 200;
			x = 0.015313 * safezoneW + safezoneX;
			y = 0.1612 * safezoneH + safezoneY;
			w = (0.175313 + 0.073) * safezoneW;
			h = 0.8228 * safezoneH;
			sizeEx = 0.038;
			multiselectEnabled = 1;
		};
		
		//LISTS - 250
		
		class content_list: compo_list_base
		{
			idc = 250;
			x = 0.28 * safezoneW + safezoneX;
			y = 0.27 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.7 * safezoneH;
		};
		class categories_list: compo_list_base
		{
			idc = 251;
			x = 0.28 * safezoneW + safezoneX;
			y = 0.02 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.245 * safezoneH;
		};

		//COMBOBOXES - 300

		class sort_by_combo: compo_combo_base
		{
			idc = 300;
			x = 0.065 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.117 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.038;
			rowHeight = 0.038;
			wholeHeight = 10 * 0.038;
		};
		class group_by_combo: compo_combo_base
		{
			idc = 301;
			x = 0.065 * safezoneW + safezoneX;
			y = 0.05 * safezoneH + safezoneY;
			w = 0.117 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.038;
			rowHeight = 0.038;
			wholeHeight = 10 * 0.038;
		};
		class mod_combo: compo_combo_base
		{
			idc = 302;
			x = 0.21 * safezoneW + safezoneX;
			y = 0.12 * safezoneH + safezoneY;
			w = 0.055 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.038;
			rowHeight = 0.038;
			wholeHeight = 10 * 0.038;
		};

		//EDITS - 400

		class search_edit: compo_edit_base
		{
			idc = 400;
			text = "";
			x = 0.0730624 * safezoneW + safezoneX;
			y = 0.0952 * safezoneH + safezoneY;
			w = 0.116527 * safezoneW;
			h = 0.0242 * safezoneH;
		};
		class new_cat_edit: compo_edit_base
		{
			idc = 401;
			x = 0.45 * safezoneW + safezoneX;
			y = 0.227 * safezoneH + safezoneY;
			w = 0.093 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class model_edit: compo_edit_base
		{
			idc = 402;
			text = "";
			x = 0.687 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.0242 * safezoneH;
			canModify = 0;
		};
		class scope_edit: compo_edit_base
		{
			idc = 403;
			text = "";
			x = 0.687 * safezoneW + safezoneX;
			y = 0.0611185 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.0242 * safezoneH;
			canModify = 0;
		};
		class calssname_edit: compo_edit_base
		{
			idc = 404;
			text = "";
			x = 0.687 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.0242 * safezoneH;
			canModify = 0;
		};
		class displayname_edit: compo_edit_base
		{
			idc = 405;
			text = "";
			x = 0.687 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.0242 * safezoneH;
			canModify = 0;
		};
		class mapSize_edit: compo_edit_base
		{
			idc = 406;
			text = "";
			x = 0.687 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.0242 * safezoneH;
			canModify = 0;
		};
		class mod_edit: compo_edit_base
		{
			idc = 407;
			text = "";
			x = 0.687 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.0242 * safezoneH;
			canModify = 0;
		};
		
		//CHECKBOXES - 500

		class exclude_scope_0_check: compo_check_base
		{
			idc = 500;
			x = 0.191 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.0144 * safezoneW;
			h = 0.0264 * safezoneH;
		};
		class exclude_scope_1_check: compo_check_base
		{
			idc = 501;
			x = 0.191 * safezoneW + safezoneX;
			y = 0.054 * safezoneH + safezoneY;
			w = 0.0144 * safezoneW;
			h = 0.0264 * safezoneH;
		};
		class exclude_empty_model_check: compo_check_base
		{
			idc = 502;
			x = 0.191 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.0144 * safezoneW;
			h = 0.0264 * safezoneH;
		};

		//TEXTS - 700

		class sort_by_text: compo_text_base
		{
			idc = 700;
			text = $STR_A3_object_library_sort_by_text;
			x = 0.0235 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.039 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "right";
			};
		};
		class groupby_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_groupby_text;
			x = 0.0235 * safezoneW + safezoneX;
			y = 0.05 * safezoneH + safezoneY;
			w = 0.039 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "right";
			};
		};
		class Configentries_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_Configentries_text;
			x = 0.0173751 * safezoneW + safezoneX;
			y = 0.1326 * safezoneH + safezoneY;
			w = 0.105186 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class search_text: compo_text_base
		{
			idc = 701;
			text = $STR_A3_object_library_search_text;
			x = 0.0267095 * safezoneW + safezoneX;
			y = 0.0944518 * safezoneH + safezoneY;
			w = 0.0360938 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "right";
			};
		};
		class exclude_scope_0_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_exclude_scope_0_text;
			x = 0.207 * safezoneW + safezoneX;
			y = 0.029 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class exclude_scope_1_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_exclude_scope_1_text;
			x = 0.207 * safezoneW + safezoneX;
			y = 0.058 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class exclude_empty_model_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_exclude_empty_model_text;
			x = 0.207 * safezoneW + safezoneX;
			y = 0.084 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class model_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_model_text;
			x = 0.61 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.066 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "right";
			};
		};
		class scope_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_scope_text;
			x = 0.61 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.066 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "right";
			};
		};
		class classname_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_classname_text;
			x = 0.61 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.066 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "right";
			};
		};
		class dispalyname_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_dispalyname_text;
			x = 0.61 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.066 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "right";
			};
		};
		class mapsize_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_mapsize_text;
			x = 0.61 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.066 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "right";
			};
		};
		class mod_text2: compo_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_mod_text;
			x = 0.61 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.066 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "right";
			};
		};
		class categories_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_collection_library_lib_categories;
			x = 0.454 * safezoneW + safezoneX;
			y = 0.145 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class library_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_lib_text;
			x = 0.01875 * safezoneW + safezoneX;
			y = 0.01 * safezoneH + safezoneY;
			w = 0.16875 * safezoneW;
			h = 0.04 * safezoneH;
			Size = 0.045; 
			class Attributes 
			{
				font = "PuristaMedium";
				color = "#FFD30D";
				align = "left";
				shadow = false;
				shadowColor = "#524300";
			};
		};
	};
	class Objects
	{
		//3D PREVIEW - 600

		class preview_display: compo_3dpreview_base
		{
			idc = 600;
			x = 0.508659 * safezoneW + safezoneX;
			y = 0.2324 * safezoneH + safezoneY;
			w = 0.45375 * safezoneW;
			h = 0.693 * safezoneH;
		};

	};
};
class composition_library
{
	name = "composition_library";
	idd = 25256;
	movingEnable = false; 
	enableSimulation = true; 
	class Controls
	{
		//BACKGROUND
		class background1: compo_background_base
		{
			idc = -1;
			text = "";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0.44 * safezoneW;
			h = 1 * safezoneH;
		};
		class background2: compo_background_base
		{
			idc = -1;
			text = "";
			x = 0.44 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0.56 * safezoneW;
			h = 0.21 * safezoneH;
		};
		
		//LISTS - 100
		class listLeft_list: compo_list_base
		{
			idc = 100;
			x = 0.018 * safezoneW + safezoneX;
			y = 0.19 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.8 * safezoneH;
			canDrag = 1;
		};
		class listRight_list: compo_list_base
		{
			idc = 101;
			x = 0.23 * safezoneW + safezoneX;
			y = 0.19 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.8 * safezoneH;
			canDrag = 1;
		};
		class objects_list: compo_list_base
		{
			idc = 102;
			x = 0.63125 * safezoneW + safezoneX;
			y = 0.04 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class compositions_list: compo_list_base
		{
			idc = 103;
			x = 0.725 * safezoneW + safezoneX;
			y = 0.04 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class collections_list: compo_list_base
		{
			idc = 104;
			x = 0.81875 * safezoneW + safezoneX;
			y = 0.04 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class prefabs_list: compo_list_base
		{
			idc = 105;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.04 * safezoneH + safezoneY;
			w = 0.08125 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class categories_list: compo_list_base
		{
			idc = 106;
			x = 0.23 * safezoneW + safezoneX;
			y = 0.02 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.12 * safezoneH;
		};
		
		//COMBOBOXES - 200
		class catLeft_combo: compo_combo_base
		{
			idc = 200;
			x = 0.018 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.033 * safezoneH;
			rowHeight = 0.038;
			wholeHeight = 30 * 0.038;
		};
		class catRight_combo: compo_combo_base
		{
			idc = 201;
			x = 0.23 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.033 * safezoneH;
			rowHeight = 0.038;
			wholeHeight = 30 * 0.038;
		};
		
		//CHECKBOX - 300
		class exclude_temp_check: compo_check_base
		{
			idc = 300;
			x = 0.02125 * safezoneW + safezoneX;
			y = 0.052 * safezoneH + safezoneY;
			w = 0.0144377 * safezoneW;
			h = 0.0264 * safezoneH;
		};
		
		//EDITS - 400
		class rename_edit: compo_edit_base
		{
			idc = 400;
			text = "";
			x = 0.01875 * safezoneW + safezoneX;
			y = 0.102 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class newcat_edit: compo_edit_base
		{
			idc = 401;
			text = "";
			x = 0.401 * safezoneW + safezoneX;
			y = 0.102 * safezoneH + safezoneY;
			w = 0.093 * safezoneW;
			h = 0.03 * safezoneH;
		};
		
		//BUTTONS - 500
		class rename_but: compo_button_base
		{
			idc = 500;
			text = $STR_A3_composition_library_rename;
			x = 0.16 * safezoneW + safezoneX;
			y = 0.05 * safezoneH + safezoneY;
			w = 0.055 * safezoneW;
			h = 0.036 * safezoneH;
		};
		class newcat_but: compo_button_base
		{
			idc = 501;
			text = $STR_A3_composition_library_newcat;
			x = 0.447 * safezoneW + safezoneX;
			y = 0.05 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.036 * safezoneH;
		};
		class renameCat_but: compo_button_base
		{
			idc = 502;
			text = $STR_A3_composition_library_rename;
			x = 0.401 * safezoneW + safezoneX;
			y = 0.05 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.036 * safezoneH;
		};
		
		//TEXTS - 600
		class categories_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_collection_library_lib_categories;
			x = 0.404 * safezoneW + safezoneX;
			y = 0.02 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class size_field: compo_text_base
		{
			idc = 600;
			text = "";
			x = 0.57 * safezoneW + safezoneX;
			y = 0.02 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class objects_field: compo_text_base
		{
			idc = 601;
			text = "";
			x = 0.57 * safezoneW + safezoneX;
			y = 0.056 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class compositions_field: compo_text_base
		{
			idc = 602;
			text = "";
			x = 0.57 * safezoneW + safezoneX;
			y = 0.092 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class collections_field: compo_text_base
		{
			idc = 603;
			text = "";
			x = 0.57 * safezoneW + safezoneX;
			y = 0.128 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class prefabs_field: compo_text_base
		{
			idc = 604;
			text = "";
			x = 0.57 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class exclude_temp_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_exclude;
			x = 0.0385 * safezoneW + safezoneX;
			y = 0.0528 * safezoneH + safezoneY;
			w = 0.1215 * safezoneW;
			h = 0.03 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class size_field_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_size;
			x = 0.508 * safezoneW + safezoneX;
			y = 0.02 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "right";
			};
		};
		class objects_field_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_objects_field;
			x = 0.508 * safezoneW + safezoneX;
			y = 0.056 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "right";
			};
		};
		class compositions_field_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_compositions_field;
			x = 0.508 * safezoneW + safezoneX;
			y = 0.092 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "right";
			};
		};
		class collections_field_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_collections_field;
			x = 0.508 * safezoneW + safezoneX;
			y = 0.128 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "right";
			};
		};
		class prefabs_field_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_prefabs_field;
			x = 0.508 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "right";
			};
		};
		class objectsList_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_objects;
			x = 0.63 * safezoneW + safezoneX;
			y = 0.014 * safezoneH + safezoneY;
			w = 0.083 * safezoneW;
			h = 0.026 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "left";
			};
		};
		class compositionsList_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_compositions;
			x = 0.72 * safezoneW + safezoneX;
			y = 0.014 * safezoneH + safezoneY;
			w = 0.088 * safezoneW;
			h = 0.026 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "left";
			};
		};
		class collectionsList_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_collections;
			x = 0.815 * safezoneW + safezoneX;
			y = 0.014 * safezoneH + safezoneY;
			w = 0.083 * safezoneW;
			h = 0.026 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "left";
			};
		};
		class prefabsList_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_prefabs;
			x = 0.91 * safezoneW + safezoneX;
			y = 0.014 * safezoneH + safezoneY;
			w = 0.083 * safezoneW;
			h = 0.026 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "left";
			};
		};
		class library_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_library;
			x = 0.01875 * safezoneW + safezoneX;
			y = 0.01 * safezoneH + safezoneY;
			w = 0.16875 * safezoneW;
			h = 0.04 * safezoneH;
			Size = 0.045; 
			class Attributes 
			{
				font = "PuristaMedium";
				color = "#FFD30D";
				align = "left";
				shadow = false;
				shadowColor = "#524300";
			};
		};
	};
};
class collection_library
{
	name = "collection_library";
	idd = 25257;
	movingEnable = false; 
	enableSimulation = true; 
	class Controls
	{
		
		//BACKGROUND
		
		class main_background: compo_background_base
		{
			idc = -1;
			text = "";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
		};

		//BUTTONS - 100

		class newcat_but: compo_button_base
		{
			idc = 100;
			text = $STR_A3_collection_library_create;
			x = 0.497 * safezoneW + safezoneX;
			y = 0.05 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.036 * safezoneH;
		};
		class newcol_but: compo_button_base
		{
			idc = 101;
			text = $STR_A3_collection_library_create;
			x = 0.497 * safezoneW + safezoneX;
			y = 0.172 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.036 * safezoneH;
		};
		class renameCat_but: compo_button_base
		{
			idc = 102;
			text = $STR_A3_collection_library_rename;
			x = 0.45 * safezoneW + safezoneX;
			y = 0.05 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.036 * safezoneH;
		};
		class renameCol_but: compo_button_base
		{
			idc = 103;
			text = $STR_A3_collection_library_rename;
			x = 0.45 * safezoneW + safezoneX;
			y = 0.172 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.036 * safezoneH;
		};
		
		//TREES - 200

		class objects_tree: compo_tree_base
		{
			idc = 200;
			x = 0.015 * safezoneW + safezoneX;
			y = 0.142 * safezoneH + safezoneY;
			w = 0.248 * safezoneW;
			h = 0.823 * safezoneH;
		};
		
		//LISTS - 250
		
		class categories_list: compo_list_base
		{
			idc = 250;
			x = 0.28 * safezoneW + safezoneX;
			y = 0.02 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.12 * safezoneH;
		};
		class collections_list: compo_list_base
		{
			idc = 251;
			x = 0.28 * safezoneW + safezoneX;
			y = 0.145 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.12 * safezoneH;
		};
		class colContent_list: compo_list_base
		{
			idc = 252;
			x = 0.28 * safezoneW + safezoneX;
			y = 0.27 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.7 * safezoneH;
		};

		//COMBOBOXES - 300

		class sort_by_combo: compo_combo_base
		{
			idc = 300;
			x = 0.072 * safezoneW + safezoneX;
			y = 0.073 * safezoneH + safezoneY;
			w = 0.117 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.038;
			rowHeight = 0.038;
			wholeHeight = 4 * 0.038;
		};
		class group_by_combo: compo_combo_base
		{
			idc = 301;
			x = 0.072 * safezoneW + safezoneX;
			y = 0.04 * safezoneH + safezoneY;
			w = 0.117 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.038;
			rowHeight = 0.038;
			wholeHeight = 4 * 0.038;
		};

		//EDITS - 400

		class newcat_edit: compo_edit_base
		{
			idc = 400;
			text = "";
			x = 0.45 * safezoneW + safezoneX;
			y = 0.102 * safezoneH + safezoneY;
			w = 0.093 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class newCol_edit: compo_edit_base
		{
			idc = 406;
			text = "";
			x = 0.45 * safezoneW + safezoneX;
			y = 0.224 * safezoneH + safezoneY;
			w = 0.093 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class model_edit: compo_edit_base
		{
			idc = 401;
			text = "";
			x = 0.687 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.174 * safezoneW;
			h = 0.0242 * safezoneH;
			canModify = 0;
		};
		class calssname_edit: compo_edit_base
		{
			idc = 403;
			text = "";
			x = 0.687 * safezoneW + safezoneX;
			y = 0.0611185 * safezoneH + safezoneY;
			w = 0.174 * safezoneW;
			h = 0.0242 * safezoneH;
			canModify = 0;
		};
		class displayname_edit: compo_edit_base
		{
			idc = 404;
			text = "";
			x = 0.687 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.174 * safezoneW;
			h = 0.0242 * safezoneH;
			canModify = 0;
		};
		class mapSize_edit: compo_edit_base
		{
			idc = 405;
			text = "";
			x = 0.687 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.174 * safezoneW;
			h = 0.0242 * safezoneH;
			canModify = 0;
		};
		
		//TEXTS - 700

		class sort_by_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_sort_by_text;
			x = 0.018 * safezoneW + safezoneX;
			y = 0.068 * safezoneH + safezoneY;
			w = 0.047 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "right";
			};
		};
		class categories_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_collection_library_lib_categories;
			x = 0.454 * safezoneW + safezoneX;
			y = 0.02 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class collections_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_collection_library_lib_collections;
			x = 0.454 * safezoneW + safezoneX;
			y = 0.142 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class groupby_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_groupby_text;
			x = 0.018 * safezoneW + safezoneX;
			y = 0.0378 * safezoneH + safezoneY;
			w = 0.047 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "right";
			};
		};
		class model_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_model_text;
			x = 0.61 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.066 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "right";
			};
		};
		class classname_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_classname_text;
			x = 0.61 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.066 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "right";
			};
		};
		class dispalyname_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_dispalyname_text;
			x = 0.61 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.066 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "right";
			};
		};
		class mapsize_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_mapsize_text;
			x = 0.61 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.066 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "right";
			};
		};
		class library_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_collection_library_lib;
			x = 0.01875 * safezoneW + safezoneX;
			y = 0.01 * safezoneH + safezoneY;
			w = 0.16875 * safezoneW;
			h = 0.04 * safezoneH;
			Size = 0.045; 
			class Attributes 
			{
				font = "PuristaMedium";
				color = "#FFD30D";
				align = "left";
				shadow = false;
				shadowColor = "#524300";
			};
		};
	};
	class Objects
	{
		//3D PREVIEW - 600

		class preview_display: compo_3dpreview_base
		{
			idc = 600;
			x = 0.508659 * safezoneW + safezoneX;
			y = 0.2324 * safezoneH + safezoneY;
			w = 0.45375 * safezoneW;
			h = 0.693 * safezoneH;
		};

	};
};
class prefab_library
{
	name = "prefab_library";
	idd = 25258;
	movingEnable = false; 
	enableSimulation = true; 
	class Controls
	{
		
		//BACKGROUND
		
		class background_1: compo_background_base
		{
			idc = -1;
			text = "";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0.45 * safezoneW;
			h = 1 * safezoneH;
		};
		class background_2: compo_background_base
		{
			idc = -1;
			text = "";
			x = 0.45 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0.55 * safezoneW;
			h = 0.26 * safezoneH;
		};

		//BUTTONS - 100

		class newCat_but: compo_button_base
		{
			idc = 100;
			text = $STR_A3_collection_library_create;
			x = 0.497 * safezoneW + safezoneX;
			y = 0.05 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.036 * safezoneH;
		};
		class newPref_but: compo_button_base
		{
			idc = 101;
			text = $STR_A3_collection_library_create;
			x = 0.497 * safezoneW + safezoneX;
			y = 0.172 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.036 * safezoneH;
		};
		class renameCat_but: compo_button_base
		{
			idc = 102;
			text = $STR_A3_collection_library_rename;
			x = 0.45 * safezoneW + safezoneX;
			y = 0.05 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.036 * safezoneH;
		};
		class renamePref_but: compo_button_base
		{
			idc = 103;
			text = $STR_A3_collection_library_rename;
			x = 0.45 * safezoneW + safezoneX;
			y = 0.172 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.036 * safezoneH;
		};
		
		//TREES - 200

		class objects_tree: compo_tree_base
		{
			idc = 200;
			x = 0.015 * safezoneW + safezoneX;
			y = 0.142 * safezoneH + safezoneY;
			w = 0.248 * safezoneW;
			h = 0.823 * safezoneH;
		};
		
		//LISTS - 250
		
		class categories_list: compo_list_base
		{
			idc = 250;
			x = 0.28 * safezoneW + safezoneX;
			y = 0.02 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.12 * safezoneH;
		};
		class prefabs_list: compo_list_base
		{
			idc = 251;
			x = 0.28 * safezoneW + safezoneX;
			y = 0.145 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.12 * safezoneH;
		};
		class prefContent_list: compo_list_base
		{
			idc = 252;
			x = 0.28 * safezoneW + safezoneX;
			y = 0.27 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.7 * safezoneH;
		};
		class objects_list: compo_list_base
		{
			idc = 253;
			x = 0.63125 * safezoneW + safezoneX;
			y = 0.04 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class compositions_list: compo_list_base
		{
			idc = 254;
			x = 0.725 * safezoneW + safezoneX;
			y = 0.04 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class collections_list: compo_list_base
		{
			idc = 255;
			x = 0.81875 * safezoneW + safezoneX;
			y = 0.04 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class prefab_list: compo_list_base
		{
			idc = 256;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.04 * safezoneH + safezoneY;
			w = 0.08125 * safezoneW;
			h = 0.16 * safezoneH;
		};
		
		//COMBOBOXES - 300

		class sort_by_combo: compo_combo_base
		{
			idc = 300;
			x = 0.072 * safezoneW + safezoneX;
			y = 0.073 * safezoneH + safezoneY;
			w = 0.117 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.038;
			rowHeight = 0.038;
			wholeHeight = 4 * 0.038;
		};
		class group_by_combo: compo_combo_base
		{
			idc = 301;
			x = 0.072 * safezoneW + safezoneX;
			y = 0.04 * safezoneH + safezoneY;
			w = 0.117 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.038;
			rowHeight = 0.038;
			wholeHeight = 4 * 0.038;
		};

		//EDITS - 400

		class newCat_edit: compo_edit_base
		{
			idc = 400;
			text = "";
			x = 0.45 * safezoneW + safezoneX;
			y = 0.102 * safezoneH + safezoneY;
			w = 0.093 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class newPref_edit: compo_edit_base
		{
			idc = 401;
			text = "";
			x = 0.45 * safezoneW + safezoneX;
			y = 0.224 * safezoneH + safezoneY;
			w = 0.093 * safezoneW;
			h = 0.03 * safezoneH;
		};
		
		//FIELDS
		
		class size_field: compo_text_base
		{
			idc = 600;
			text = "";
			x = 0.57 * safezoneW + safezoneX;
			y = 0.02 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class objects_field: compo_text_base
		{
			idc = 601;
			text = "";
			x = 0.57 * safezoneW + safezoneX;
			y = 0.056 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class compositions_field: compo_text_base
		{
			idc = 602;
			text = "";
			x = 0.57 * safezoneW + safezoneX;
			y = 0.092 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class collections_field: compo_text_base
		{
			idc = 603;
			text = "";
			x = 0.57 * safezoneW + safezoneX;
			y = 0.128 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class prefabs_field: compo_text_base
		{
			idc = 604;
			text = "";
			x = 0.57 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
		};
		
		//TEXTS - 700

		class sort_by_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_sort_by_text;
			x = 0.018 * safezoneW + safezoneX;
			y = 0.068 * safezoneH + safezoneY;
			w = 0.047 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "right";
			};
		};
		class categories_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_collection_library_lib_categories;
			x = 0.454 * safezoneW + safezoneX;
			y = 0.02 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class prefabs_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_prefab_library_prefabs;
			x = 0.454 * safezoneW + safezoneX;
			y = 0.142 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class groupby_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_groupby_text;
			x = 0.018 * safezoneW + safezoneX;
			y = 0.0378 * safezoneH + safezoneY;
			w = 0.047 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "right";
			};
		};
		class library_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_prefab_library_lib;
			x = 0.01875 * safezoneW + safezoneX;
			y = 0.01 * safezoneH + safezoneY;
			w = 0.16875 * safezoneW;
			h = 0.04 * safezoneH;
			Size = 0.045; 
			class Attributes 
			{
				font = "PuristaMedium";
				color = "#FFD30D";
				align = "left";
				shadow = false;
				shadowColor = "#524300";
			};
			
		};
		class objectsList_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_objects;
			x = 0.63 * safezoneW + safezoneX;
			y = 0.014 * safezoneH + safezoneY;
			w = 0.083 * safezoneW;
			h = 0.026 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "left";
			};
		};
		class compositionsList_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_compositions;
			x = 0.72 * safezoneW + safezoneX;
			y = 0.014 * safezoneH + safezoneY;
			w = 0.088 * safezoneW;
			h = 0.026 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "left";
			};
		};
		class collectionsList_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_collections;
			x = 0.815 * safezoneW + safezoneX;
			y = 0.014 * safezoneH + safezoneY;
			w = 0.083 * safezoneW;
			h = 0.026 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "left";
			};
		};
		class prefabsList_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_prefabs;
			x = 0.91 * safezoneW + safezoneX;
			y = 0.014 * safezoneH + safezoneY;
			w = 0.083 * safezoneW;
			h = 0.026 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "left";
			};
		};
		class size_field_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_size;
			x = 0.542 * safezoneW + safezoneX;
			y = 0.02 * safezoneH + safezoneY;
			w = 0.026 * safezoneW;
			h = 0.03 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "right";
			};
		};
		class objects_field_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_objects_field;
			x = 0.542 * safezoneW + safezoneX;
			y = 0.056 * safezoneH + safezoneY;
			w = 0.026 * safezoneW;
			h = 0.03 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "right";
			};
		};
		class compositions_field_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_compositions_field;
			x = 0.542 * safezoneW + safezoneX;
			y = 0.092 * safezoneH + safezoneY;
			w = 0.026 * safezoneW;
			h = 0.03 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "right";
			};
		};
		class collections_field_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_collections_field;
			x = 0.542 * safezoneW + safezoneX;
			y = 0.128 * safezoneH + safezoneY;
			w = 0.026 * safezoneW;
			h = 0.03 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "right";
			};
		};
		class prefabs_field_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_prefabs_field;
			x = 0.542 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.026 * safezoneW;
			h = 0.03 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "right";
			};
		};
	};
};
class object_select
{
	name = "object_select";
	idd = 25259;
	movingEnable = false; 
	enableSimulation = true; 
	class controls
	{
		class main_background: compo_background_base
		{
			idc = -1;
			text = "";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
		};
		
		//TEXTS 300
		
		class cat_name_text: compo_text_base
		{
			idc = 300;
			text = "";
			x = 0.545 * safezoneW + safezoneX;
			y = 0.032 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.06 * safezoneH;
			Size = 0.07;
		};
		class cat_text: compo_text_base
		{
			idc = 301;
			text = $STR_A3_info_gui_category;
			x = 0.425 * safezoneW + safezoneX;
			y = 0.028 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.06 * safezoneH;
			Size = 0.08;
			class Attributes 
			{
				align = "right";
			};
		};
		class groupby_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_object_select_groupby;
			x = 0.025 * safezoneW + safezoneX;
			y = 0.028 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.06 * safezoneH;
			Size = 0.08;
			class Attributes 
			{
				align = "left";
			};
		};
		class search_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_object_select_search;
			x = 0.175 * safezoneW + safezoneX;
			y = 0.028 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.06 * safezoneH;
			Size = 0.08;
			class Attributes 
			{
				align = "left";
			};
		};
		
		//COMBO 350
		
		class groupby_combo: compo_combo_base
		{
			idc = 350;
			x = 0.025 * safezoneW + safezoneX;
			y = 0.08 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.04 * safezoneH;
			sizeEx = 0.041;
		};
		
		//EDITS 360
		
		class search_edit: compo_edit_base
		{
			idc = 360;
			x = 0.175 * safezoneW + safezoneX;
			y = 0.08 * safezoneH + safezoneY;
			w = 0.225 * safezoneW;
			h = 0.04 * safezoneH;
			sizeEx = 0.041;
		};
		
		//SCREENS 200

		class screen_01: compo_screen_base
		{
			idc = 201;
			text = "";
			x = 0.0125 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_02: compo_screen_base
		{
			idc = 202;
			text = "";
			x = 0.1375 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_03: compo_screen_base
		{
			idc = 203;
			text = "";
			x = 0.2625 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_04: compo_screen_base
		{
			idc = 204;
			text = "";
			x = 0.3875 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_05: compo_screen_base
		{
			idc = 205;
			text = "";
			x = 0.5125 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_06: compo_screen_base
		{
			idc = 206;
			text = "";
			x = 0.6375 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_07: compo_screen_base
		{
			idc = 207;
			x = 0.7625 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_08: compo_screen_base
		{
			idc = 208;
			x = 0.8875 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_09: compo_screen_base
		{
			idc = 209;
			x = 0.0125 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_10: compo_screen_base
		{
			idc = 210;
			x = 0.1375 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_11: compo_screen_base
		{
			idc = 211;
			x = 0.2625 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_12: compo_screen_base
		{
			idc = 212;
			x = 0.3875 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_13: compo_screen_base
		{
			idc = 213;
			x = 0.5125 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_14: compo_screen_base
		{
			idc = 214;
			x = 0.6375 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_15: compo_screen_base
		{
			idc = 215;
			x = 0.7625 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_16: compo_screen_base
		{
			idc = 216;
			x = 0.8875 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_17: compo_screen_base
		{
			idc = 217;
			x = 0.0125 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_18: compo_screen_base
		{
			idc = 218;
			x = 0.1375 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_19: compo_screen_base
		{
			idc = 219;
			x = 0.2625 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_20: compo_screen_base
		{
			idc = 220;
			x = 0.3875 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_21: compo_screen_base
		{
			idc = 221;
			x = 0.5125 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_22: compo_screen_base
		{
			idc = 222;
			x = 0.6375 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_23: compo_screen_base
		{
			idc = 223;
			x = 0.7625 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_24: compo_screen_base
		{
			idc = 224;
			x = 0.8875 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_25: compo_screen_base
		{
			idc = 225;
			x = 0.0125 * safezoneW + safezoneX;
			y = 0.82 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_26: compo_screen_base
		{
			idc = 226;
			x = 0.1375 * safezoneW + safezoneX;
			y = 0.82 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_27: compo_screen_base
		{
			idc = 227;
			x = 0.2625 * safezoneW + safezoneX;
			y = 0.82 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_28: compo_screen_base
		{
			idc = 228;
			x = 0.3875 * safezoneW + safezoneX;
			y = 0.82 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_29: compo_screen_base
		{
			idc = 229;
			x = 0.5125 * safezoneW + safezoneX;
			y = 0.82 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_30: compo_screen_base
		{
			idc = 230;
			x = 0.6375 * safezoneW + safezoneX;
			y = 0.82 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_31: compo_screen_base
		{
			idc = 231;
			x = 0.7625 * safezoneW + safezoneX;
			y = 0.82 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_32: compo_screen_base
		{
			idc = 232;
			x = 0.8875 * safezoneW + safezoneX;
			y = 0.82 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		
		//SCREEN TEXTS 400
		class screen_01_text: screen_text_base
		{
			idc = 401;
			x = 0.0125 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class screen_02_text: screen_text_base
		{
			idc = 402;
			x = 0.1375 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class screen_03_text: screen_text_base
		{
			idc = 403;
			x = 0.2625 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class screen_04_text: screen_text_base
		{
			idc = 404;
			x = 0.3875 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class screen_05_text: screen_text_base
		{
			idc = 405;
			x = 0.5125 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_06_text: screen_text_base
		{
			idc = 406;
			x = 0.6375 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_07_text: screen_text_base
		{
			idc = 407;
			x = 0.7625 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_08_text: screen_text_base
		{
			idc = 408;
			x = 0.8875 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_09_text: screen_text_base
		{
			idc = 409;
			x = 0.0125 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_10_text: screen_text_base
		{
			idc = 410;
			x = 0.1375 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_11_text: screen_text_base
		{
			idc = 411;
			x = 0.2625 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_12_text: screen_text_base
		{
			idc = 412;
			x = 0.3875 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_13_text: screen_text_base
		{
			idc = 413;
			x = 0.5125 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_14_text: screen_text_base
		{
			idc = 414;
			x = 0.6375 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_15_text: screen_text_base
		{
			idc = 415;
			x = 0.7625 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_16_text: screen_text_base
		{
			idc = 416;
			x = 0.8875 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_17_text: screen_text_base
		{
			idc = 417;
			x = 0.0125 * safezoneW + safezoneX;
			y = 0.74 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_18_text: screen_text_base
		{
			idc = 418;
			x = 0.1375 * safezoneW + safezoneX;
			y = 0.74 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_19_text: screen_text_base
		{
			idc = 419;
			x = 0.2625 * safezoneW + safezoneX;
			y = 0.74 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_20_text: screen_text_base
		{
			idc = 420;
			x = 0.3875 * safezoneW + safezoneX;
			y = 0.74 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_21_text: screen_text_base
		{
			idc = 421;
			x = 0.5125 * safezoneW + safezoneX;
			y = 0.74 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_22_text: screen_text_base
		{
			idc = 422;
			x = 0.6375 * safezoneW + safezoneX;
			y = 0.74 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_23_text: screen_text_base
		{
			idc = 423;
			x = 0.7625 * safezoneW + safezoneX;
			y = 0.74 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_24_text: screen_text_base
		{
			idc = 424;
			x = 0.8875 * safezoneW + safezoneX;
			y = 0.74 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_25_text: screen_text_base
		{
			idc = 425;
			x = 0.0125 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_26_text: screen_text_base
		{
			idc = 426;
			x = 0.1375 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_27_text: screen_text_base
		{
			idc = 427;
			x = 0.2625 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_28_text: screen_text_base
		{
			idc = 428;
			x = 0.3875 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_29_text: screen_text_base
		{
			idc = 429;
			x = 0.5125 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_30_text: screen_text_base
		{
			idc = 430;
			x = 0.6375 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_31_text: screen_text_base
		{
			idc = 431;
			x = 0.7625 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_32_text: screen_text_base
		{
			idc = 432;
			x = 0.8875 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
	};
};
class export_menu
{
	name = "export_menu";
	idd = 25260;
	movingEnable = false; 
	enableSimulation = true; 
	class controls
	{
		class main_background: compo_background_base
		{
			idc = -1;
			text = "";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.19 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.59 * safezoneH;
		};
		
		//LISTS 100
		
		class option_1_list: compo_list_base
		{
			idc = 100;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.23 * safezoneH;
		};
		class option_2_list: compo_list_base
		{
			idc = 101;
			x = 0.4375 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.23 * safezoneH;
		};
		class option_3_list: compo_list_base
		{
			idc = 102;
			style = 32;
			x = 0.575 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.23 * safezoneH;
		};
		
		//BUTTONS 200
		
		class ok_but: compo_button_base
		{
			idc = 200;
			text = $STR_A3_export_tool_export_but;
			x = 0.51875 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class cancel_but: compo_button_base
		{
			idc = 201;
			text = $STR_A3_export_tool_close_but;
			x = 0.6125 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.05 * safezoneH;
		};
		
		//CHECK 300
		
		class toClip_check: compo_check_base
		{
			idc = 300;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.53 * safezoneH + safezoneY;
			w = 0.0145 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class toDisp_check: compo_check_base
		{
			idc = 301;
			x = 0.3875 * safezoneW + safezoneX;
			y = 0.53 * safezoneH + safezoneY;
			w = 0.0145 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class include_temp_check: compo_check_base
		{
			idc = 302;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.56 * safezoneH + safezoneY;
			w = 0.0145 * safezoneW;
			h = 0.03 * safezoneH;
		};
		
		//COMBO 400
		
		class format_combo: compo_combo_base
		{
			idc = 400;
			x = 0.60625 * safezoneW + safezoneX;
			y = 0.53 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.03 * safezoneH;
		};
		
		//EDITS 500
		
		class drop_edit: compo_edit_base
		{
			idc = 500;
			x = 0 * safezoneW + safezoneX;
			y = 0.78 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 0.2 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.3};
			canModify = 0;
			style = 16;
			sizeEx = 0.003;
		};
		
		//TEXTS 600
		
		class decription_text: compo_text_base
		{
			idc = 600;
			text = "";
			x = 0.3 * safezoneW + safezoneX;
			y = 0.63 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.08 * safezoneH;
			Size = 0.041;
		};
		class include_temp_text: compo_text_base
		{
			idc = 601;
			text = $STR_A3_export_tool_include_temp_text;
			x = 0.31875 * safezoneW + safezoneX;
			y = 0.565 * safezoneH + safezoneY;
			w = 0.08125 * safezoneW;
			h = 0.03 * safezoneH;
			class Attributes 
			{
				align = "left";
				valign = "middle";
			};
		};
		class format_text: compo_text_base
		{
			idc = 602;
			text = $STR_A3_export_tool_export_format;
			x = 0.51875 * safezoneW + safezoneX;
			y = 0.535 * safezoneH + safezoneY;
			w = 0.08125 * safezoneW;
			h = 0.03 * safezoneH;
			class Attributes 
			{
				align = "right";
				valign = "middle";
			};
		};
		class Export_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_export_tool_export;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.2 * safezoneH + safezoneY;
			w = 0.15625 * safezoneW;
			h = 0.04 * safezoneH;
			Size = 0.045; 
			class Attributes 
			{
				font = "PuristaMedium";
				color = "#FFD30D";
				align = "left";
				shadow = false;
				shadowColor = "#524300";
			};
		};
		class toClip_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_export_tool_toclip;
			x = 0.31875 * safezoneW + safezoneX;
			y = 0.535 * safezoneH + safezoneY;
			w = 0.06875 * safezoneW;
			h = 0.03 * safezoneH;
			class Attributes 
			{
				align = "left";
				valign = "middle";
			};
		};
		class toDisp_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_export_tool_todisplay;
			x = 0.40625 * safezoneW + safezoneX;
			y = 0.535 * safezoneH + safezoneY;
			w = 0.06875 * safezoneW;
			h = 0.03 * safezoneH;
			class Attributes 
			{
				align = "left";
				valign = "middle";
			};
		};
		class specify_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_export_tool_specify;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.39375 * safezoneW;
			h = 0.03 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
	};
};
class import_menu
{
	name = "import_menu";
	idd = 25261;
	movingEnable = false; 
	enableSimulation = true; 
	class controls
	{
		//BACKGROUND
		class background: compo_background_base
		{
			idc = -1;
			text = "";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.19 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.59 * safezoneH;
		};
		
		//BUTTONS 100
		class ok_but: compo_button_base
		{
			idc = 100;
			text = $STR_A3_import_tool_import_but;
			x = 0.51875 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class cancel_but: compo_button_base
		{
			idc = 101;
			text = $STR_A3_export_tool_close_but;
			x = 0.6125 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class load_but: compo_button_base
		{
			idc = 102;
			text = $STR_A3_import_tool_load_but;
			x = 0.642 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.05625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		
		//CHECKBOXES 200
		class fromClip_check: compo_check_base
		{
			idc = 200;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.0145 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class fromDisp_check: compo_check_base
		{
			idc = 201;
			x = 0.39375 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.0145 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class fromFile_check: compo_check_base
		{
			idc = 202;
			x = 0.4875 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.0145 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class skip_check: compo_check_base
		{
			idc = 203;
			x = 0.43125 * safezoneW + safezoneX;
			y = 0.35 * safezoneH + safezoneY;
			w = 0.0145 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class rename_check: compo_check_base
		{
			idc = 204;
			x = 0.37 * safezoneW + safezoneX;
			y = 0.35 * safezoneH + safezoneY;
			w = 0.0145 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class overwrite_check: compo_check_base
		{
			idc = 205;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.35 * safezoneH + safezoneY;
			w = 0.0145 * safezoneW;
			h = 0.03 * safezoneH;
		};
		
		//EDITSBOXES 300
		class drop_edit: compo_edit_base
		{
			idc = 300;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.284 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class description_edit: compo_edit_base
		{
			idc = 301;
			x = 0.46875 * safezoneW + safezoneX;
			y = 0.52 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.1 * safezoneH;
			canModify = 0;
			style = 16;
		};
		class date_edit: compo_edit_base
		{
			idc = 302;
			x = 0.46875 * safezoneW + safezoneX;
			y = 0.44 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.03 * safezoneH;
			canModify = 0;
		};
		class type_edit: compo_edit_base
		{
			idc = 303;
			x = 0.46875 * safezoneW + safezoneX;
			y = 0.48 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.03 * safezoneH;
			canModify = 0;
		};
		class author_edit: compo_edit_base
		{
			idc = 304;
			x = 0.46875 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.03 * safezoneH;
			canModify = 0;
		};
		
		//LISTBOXES 400
		class importObjects_list: compo_list_base
		{
			idc = 400;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.09375 * safezoneW;
			h = 0.22 * safezoneH;
		};
		
		//TEXTS 500
		class hint_text: compo_text_base
		{
			idc = 500;
			text = "";
			x = 0.3 * safezoneW + safezoneX;
			y = 0.63 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.08 * safezoneH;
			Size = 0.041;
		};
		class overwrite_text: compo_text_base
		{
			idc = 501;
			text = $STR_A3_import_tool_overwrite_text;
			x = 0.31875 * safezoneW + safezoneX;
			y = 0.355 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.03 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class add_text: compo_text_base
		{
			idc = 502;
			text = $STR_A3_import_tool_add_text;
			x = 0.38875 * safezoneW + safezoneX;
			y = 0.355 * safezoneH + safezoneY;
			w = 0.0375 * safezoneW;
			h = 0.03 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class skip_text: compo_text_base
		{
			idc = 503;
			text = $STR_A3_import_tool_skip_text;
			x = 0.45 * safezoneW + safezoneX;
			y = 0.355 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.03 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class collision_text: compo_text_base
		{
			idc = 504;
			text = $STR_A3_import_tool_collision_text;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.33 * safezoneH + safezoneY;
			w = 0.175 * safezoneW;
			h = 0.02 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class author_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_import_tool_author_text;
			x = 0.40625 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.05625 * safezoneW;
			h = 0.03 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class date_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_import_tool_date_text;
			x = 0.40625 * safezoneW + safezoneX;
			y = 0.44 * safezoneH + safezoneY;
			w = 0.05625 * safezoneW;
			h = 0.03 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class type_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_import_tool_type_text;
			x = 0.40625 * safezoneW + safezoneX;
			y = 0.48 * safezoneH + safezoneY;
			w = 0.05625 * safezoneW;
			h = 0.03 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class fromDisp_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_import_tool_fromDisp_text;
			x = 0.4125 * safezoneW + safezoneX;
			y = 0.255 * safezoneH + safezoneY;
			w = 0.06875 * safezoneW;
			h = 0.03 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class description_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_import_tool_description_text;
			x = 0.40625 * safezoneW + safezoneX;
			y = 0.52 * safezoneH + safezoneY;
			w = 0.05625 * safezoneW;
			h = 0.03 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class fromClip_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_import_tool_fromClip_text;
			x = 0.31875 * safezoneW + safezoneX;
			y = 0.255 * safezoneH + safezoneY;
			w = 0.06875 * safezoneW;
			h = 0.03 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class fromFile_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_import_tool_fromfile_text;
			x = 0.50625 * safezoneW + safezoneX;
			y = 0.255 * safezoneH + safezoneY;
			w = 0.06875 * safezoneW;
			h = 0.03 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class Import_text: compo_text_base
		{
			idc = -1;
			text = $STR_A3_import_tool_import_text;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.2 * safezoneH + safezoneY;
			w = 0.15625 * safezoneW;
			h = 0.04 * safezoneH;
			Size = 0.045; 
			class Attributes 
			{
				font = "PuristaMedium";
				color = "#FFD30D";
				align = "left";
				shadow = false;
				shadowColor = "#524300";
			};
		};
	};
};
class RscTitles
{
	class compo_background_base
	{
		access = 0; 
		idc = -1; 
		x = 0; 	y = 0; 	w = 0; 	h = 0; 
		type = 0; 
		style = 0; 
		colorText[] = { 0, 0, 0, 0 }; 
		text = ""; 
		shadow = 0; 
		font = "TahomaB"; 
		sizeEx = 0.03; 
		colorBackground[] = {0,0,0,0.4}; 
	};
	class compo_text_base
	{
		access = 0; 
		type = 13; 
		x = 0; y = 0; w = 0; h = 0; 
		colorBackground[] = { 0, 0, 0, 0 };
		colorText[] = {1, 1, 1, 1.0};
		color = "#FFD30D";
		text = ""; 
		fixedWidth = 0; 
		style = 0;
		shadow = 1; 
		Size = 0.034; 
		class Attributes 
		{
			font = "PuristaMedium";
			color = "#FFD30D";
			align = "left";
			shadow = false;
			shadowColor = "#524300";
		};
	};
	class compo_screen_base1
	{
		access = 0;
		type = 0;
		idc = -1;
		style = 48;
		shadow = 0;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,0};
		text = "";
		font = "PuristaMedium";
		sizeEx = 0;
		lineSpacing = 0;
		fixedWidth = 0;
		x = 0;
		y = 0;
		w = 0.2;
		h = 0.15;
		tooltipColorText[] = {1,1,1,1};
		tooltipColorBox[] = {1,1,1,1};
		tooltipColorShade[] = {0,0,0,0.65};
	};

	class info_GUI
	{
		name = "info_GUI";
		idd = 25255;
		fadein=0;
		duration = 999999;
		fadeout=0;
		movingEnable = 0;
		onLoad="uiNamespace setVariable ['ct_var_GUI_infoHandle',_this select 0]";
		objects[]={};
		class ControlsBackground
		{
			class background: compo_background_base
			{
				idc = -1;
				text = "";
				x = 0 * safezoneW + safezoneX;
				y = 0.82 * safezoneH + safezoneY;
				w = 0.25 * safezoneW;
				h = 0.18 * safezoneH;
			};
			class text_field: compo_text_base
			{
				idc = 100;
				text = "";
				x = 0.001 * safezoneW + safezoneX;
				y = 0.821 * safezoneH + safezoneY;
				w = 0.25 * safezoneW;
				h = 0.18 * safezoneH;
			};
		};
	};

	class controls_GUI
	{
		name = "controls_GUI";
		idd = 25262;
		fadein=0;
		duration = 999999;
		fadeout=0;
		movingEnable = 0;
		onLoad="uiNamespace setVariable ['ct_var_GUI_controlsHandle',_this select 0]";
		objects[]={};
		class ControlsBackground
		{
			class background: compo_background_base
			{
				idc = 101;
				text = "";
				x = 1 * safezoneW + safezoneX;
				y = 1 * safezoneH + safezoneY;
				w = 0 * safezoneW;
				h = 0 * safezoneH;
			};
			class text_field: compo_text_base
			{
				idc = 100;
				text = "";
				x = 0.851 * safezoneW + safezoneX;
				y = 0.6 * safezoneH + safezoneY;
				w = 0.15 * safezoneW;
				h = 0.4 * safezoneH;
			};
		};
	};

	class message_GUI
	{
		name = "message_GUI";
		idd = 25263;
		fadein=0;
		duration = 3;
		fadeout=1;
		movingEnable = 0;
		onLoad="uiNamespace setVariable ['ct_var_GUI_messageHandle',_this select 0]";
		objects[]={};
		class ControlsBackground
		{
			class background: compo_background_base
			{
				idc = -1;
				text = "";
				x = 0.25 * safezoneW + safezoneX;
				y = 0.125 * safezoneH + safezoneY;
				w = 0.5 * safezoneW;
				h = 0.08 * safezoneH;
			};
			class text_field: compo_text_base
			{
				idc = 100;
				text = "";
				x = 0.25 * safezoneW + safezoneX;
				y = 0.125 * safezoneH + safezoneY;
				w = 0.5 * safezoneW;
				h = 0.08 * safezoneH;
			};
		};
	};
};


#include "Configs\CfgFunctions.hpp"
#include "Configs\Display3DEN.hpp"

