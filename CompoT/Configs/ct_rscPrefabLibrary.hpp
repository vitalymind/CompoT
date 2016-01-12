class ct_prefab_library
{
	name = "ct_prefab_library";
	idd = 25258;
	movingEnable = false; 
	enableSimulation = true; 
	class Controls
	{
		
		//BACKGROUND
		
		class background_1: ct_background_base
		{
			idc = -1;
			text = "";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0.45 * safezoneW;
			h = 1 * safezoneH;
		};
		class background_2: ct_background_base
		{
			idc = -1;
			text = "";
			x = 0.45 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0.55 * safezoneW;
			h = 0.26 * safezoneH;
		};

		//BUTTONS - 100

		class newCat_but: ct_button_base
		{
			idc = 100;
			text = $STR_A3_collection_library_create;
			x = 0.497 * safezoneW + safezoneX;
			y = 0.05 * safezoneH + safezoneY;
			w = 0.045 * safezoneW;
			h = 0.036 * safezoneH;
		};
		class newPref_but: ct_button_base
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
		class renamePref_but: ct_button_base
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
		class prefabs_list: ct_list_base
		{
			idc = 251;
			x = 0.28 * safezoneW + safezoneX;
			y = 0.145 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.12 * safezoneH;
		};
		class prefContent_list: ct_list_base
		{
			idc = 252;
			x = 0.28 * safezoneW + safezoneX;
			y = 0.27 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.7 * safezoneH;
		};
		class objects_list: ct_list_base
		{
			idc = 253;
			x = 0.63125 * safezoneW + safezoneX;
			y = 0.04 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class compositions_list: ct_list_base
		{
			idc = 254;
			x = 0.725 * safezoneW + safezoneX;
			y = 0.04 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class collections_list: ct_list_base
		{
			idc = 255;
			x = 0.81875 * safezoneW + safezoneX;
			y = 0.04 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class prefab_list: ct_list_base
		{
			idc = 256;
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.04 * safezoneH + safezoneY;
			w = 0.08125 * safezoneW;
			h = 0.16 * safezoneH;
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

		class newCat_edit: ct_edit_base
		{
			idc = 400;
			text = "";
			x = 0.45 * safezoneW + safezoneX;
			y = 0.102 * safezoneH + safezoneY;
			w = 0.093 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class newPref_edit: ct_edit_base
		{
			idc = 401;
			text = "";
			x = 0.45 * safezoneW + safezoneX;
			y = 0.224 * safezoneH + safezoneY;
			w = 0.093 * safezoneW;
			h = 0.03 * safezoneH;
		};
		
		//FIELDS
		
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
		class prefabs_text: ct_text_base
		{
			idc = -1;
			text = $STR_A3_prefab_library_prefabs;
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
		class library_text: ct_text_base
		{
			idc = -1;
			text = $STR_A3_prefab_library_lib;
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
		class size_field_text: ct_text_base
		{
			idc = -1;
			text = $STR_A3_composition_library_size;
			x = 0.542 * safezoneW + safezoneX;
			y = 0.02 * safezoneH + safezoneY;
			w = 0.026 * safezoneW;
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
			x = 0.542 * safezoneW + safezoneX;
			y = 0.056 * safezoneH + safezoneY;
			w = 0.026 * safezoneW;
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
			x = 0.542 * safezoneW + safezoneX;
			y = 0.092 * safezoneH + safezoneY;
			w = 0.026 * safezoneW;
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
			x = 0.542 * safezoneW + safezoneX;
			y = 0.128 * safezoneH + safezoneY;
			w = 0.026 * safezoneW;
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
			x = 0.542 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.026 * safezoneW;
			h = 0.03 * safezoneH;
			Size = 0.034; 
			class Attributes 
			{
				align = "right";
			};
		};
	};
};
