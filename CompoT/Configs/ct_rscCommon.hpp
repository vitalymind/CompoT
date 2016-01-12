class ct_background_base
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
class ct_button_base
{
	idc = -1;
	access = 0; 
	type = 1; 
	text = ""; 
	x = 0; y = 0; w = 0; h = 0; 
	colorText[] = { 0.8784, 0.8471, 0.651, 1 }; 
	colorDisabled[] = { 1, 0.537, 0, 0.5 }; 
	colorBackgroundDisabled[] = { 0.7, 0.7, 0.7, 1 }; 
	colorBackground[] = { 1, 0.537, 0, 0.5 }; 
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
class ct_tree_base 
{
	access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
	idc = -1; // Control identification (without it, the control won't be displayed)
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
class ct_list_base
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
class ct_combo_base
{
	idc = -1;
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
class ct_edit_base
{
	idc = -1;
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
class ct_check_base
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
class ct_3dpreview_base
{
	//Thanks KK!
	idc = -1;
	type = 82;
	model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
	scale = 1;
	direction[] = {0, -0.35, -0.65};
	up[] = {0, 0.65, -0.35}; 
	x = 0.8;
	y = 0.85;
	z = 5;
	xBack = 0.8;
	yBack = 0.85;
	zBack = 5;
	inBack = 1;
	enableZoom = 0;
	zoomDuration = 0.001;
};
class ct_text_base
{
	idc = -1;
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
class ct_screenText_base
{
	idc = -1;
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
class ct_screen_base
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
class ct_controlGroupNoScrollBar_base
{
	access = 0;
	idc = -1;
	default = 0;
	type = 15;
	style = 16;
	show = 1;
	fade = 0;
	blinkingPeriod = 0;
	deletable = 0;
	x = 0;
	y = 0;
	w = 0;
	h = 0;
	tooltip = "";
	tooltipMaxWidth = 0.5;
	tooltipColorShade[] = {0, 0, 0, 1};
	tooltipColorText[] = {1, 1, 1, 1};
	tooltipColorBox[] = {0, 0, 0, 0};
	
	class ScrollBar {
		width = 0;
		height = 0;
		scrollSpeed = 0.06;
		arrowEmpty = "\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa";
		arrowFull = "\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa";
		border = "\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa";
		thumb = "\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa";
		color[] = {1, 1, 1, 1};
	};
	
	class VScrollBar : ScrollBar {
		autoScrollEnabled = 0;
		autoScrollDelay = 1;
		autoScrollRewind = 1;
		autoScrollSpeed = 1;
	};
	
	class HScrollBar : ScrollBar {};
};
class ct_slider 
{
	idc = -1;
	type = 43;
	style = 1024;
	color[] = {1, 0.537, 0, 0.6};
	colorActive[] = {1, 0.537, 0, 1};
	colorDisabled[] = {1, 1, 1, 0.25};
	sliderRange[] = {0, 1};
	sliderPosition = 1;
	lineSize = 0.1;
	arrowEmpty = "\a3\3DEN\Data\Controls\CtrlXSlider\arrowEmpty_ca.paa";
	arrowFull = "\a3\3DEN\Data\Controls\CtrlXSlider\arrowFull_ca.paa";
	border = "\a3\3DEN\Data\Controls\CtrlXSlider\border_ca.paa";
	thumb = "\a3\3DEN\Data\Controls\CtrlXSlider\thumb_ca.paa";
	
	class Title {
		idc = -1;
		colorBase[] = {1, 1, 1, 1};
		colorActive[] = {0,0,0,1};
	};
	
	class Value {
		idc = -1;
		format = "%.f";
		type = "SPTPlain";
		colorBase[] = {1, 1, 1, 1};
		colorActive[] = {0,0,0,1};
	};
};
