class ct_export_menu
{
	name = "ct_export_menu";
	idd = 25260;
	movingEnable = false; 
	enableSimulation = true; 
	class controls
	{
		class main_background: ct_background_base
		{
			idc = -1;
			text = "";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.19 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.59 * safezoneH;
		};
		
		//LISTS 100
		
		class option_1_list: ct_list_base
		{
			idc = 100;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.23 * safezoneH;
		};
		class option_2_list: ct_list_base
		{
			idc = 101;
			x = 0.4375 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.23 * safezoneH;
		};
		class option_3_list: ct_list_base
		{
			idc = 102;
			style = 32;
			x = 0.575 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.23 * safezoneH;
		};
		
		//BUTTONS 200
		
		class ok_but: ct_button_base
		{
			idc = 200;
			text = $STR_A3_export_tool_export_but;
			x = 0.51875 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class cancel_but: ct_button_base
		{
			idc = 201;
			text = $STR_A3_export_tool_close_but;
			x = 0.6125 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.05 * safezoneH;
		};
		
		//CHECK 300
		
		class toClip_check: ct_check_base
		{
			idc = 300;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.53 * safezoneH + safezoneY;
			w = 0.0145 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class toDisp_check: ct_check_base
		{
			idc = 301;
			x = 0.3875 * safezoneW + safezoneX;
			y = 0.53 * safezoneH + safezoneY;
			w = 0.0145 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class include_temp_check: ct_check_base
		{
			idc = 302;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.56 * safezoneH + safezoneY;
			w = 0.0145 * safezoneW;
			h = 0.03 * safezoneH;
		};
		
		//COMBO 400
		
		class format_combo: ct_combo_base
		{
			idc = 400;
			x = 0.60625 * safezoneW + safezoneX;
			y = 0.53 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.03 * safezoneH;
		};
		
		//EDITS 500
		
		class drop_edit: ct_edit_base
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
		
		class decription_text: ct_text_base
		{
			idc = 600;
			text = "";
			x = 0.3 * safezoneW + safezoneX;
			y = 0.63 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.08 * safezoneH;
			Size = 0.041;
		};
		class include_temp_text: ct_text_base
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
		class format_text: ct_text_base
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
		class Export_text: ct_text_base
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
		class toClip_text: ct_text_base
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
		class toDisp_text: ct_text_base
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
		class specify_text: ct_text_base
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
