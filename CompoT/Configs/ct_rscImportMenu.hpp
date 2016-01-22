class ct_import_menu
{
	name = "ct_import_menu";
	idd = 25261;
	movingEnable = false; 
	enableSimulation = true; 
	class controls
	{
		//BACKGROUND
		class background: ct_background_base
		{
			idc = -1;
			text = "";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.19 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.59 * safezoneH;
		};
		
		//BUTTONS 100
		class ok_but: ct_button_base
		{
			idc = 100;
			text = $STR_A3_import_tool_import_but;
			x = 0.51875 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class cancel_but: ct_button_base
		{
			idc = 101;
			text = $STR_A3_export_tool_close_but;
			x = 0.6125 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class load_but: ct_button_base
		{
			idc = 102;
			text = $STR_A3_import_tool_load_but;
			x = 0.642 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.05625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		
		//CHECKBOXES 200
		class fromClip_check: ct_check_base
		{
			idc = 200;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.0145 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class fromDisp_check: ct_check_base
		{
			idc = 201;
			x = 0.39375 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.0145 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class fromFile_check: ct_check_base
		{
			idc = 202;
			x = 0.4875 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.0145 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class skip_check: ct_check_base
		{
			idc = 203;
			x = 0.43125 * safezoneW + safezoneX;
			y = 0.35 * safezoneH + safezoneY;
			w = 0.0145 * safezoneW;
			h = 0.03 * safezoneH;
			tooltip = $STR_A3_import_tool_skip_tooltip;
		};
		class rename_check: ct_check_base
		{
			idc = 204;
			x = 0.37 * safezoneW + safezoneX;
			y = 0.35 * safezoneH + safezoneY;
			w = 0.0145 * safezoneW;
			h = 0.03 * safezoneH;
			tooltip = $STR_A3_import_tool_add_tooltip;
		};
		class overwrite_check: ct_check_base
		{
			idc = 205;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.35 * safezoneH + safezoneY;
			w = 0.0145 * safezoneW;
			h = 0.03 * safezoneH;
			tooltip = $STR_A3_import_tool_overwrite_tooltip;
		};
		
		//EDITSBOXES 300
		class drop_edit: ct_edit_base
		{
			idc = 300;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.284 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class description_edit: ct_edit_base
		{
			idc = 301;
			x = 0.46875 * safezoneW + safezoneX;
			y = 0.52 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.1 * safezoneH;
			canModify = 0;
			style = 16;
		};
		class date_edit: ct_edit_base
		{
			idc = 302;
			x = 0.46875 * safezoneW + safezoneX;
			y = 0.44 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.03 * safezoneH;
			canModify = 0;
		};
		class type_edit: ct_edit_base
		{
			idc = 303;
			x = 0.46875 * safezoneW + safezoneX;
			y = 0.48 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.03 * safezoneH;
			canModify = 0;
		};
		class author_edit: ct_edit_base
		{
			idc = 304;
			x = 0.46875 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.03 * safezoneH;
			canModify = 0;
		};
		class destination_edit: ct_edit_base
		{
			idc = 305;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.35 * safezoneH + safezoneY;
			w = 0.11875 * safezoneW;
			h = 0.03 * safezoneH;
			canModify = 1;
		};
		
		//LISTBOXES 400
		class importObjects_list: ct_list_base
		{
			idc = 400;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.09375 * safezoneW;
			h = 0.22 * safezoneH;
		};
		
		//TEXTS 500
		class hint_text: ct_text_base
		{
			idc = 500;
			text = "";
			x = 0.3 * safezoneW + safezoneX;
			y = 0.63 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.08 * safezoneH;
			Size = 0.041;
		};
		class overwrite_text: ct_text_base
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
		class add_text: ct_text_base
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
		class skip_text: ct_text_base
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
		class collision_text: ct_text_base
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
		class destination_text: ct_text_base
		{
			idc = 505;
			text = $STR_A3_import_tool_destination_text;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.33 * safezoneH + safezoneY;
			w = 0.175 * safezoneW;
			h = 0.02 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class author_text: ct_text_base
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
		class date_text: ct_text_base
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
		class type_text: ct_text_base
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
		class fromDisp_text: ct_text_base
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
		class description_text: ct_text_base
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
		class fromClip_text: ct_text_base
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
		class fromFile_text: ct_text_base
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
		class Import_text: ct_text_base
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
