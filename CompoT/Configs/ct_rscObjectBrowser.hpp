class ct_object_select
{
	name = "ct_object_select";
	idd = 25259;
	movingEnable = false; 
	enableSimulation = true; 
	class controls
	{
		class main_background: ct_background_base
		{
			idc = -1;
			text = "";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
		};
		
		//TEXTS 300
		class cat_text: ct_text_base 
		{
			idc = 301;
			text = $STR_A3_info_gui_category;
			x = 0.25 * safezoneW + safezoneX;
			y = 0.05 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.04 * safezoneH;
			Size = 0.08;
		};
		class groupby_text: ct_text_base 
		{
			idc = -1;
			text = $STR_A3_object_select_groupby;
			x = 0.02 * safezoneW + safezoneX;
			y = 0.05 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.04 * safezoneH;
			Size = 0.08;
		};
		class search_text: ct_text_base 
		{
			idc = -1;
			text = $STR_A3_object_select_search;
			x = 0.48 * safezoneW + safezoneX;
			y = 0.05 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.04 * safezoneH;
			Size = 0.08;
		};
		
		//COMBO 350
		
		class groupby_combo: ct_combo_base 
		{
			idc = 350;
			x = 0.02 * safezoneW + safezoneX;
			y = 0.1 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.04 * safezoneH;
			sizeEx = 0.041;
		};
		class cat_name_combo: ct_combo_base 
		{
			idc = 351;
			text = "";
			x = 0.25 * safezoneW + safezoneX;
			y = 0.1 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.04 * safezoneH;
			Size = 0.07;
			wholeHeight = 1.3;
		};
		
		//EDITS 360
		
		class search_edit: ct_edit_base 
		{
			idc = 360;
			x = 0.48 * safezoneW + safezoneX;
			y = 0.1 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.04 * safezoneH;
			sizeEx = 0.041;
		};
		
		//SCREENS 200

		class screen_01: ct_screen_base
		{
			idc = 201;
			text = "";
			x = 0.0125 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_02: ct_screen_base
		{
			idc = 202;
			text = "";
			x = 0.1375 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_03: ct_screen_base
		{
			idc = 203;
			text = "";
			x = 0.2625 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_04: ct_screen_base
		{
			idc = 204;
			text = "";
			x = 0.3875 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_05: ct_screen_base
		{
			idc = 205;
			text = "";
			x = 0.5125 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_06: ct_screen_base
		{
			idc = 206;
			text = "";
			x = 0.6375 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_07: ct_screen_base
		{
			idc = 207;
			x = 0.7625 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_08: ct_screen_base
		{
			idc = 208;
			x = 0.8875 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_09: ct_screen_base
		{
			idc = 209;
			x = 0.0125 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_10: ct_screen_base
		{
			idc = 210;
			x = 0.1375 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_11: ct_screen_base
		{
			idc = 211;
			x = 0.2625 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_12: ct_screen_base
		{
			idc = 212;
			x = 0.3875 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_13: ct_screen_base
		{
			idc = 213;
			x = 0.5125 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_14: ct_screen_base
		{
			idc = 214;
			x = 0.6375 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_15: ct_screen_base
		{
			idc = 215;
			x = 0.7625 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_16: ct_screen_base
		{
			idc = 216;
			x = 0.8875 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_17: ct_screen_base
		{
			idc = 217;
			x = 0.0125 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_18: ct_screen_base
		{
			idc = 218;
			x = 0.1375 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_19: ct_screen_base
		{
			idc = 219;
			x = 0.2625 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_20: ct_screen_base
		{
			idc = 220;
			x = 0.3875 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_21: ct_screen_base
		{
			idc = 221;
			x = 0.5125 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_22: ct_screen_base
		{
			idc = 222;
			x = 0.6375 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_23: ct_screen_base
		{
			idc = 223;
			x = 0.7625 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_24: ct_screen_base
		{
			idc = 224;
			x = 0.8875 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_25: ct_screen_base
		{
			idc = 225;
			x = 0.0125 * safezoneW + safezoneX;
			y = 0.82 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_26: ct_screen_base
		{
			idc = 226;
			x = 0.1375 * safezoneW + safezoneX;
			y = 0.82 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_27: ct_screen_base
		{
			idc = 227;
			x = 0.2625 * safezoneW + safezoneX;
			y = 0.82 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_28: ct_screen_base
		{
			idc = 228;
			x = 0.3875 * safezoneW + safezoneX;
			y = 0.82 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_29: ct_screen_base
		{
			idc = 229;
			x = 0.5125 * safezoneW + safezoneX;
			y = 0.82 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_30: ct_screen_base
		{
			idc = 230;
			x = 0.6375 * safezoneW + safezoneX;
			y = 0.82 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_31: ct_screen_base
		{
			idc = 231;
			x = 0.7625 * safezoneW + safezoneX;
			y = 0.82 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class screen_32: ct_screen_base
		{
			idc = 232;
			x = 0.8875 * safezoneW + safezoneX;
			y = 0.82 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.16 * safezoneH;
		};
		
		//SCREEN TEXTS 400
		class screen_01_text: ct_screenText_base
		{
			idc = 401;
			x = 0.0125 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class screen_02_text: ct_screenText_base
		{
			idc = 402;
			x = 0.1375 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class screen_03_text: ct_screenText_base
		{
			idc = 403;
			x = 0.2625 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class screen_04_text: ct_screenText_base
		{
			idc = 404;
			x = 0.3875 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class screen_05_text: ct_screenText_base
		{
			idc = 405;
			x = 0.5125 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_06_text: ct_screenText_base
		{
			idc = 406;
			x = 0.6375 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_07_text: ct_screenText_base
		{
			idc = 407;
			x = 0.7625 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_08_text: ct_screenText_base
		{
			idc = 408;
			x = 0.8875 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_09_text: ct_screenText_base
		{
			idc = 409;
			x = 0.0125 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_10_text: ct_screenText_base
		{
			idc = 410;
			x = 0.1375 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_11_text: ct_screenText_base
		{
			idc = 411;
			x = 0.2625 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_12_text: ct_screenText_base
		{
			idc = 412;
			x = 0.3875 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_13_text: ct_screenText_base
		{
			idc = 413;
			x = 0.5125 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_14_text: ct_screenText_base
		{
			idc = 414;
			x = 0.6375 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_15_text: ct_screenText_base
		{
			idc = 415;
			x = 0.7625 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_16_text: ct_screenText_base
		{
			idc = 416;
			x = 0.8875 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_17_text: ct_screenText_base
		{
			idc = 417;
			x = 0.0125 * safezoneW + safezoneX;
			y = 0.74 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_18_text: ct_screenText_base
		{
			idc = 418;
			x = 0.1375 * safezoneW + safezoneX;
			y = 0.74 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_19_text: ct_screenText_base
		{
			idc = 419;
			x = 0.2625 * safezoneW + safezoneX;
			y = 0.74 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_20_text: ct_screenText_base
		{
			idc = 420;
			x = 0.3875 * safezoneW + safezoneX;
			y = 0.74 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_21_text: ct_screenText_base
		{
			idc = 421;
			x = 0.5125 * safezoneW + safezoneX;
			y = 0.74 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_22_text: ct_screenText_base
		{
			idc = 422;
			x = 0.6375 * safezoneW + safezoneX;
			y = 0.74 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_23_text: ct_screenText_base
		{
			idc = 423;
			x = 0.7625 * safezoneW + safezoneX;
			y = 0.74 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_24_text: ct_screenText_base
		{
			idc = 424;
			x = 0.8875 * safezoneW + safezoneX;
			y = 0.74 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_25_text: ct_screenText_base
		{
			idc = 425;
			x = 0.0125 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_26_text: ct_screenText_base
		{
			idc = 426;
			x = 0.1375 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_27_text: ct_screenText_base
		{
			idc = 427;
			x = 0.2625 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_28_text: ct_screenText_base
		{
			idc = 428;
			x = 0.3875 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_29_text: ct_screenText_base
		{
			idc = 429;
			x = 0.5125 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_30_text: ct_screenText_base
		{
			idc = 430;
			x = 0.6375 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_31_text: ct_screenText_base
		{
			idc = 431;
			x = 0.7625 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
		class screen_32_text: ct_screenText_base
		{
			idc = 432;
			x = 0.8875 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;			
		};
	};
};
