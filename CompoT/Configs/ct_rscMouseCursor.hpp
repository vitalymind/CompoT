class ct_mouseCursor
{
	name = "ct_mouseCursor";
	idd = 25252;
	movingEnable = false; 
	enableSimulation = true; 
	class Controls
	{
		//BACKGROUND
		class main_background: ct_background_base
		{
			idc = 100;
			text = "";
			x = safezoneX;
			y = safezoneY;
			w = safezoneW;
			h = safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class frame_background: ct_background_base
		{
			idc = 102;
			x = -10;
			y = -10;
			w = 0;
			h = 0;
			colorBackground[] = {0,1,0,0.5};
		};
		class frame: ct_background_base
		{
			idc = 101;
			x = -10;
			y = -10;
			w = 0;
			h = 0;
			style = 64; 
			colorText[] = {0,1,0,1};
		};
	};
};
