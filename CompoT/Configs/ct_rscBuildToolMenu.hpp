class ct_buildToolMenu
{
	name = "ct_buildToolMenu";
	idd = 25253;
	movingEnable = false; 
	enableSimulation = true; 
	class Controls
	{
		class but_object: ct_button_base
		{
			idc = 100;
			text = $STR_A3_build_tool_menu_objects_but;
			x = 0.35 * safezoneW + safezoneX;
			y = 0.355 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class but_composition: ct_button_base
		{
			idc = 101;
			text = $STR_A3_build_tool_menu_composition_but;
			x = 0.35 * safezoneW + safezoneX;
			y = 0.485 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class but_collections: ct_button_base
		{
			idc = 102;
			text = $STR_A3_build_tool_menu_collections_but;
			x = 0.56 * safezoneW + safezoneX;
			y = 0.355 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class but_prefabs: ct_button_base
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
