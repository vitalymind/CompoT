class ct_composition_library
{
	name = "ct_composition_library";
	idd = 25256;
	movingEnable = false; 
	enableSimulation = true; 
	class Controls
	{
		//BACKGROUND
		class background1: ct_background_base
		{
			idc = -1;
			text = "";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0.44 * safezoneW;
			h = 1 * safezoneH;
		};
		class background2: ct_background_base
		{
			idc = -1;
			text = "";
			x = 0.44 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0.56 * safezoneW;
			h = 0.21 * safezoneH;
		};
		
		//LISTS - 100
		class listLeft_list: ct_list_base
		{
			idc = 100;
			x = 0.018 * safezoneW + safezoneX;
			y = 0.19 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.8 * safezoneH;
			canDrag = 1;
		};
		class listRight_list: ct_list_base
		{
			idc = 101;
			x = 0.23 * safezoneW + safezoneX;
			y = 0.19 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.8 * safezoneH;
			canDrag = 1;
		};
		class objects_list: ct_list_base
		{
			idc = 102;
			x = 0.63125 * safezoneW + safezoneX;
			y = 0.04 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class compositions_list: ct_list_base
		{
			idc = 103;
			x = 0.725 * safezoneW + safezoneX;
			y = 0.04 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class collections_list: ct_list_base
		{
			idc = 104;
			x = 0.81875 * safezoneW + safezoneX;
			y = 0.04 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class prefabs_list: ct_list_base
		{
			idc = 105;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.04 * safezoneH + safezoneY;
			w = 0.08125 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class categories_list: ct_list_base
		{
			idc = 106;
			x = 0.23 * safezoneW + safezoneX;
			y = 0.02 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.12 * safezoneH;
		};
		
		//COMBOBOXES - 200
		class catLeft_combo: ct_combo_base
		{
			idc = 200;
			x = 0.018 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.033 * safezoneH;
			rowHeight = 0.038;
			wholeHeight = 30 * 0.038;
		};
		class catRight_combo: ct_combo_base
		{
			idc = 201;
			x = 0.23 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.033 * safezoneH;
			rowHeight = 0.038;
			wholeHeight = 30 * 0.038;
		};
		
		//CHECKBOX - 300
		class exclude_temp_check: ct_check_base
		{
			idc = 300;
			x = 0.02125 * safezoneW + safezoneX;
			y = 0.052 * safezoneH + safezoneY;
			w = 0.0144377 * safezoneW;
			h = 0.0264 * safezoneH;
		};
		
		//EDITS - 400
		class rename_edit: ct_edit_base
		{
			idc = 400;
			text = "";
			x = 0.01875 * safezoneW + safezoneX;
			y = 0.102 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class newcat_edit: ct_edit_base
		{
			idc = 401;
			text = "";
			x = 0.401 * safezoneW + safezoneX;
			y = 0.102 * safezoneH + safezoneY;
			w = 0.093 * safezoneW;
			h = 0.03 * safezoneH;
		};
		
		//BUTTONS - 500
		class rename_but: ct_button_base
		{
			idc = 500;
			text = $STR_A3_composition_library_rename;
			x = 0.16 * safezoneW + safezoneX;
			y = 0.05 * safezoneH + safezoneY;
			w = 0.055 * safezoneW;
			h = 0.036 * safezoneH;
		};
		class newcat_but: ct_button_base
		{
			idc = 501;
			text = $STR_A3_composition_library_newcat;
			x = 0.447 * safezoneW + safezoneX;
			y = 0.05 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.036 * safezoneH;
		};
		class renameCat_but: ct_button_base
		{
			idc = 502;
			text = $STR_A3_composition_library_rename;
			x = 0.401 * safezoneW + safezoneX;
			y = 0.05 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.036 * safezoneH;
		};
		
		//TEXTS - 600
		class categories_text: ct_text_base
		{
			idc = -1;
			text = $STR_A3_collection_library_lib_categories;
			x = 0.404 * safezoneW + safezoneX;
			y = 0.02 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class size_field: ct_text_base
		{
			idc = 600;
			text = "";
			x = 0.57 * safezoneW + safezoneX;
			y = 0.02 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class objects_field: ct_text_base
		{
			idc = 601;
			text = "";
			x = 0.57 * safezoneW + safezoneX;
			y = 0.056 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class compositions_field: ct_text_base
		{
			idc = 602;
			text = "";
			x = 0.57 * safezoneW + safezoneX;
			y = 0.092 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class collections_field: ct_text_base
		{
			idc = 603;
			text = "";
			x = 0.57 * safezoneW + safezoneX;
			y = 0.128 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class prefabs_field: ct_text_base
		{
			idc = 604;
			text = "";
			x = 0.57 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class exclude_temp_text: ct_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_exclude;
			x = 0.0385 * safezoneW + safezoneX;
			y = 0.0528 * safezoneH + safezoneY;
			w = 0.1215 * safezoneW;
			h = 0.03 * safezoneH;
			class Attributes 
			{
				align = "left";
			};
		};
		class size_field_text: ct_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_size;
			x = 0.508 * safezoneW + safezoneX;
			y = 0.02 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "right";
			};
		};
		class objects_field_text: ct_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_objects_field;
			x = 0.508 * safezoneW + safezoneX;
			y = 0.056 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "right";
			};
		};
		class compositions_field_text: ct_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_compositions_field;
			x = 0.508 * safezoneW + safezoneX;
			y = 0.092 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "right";
			};
		};
		class collections_field_text: ct_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_collections_field;
			x = 0.508 * safezoneW + safezoneX;
			y = 0.128 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "right";
			};
		};
		class prefabs_field_text: ct_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_prefabs_field;
			x = 0.508 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "right";
			};
		};
		class objectsList_text: ct_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_objects;
			x = 0.63 * safezoneW + safezoneX;
			y = 0.014 * safezoneH + safezoneY;
			w = 0.083 * safezoneW;
			h = 0.026 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "left";
			};
		};
		class compositionsList_text: ct_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_compositions;
			x = 0.72 * safezoneW + safezoneX;
			y = 0.014 * safezoneH + safezoneY;
			w = 0.088 * safezoneW;
			h = 0.026 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "left";
			};
		};
		class collectionsList_text: ct_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_collections;
			x = 0.815 * safezoneW + safezoneX;
			y = 0.014 * safezoneH + safezoneY;
			w = 0.083 * safezoneW;
			h = 0.026 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "left";
			};
		};
		class prefabsList_text: ct_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_prefabs;
			x = 0.91 * safezoneW + safezoneX;
			y = 0.014 * safezoneH + safezoneY;
			w = 0.083 * safezoneW;
			h = 0.026 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "left";
			};
		};
		class library_text: ct_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_library;
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
};
