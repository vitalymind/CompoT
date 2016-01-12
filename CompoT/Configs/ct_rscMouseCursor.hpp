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
	};
};
