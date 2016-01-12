class ct_saveComposition
{
	name = "ct_saveComposition";
	idd = 25254;
	movingEnable = false; 
	enableSimulation = true; 
	class Controls
	{
		class background: ct_background_base
		{
			idc = -1;
			text = "";
			x = 0.360737 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.283684 * safezoneW;
			h = 0.25 * safezoneH;
		};
		class cat_list: ct_list_base
		{
			idc = 100;
			x = 0.371053 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.108316 * safezoneW;
			h = 0.184 * safezoneH;
		};
		class name_field: ct_edit_base
		{
			idc = 200;
			x = 0.489684 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.144421 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ok_but: ct_button_base
		{
			idc = 300;
			x = 0.494842 * safezoneW + safezoneX;
			y = 0.53 * safezoneH + safezoneY;
			w = 0.0618947 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class cancel_but: ct_button_base
		{
			idc = 301;
			x = 0.57221 * safezoneW + safezoneX;
			y = 0.53 * safezoneH + safezoneY;
			w = 0.0618947 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class cat_text: ct_text_base
		{
			idc = -1;
			text = "Categories";
			x = 0.371053 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0567368 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class name_text: ct_text_base
		{
			idc = -1;
			text = "Composition name";
			x = 0.489 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class keepName_text: ct_text_base
		{
			idc = -1;
			text = "keep name";
			x = 0.572 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class info_text: ct_text_base
		{
			idc = 400;
			x = 0.494842 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.139263 * safezoneW;
			h = 0.096 * safezoneH;
		};
		class keepName_check: ct_check_base
		{
			idc = 500;
			x = 0.6182 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0144 * safezoneW;
			h = 0.0264 * safezoneH;
		};
	};
};
