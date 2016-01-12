class ct_object_library
{
	name = "ct_object_library";
	idd = 25250;
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
			y = 0.175 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.036 * safezoneH;
		};
		class renameCat_but: ct_button_base
		{
			idc = 101;
			text = $STR_A3_collection_library_rename;
			x = 0.45 * safezoneW + safezoneX;
			y = 0.175 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.036 * safezoneH;
		};

		//TREES - 200

		class config_tree: ct_tree_base
		{
			idc = 200;
			x = 0.015313 * safezoneW + safezoneX;
			y = 0.1612 * safezoneH + safezoneY;
			w = (0.175313 + 0.073) * safezoneW;
			h = 0.8228 * safezoneH;
			sizeEx = 0.038;
			multiselectEnabled = 1;
		};
		
		//LISTS - 250
		
		class content_list: ct_list_base
		{
			idc = 250;
			x = 0.28 * safezoneW + safezoneX;
			y = 0.27 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.7 * safezoneH;
		};
		class categories_list: ct_list_base
		{
			idc = 251;
			x = 0.28 * safezoneW + safezoneX;
			y = 0.02 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.245 * safezoneH;
		};

		//COMBOBOXES - 300

		class sort_by_combo: ct_combo_base
		{
			idc = 300;
			x = 0.065 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.117 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.038;
			rowHeight = 0.038;
			wholeHeight = 10 * 0.038;
		};
		class group_by_combo: ct_combo_base
		{
			idc = 301;
			x = 0.065 * safezoneW + safezoneX;
			y = 0.05 * safezoneH + safezoneY;
			w = 0.117 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.038;
			rowHeight = 0.038;
			wholeHeight = 10 * 0.038;
		};
		class mod_combo: ct_combo_base
		{
			idc = 302;
			x = 0.21 * safezoneW + safezoneX;
			y = 0.12 * safezoneH + safezoneY;
			w = 0.055 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.038;
			rowHeight = 0.038;
			wholeHeight = 10 * 0.038;
		};

		//EDITS - 400

		class search_edit: ct_edit_base
		{
			idc = 400;
			text = "";
			x = 0.065 * safezoneW + safezoneX;
			y = 0.114 * safezoneH + safezoneY;
			w = 0.117 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class new_cat_edit: ct_edit_base
		{
			idc = 401;
			x = 0.45 * safezoneW + safezoneX;
			y = 0.227 * safezoneH + safezoneY;
			w = 0.093 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class model_edit: ct_edit_base
		{
			idc = 402;
			text = "";
			x = 0.687 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.0242 * safezoneH;
			canModify = 0;
		};
		class scope_edit: ct_edit_base
		{
			idc = 403;
			text = "";
			x = 0.687 * safezoneW + safezoneX;
			y = 0.0611185 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.0242 * safezoneH;
			canModify = 0;
		};
		class calssname_edit: ct_edit_base
		{
			idc = 404;
			text = "";
			x = 0.687 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.0242 * safezoneH;
			canModify = 0;
		};
		class displayname_edit: ct_edit_base
		{
			idc = 405;
			text = "";
			x = 0.687 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.0242 * safezoneH;
			canModify = 0;
		};
		class mapSize_edit: ct_edit_base
		{
			idc = 406;
			text = "";
			x = 0.687 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.0242 * safezoneH;
			canModify = 0;
		};
		class mod_edit: ct_edit_base
		{
			idc = 407;
			text = "";
			x = 0.687 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.0242 * safezoneH;
			canModify = 0;
		};
		
		//CHECKBOXES - 500

		class exclude_scope_0_check: ct_check_base
		{
			idc = 500;
			x = 0.191 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.0144 * safezoneW;
			h = 0.0264 * safezoneH;
		};
		class exclude_scope_1_check: ct_check_base
		{
			idc = 501;
			x = 0.191 * safezoneW + safezoneX;
			y = 0.054 * safezoneH + safezoneY;
			w = 0.0144 * safezoneW;
			h = 0.0264 * safezoneH;
		};
		class exclude_empty_model_check: ct_check_base
		{
			idc = 502;
			x = 0.191 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.0144 * safezoneW;
			h = 0.0264 * safezoneH;
		};

		//TEXTS - 700

		class sort_by_text: ct_text_base
		{
			idc = 700;
			text = $STR_A3_object_library_sort_by_text;
			x = 0.0235 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.039 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "right";
			};
		};
		class groupby_text: ct_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_groupby_text;
			x = 0.0235 * safezoneW + safezoneX;
			y = 0.05 * safezoneH + safezoneY;
			w = 0.039 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "right";
			};
		};
		class Configentries_text: ct_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_Configentries_text;
			x = 0.0173751 * safezoneW + safezoneX;
			y = 0.1326 * safezoneH + safezoneY;
			w = 0.105186 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class search_text: ct_text_base
		{
			idc = 701;
			text = $STR_A3_object_library_search_text;
			x = 0.0235 * safezoneW + safezoneX;
			y = 0.114 * safezoneH + safezoneY;
			w = 0.039 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "right";
			};
		};
		class exclude_scope_0_text: ct_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_exclude_scope_0_text;
			x = 0.207 * safezoneW + safezoneX;
			y = 0.029 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class exclude_scope_1_text: ct_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_exclude_scope_1_text;
			x = 0.207 * safezoneW + safezoneX;
			y = 0.058 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class exclude_empty_model_text: ct_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_exclude_empty_model_text;
			x = 0.207 * safezoneW + safezoneX;
			y = 0.084 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "left";
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
		class scope_text: ct_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_scope_text;
			x = 0.61 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
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
			y = 0.093 * safezoneH + safezoneY;
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
			y = 0.126 * safezoneH + safezoneY;
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
			y = 0.159 * safezoneH + safezoneY;
			w = 0.066 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "right";
			};
		};
		class mod_text2: ct_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_mod_text;
			x = 0.61 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.066 * safezoneW;
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
			y = 0.145 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class library_text: ct_text_base
		{
			idc = -1;
			text = $STR_A3_object_library_lib_text;
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
