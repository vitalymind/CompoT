class RscTitles
{
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
	class ct_text_base
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
	class ct_screen_base1
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

	class ct_info_GUI
	{
		name = "ct_info_GUI";
		idd = 25255;
		fadein=0;
		duration = 999999;
		fadeout=0;
		movingEnable = 0;
		onLoad="uiNamespace setVariable ['ct_var_GUI_infoHandle',_this select 0]";
		objects[]={};
		class ControlsBackground
		{
			class background: ct_background_base
			{
				idc = -1;
				text = "";
				x = 0 * safezoneW + safezoneX;
				y = 0.82 * safezoneH + safezoneY;
				w = 0.20 * safezoneW;
				//w = 0.25 * safezoneW;
				h = 0.18 * safezoneH;
			};
			class text_field: ct_text_base
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

	class ct_controls_GUI
	{
		name = "ct_controls_GUI";
		idd = 25262;
		fadein=0;
		duration = 999999;
		fadeout=0;
		movingEnable = 0;
		onLoad="uiNamespace setVariable ['ct_var_GUI_controlsHandle',_this select 0]";
		objects[]={};
		class ControlsBackground
		{
			class background: ct_background_base
			{
				idc = 101;
				text = "";
				x = 1 * safezoneW + safezoneX;
				y = 1 * safezoneH + safezoneY;
				w = 0 * safezoneW;
				h = 0 * safezoneH;
			};
			class text_field: ct_text_base
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

	class ct_message_GUI
	{
		name = "ct_message_GUI";
		idd = 25263;
		fadein=0;
		duration = 3;
		fadeout=1;
		movingEnable = 0;
		onLoad="uiNamespace setVariable ['ct_var_GUI_messageHandle',_this select 0]";
		objects[]={};
		class ControlsBackground
		{
			class background: ct_background_base
			{
				idc = -1;
				text = "";
				x = 0.25 * safezoneW + safezoneX;
				y = 0.125 * safezoneH + safezoneY;
				w = 0.5 * safezoneW;
				h = 0.08 * safezoneH;
			};
			class text_field: ct_text_base
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