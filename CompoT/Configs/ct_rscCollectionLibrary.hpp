class ct_collection_library
{
	name = "ct_collection_library";
	idd = 25257;
	movingEnable = false; 
	enableSimulation = true; 
	class Controls
	{
		
		//BACKGROUND
		
		class main_background: ct_background_base
		{
			idc = -1;
			text = "";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
		};

		//BUTTONS - 100

		class newcat_but: ct_button_base
		{
			idc = 100;
			text = $STR_A3_collection_library_create;
			x = 0.497 * safezoneW + safezoneX;
			y = 0.05 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.036 * safezoneH;
		};
		class newcol_but: ct_button_base
		{
			idc = 101;
			text = $STR_A3_collection_library_create;
			x = 0.497 * safezoneW + safezoneX;
			y = 0.172 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.036 * safezoneH;
		};
		class renameCat_but: ct_button_base
		{
			idc = 102;
			text = $STR_A3_collection_library_rename;
			x = 0.45 * safezoneW + safezoneX;
			y = 0.05 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.036 * safezoneH;
		};
		class renameCol_but: ct_button_base
		{
			idc = 103;
			text = $STR_A3_collection_library_rename;
			x = 0.45 * safezoneW + safezoneX;
			y = 0.172 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.036 * safezoneH;
		};
		
		//TREES - 200

		class objects_tree: ct_tree_base
		{
			idc = 200;
			x = 0.015 * safezoneW + safezoneX;
			y = 0.142 * safezoneH + safezoneY;
			w = 0.248 * safezoneW;
			h = 0.823 * safezoneH;
		};
		
		//LISTS - 250
		
		class categories_list: ct_list_base
		{
			idc = 250;
			x = 0.28 * safezoneW + safezoneX;
			y = 0.02 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.12 * safezoneH;
		};
		class collections_list: ct_list_base
		{
			idc = 251;
			x = 0.28 * safezoneW + safezoneX;
			y = 0.145 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.12 * safezoneH;
		};
		class colContent_list: ct_list_base
		{
			idc = 252;
			x = 0.28 * safezoneW + safezoneX;
			y = 0.27 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.7 * safezoneH;
		};

		//COMBOBOXES - 300

		class sort_by_combo: ct_combo_base
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
		class group_by_combo: ct_combo_base
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
		
		class search_edit: ct_edit_base
		{
			idc = 407;
			text = "";
			x = 0.072 * safezoneW + safezoneX;
			y = 0.106 * safezoneH + safezoneY;
			w = 0.117 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class newcat_edit: ct_edit_base
		{
			idc = 400;
			text = "";
			x = 0.45 * safezoneW + safezoneX;
			y = 0.102 * safezoneH + safezoneY;
			w = 0.093 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class newCol_edit: ct_edit_base
		{
			idc = 406;
			text = "";
			x = 0.45 * safezoneW + safezoneX;
			y = 0.224 * safezoneH + safezoneY;
			w = 0.093 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class model_edit: ct_edit_base
		{
			idc = 401;
			text = "";
			x = 0.687 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.174 * safezoneW;
			h = 0.0242 * safezoneH;
			canModify = 0;
		};
		class calssname_edit: ct_edit_base
		{
			idc = 403;
			text = "";
			x = 0.687 * safezoneW + safezoneX;
			y = 0.0611185 * safezoneH + safezoneY;
			w = 0.174 * safezoneW;
			h = 0.0242 * safezoneH;
			canModify = 0;
		};
		class displayname_edit: ct_edit_base
		{
			idc = 404;
			text = "";
			x = 0.687 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.174 * safezoneW;
			h = 0.0242 * safezoneH;
			canModify = 0;
		};
		class mapSize_edit: ct_edit_base
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

		class sort_by_text: ct_text_base
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
		class categories_text: ct_text_base
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
		class collections_text: ct_text_base
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
		class groupby_text: ct_text_base
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
		class search_text: ct_text_base
		{
			idc = 700;
			text = $STR_A3_object_library_search_text;
			x = 0.018 * safezoneW + safezoneX;
			y = 0.0982 * safezoneH + safezoneY;
			w = 0.047 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "right";
			};
		};
		class model_text: ct_text_base
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
		class classname_text: ct_text_base
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
		class dispalyname_text: ct_text_base
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
		class mapsize_text: ct_text_base
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
		class library_text: ct_text_base
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

		class preview_display: ct_3dpreview_base
		{
			idc = 600;
			x = 0.508659 * safezoneW + safezoneX;
			y = 0.2324 * safezoneH + safezoneY;
			w = 0.45375 * safezoneW;
			h = 0.693 * safezoneH;
		};

	};
};
